using GenKFI.Properties;
using System;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;

namespace GenKFI.noFront
{
    /// <summary>
    /// Summary description for <see cref="DoLookup"/>
    /// </summary>
    public class DoLookup : IHttpHandler
	{
		private class DataHolder
		{
			// the data needed
			public string fstrListFormatName = "";
			public string fstrFirstName = "";
			public string fstrMiddleName = "";
			public string fstrFamilyName = "";
			public string fstrSuffix = "";
			public string fstrStreet = "";
			public string fstrCity = "";
			public string fstrState = "";
			public string fstrZip = "";
			public string fstrCountry = "";
			public string fstrID = "";
            public string fstrRealIdType = "";
			// some extra data for the joint filer check
			public long flngKey = 0;
			public string fstrJointID = "";

            public string fromTbl = "";
		}

		public void ProcessRequest( HttpContext context )
		{
			GoodConn lookupGC = new GoodConn();
			// return type is text
			context.Response.ContentType = "application/json";
			
			try
			{
				lookupGC.Connect( Resources.lookupConnString );
				string theID = context.Request.QueryString[ "id" ];
				string idType = UtilClass.Sanitize( context.Request.QueryString[ "idtype" ] );
                string acctType = UtilClass.Sanitize(context.Request.QueryString["accttype"]);
                // Check if PNW or PSN
                if (acctType == "PNW")
                    acctType = "PIT";
                if (acctType == "PSN")
                    acctType = "PIT";

                // SSNs are for people, people can also have ITINs and PSSNs
                if ( idType == "SSN" )
					idType = "SSN', 'ITIN', 'PSSN";
                if (idType == "EIN")
                    idType = "EIN', 'PEIN";
                if (idType == "FIS")
                    idType = "EIN', 'PEIN', 'ITIN', 'PSSN', 'SSN";
                if (idType == "OGT")
                {
                    idType = "OGRID', 'ACC";
                    if (theID.Length < 9)
                    {
                        if (long.TryParse(theID, out long lngId))
                        {
                            theID = lngId.ToString();
                        }
                    }
                }
				// add the quotes for the strings
				idType = "'" + idType + "'";

				// retrieve the data for the sent ID
                DataHolder data1 = GetData(theID, idType, acctType, lookupGC);
				DataHolder data2 = new DataHolder();
				// if we got data, check for the joint filer
				if( data1 != null && data1.fstrJointID != "" )
                    data2 = GetData(data1.fstrJointID.ToString(), idType, acctType, lookupGC, data1.fromTbl); 

				lookupGC.Disconnect();

				// write data on context.Response.Write()
				JavaScriptSerializer serializer = new JavaScriptSerializer();
				context.Response.Write( "{\"primary\":" + serializer.Serialize( data1 ) + ", \"secondary\":" + serializer.Serialize( data2 ) + "}" );

			}
			catch( Exception ex )
			{
				lookupGC.Disconnect();
				GoodConn gc = new GoodConn();
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}

		}

		// given the parameters, gets the data
		// gc must be connected and open
		// idType is used in an IN () clause, format it wisely
		// sanitize your imputs first
        private DataHolder GetData(string id, string idType, string acctType, GoodConn lookupGC, string checkTables = "acct;cus")
		{
			DataHolder ret = new DataHolder();
			string statement = "";
			int numRows = 0;
			DataTable dt = new DataTable();

			if( !lookupGC.IsOpen )
				return ret;

			try
			{
				// we start with the account table, if requested
				if( checkTables.IndexOf( "acct" ) != -1 )
				{
                    if ((id.Length < 8) && (idType.Contains("OGRID")))
                    {
                        statement += "SELECT acct.fstrListFormatName, ";
                        statement += "acct.fstrFirstName, ";
                        statement += "acct.fstrMiddleName, ";
                        statement += "acct.fstrFamilyName, ";
                        statement += "acct.fstrSuffix, ";
                        statement += "acct.fstrStreet, ";
                        statement += "acct.fstrCity, ";
                        statement += "acct.fstrState, ";
                        statement += "acct.fstrZip, ";
                        statement += "acct.fstrCountry, ";
                        statement += "acct.flngAccountKey, ";
                        statement += "acct.flngJointAccountKey, ";
                        statement += "id.fstrIdType as fstrRealIdType ";
                        statement += "FROM tblAccountInfo acct, tblId id ";
                        statement += "WHERE id.fstrID = '" + id + "' AND ";
                        statement += "id.fstrIdType IN ( " + idType + " ) AND ";
                        statement += "id.flngVer = 0 AND ";
                        statement += "id.fblnActive = 1 AND ";
                        statement += "acct.fintParentProfileNumber = id.fintProfileNumber AND ";
                        statement += "acct.flngCustomerKey = id.flngCustomerKey AND ";
                        statement += "acct.fstrAccountType = 'OGT' ";
                    }
                    else
                    {
                        // we've been given the tags we need to do the search
                        statement += "SELECT acct.fstrListFormatName, ";
                        statement += "acct.fstrFirstName, ";
                        statement += "acct.fstrMiddleName, ";
                        statement += "acct.fstrFamilyName, ";
                        statement += "acct.fstrSuffix, ";
                        statement += "acct.fstrStreet, ";
                        statement += "acct.fstrCity, ";
                        statement += "acct.fstrState, ";
                        statement += "acct.fstrZip, ";
                        statement += "acct.fstrCountry, ";
                        statement += "acct.flngAccountKey, ";
                        statement += "acct.flngJointAccountKey, ";
                        statement += "id.fstrIdType as fstrRealIdType ";
                        statement += "FROM tblAccountInfo acct, tblId id ";
                        statement += "WHERE id.fstrID = '" + id + "' AND ";
                        statement += "id.fstrIdType IN ( " + idType + " ) AND ";
                        statement += "id.flngVer = 0 AND ";
                        statement += "id.fblnActive = 1 AND ";
                        statement += "acct.flngCustomerKey = id.flngCustomerKey AND ";
                        statement += "acct.fstrAccountType = '" + acctType + "' ";
                    }

					lookupGC.DoSelect( statement );
					dt = new DataTable();
					numRows = lookupGC.ReadSelect( out dt );
					if( numRows > 0 )
					{
						// build return
						ret.fstrListFormatName = dt.Rows[ 0 ][ "fstrListFormatName" ].ToString();
						ret.fstrFirstName = dt.Rows[ 0 ][ "fstrFirstName" ].ToString();
						ret.fstrMiddleName = dt.Rows[ 0 ][ "fstrMiddleName" ].ToString();
						ret.fstrFamilyName = dt.Rows[ 0 ][ "fstrFamilyName" ].ToString();
						ret.fstrSuffix = dt.Rows[ 0 ][ "fstrSuffix" ].ToString();
						ret.fstrStreet = dt.Rows[ 0 ][ "fstrStreet" ].ToString();
						ret.fstrCity = dt.Rows[ 0 ][ "fstrCity" ].ToString();
						ret.fstrState = dt.Rows[ 0 ][ "fstrState" ].ToString();
						ret.fstrZip = dt.Rows[ 0 ][ "fstrZip" ].ToString();
						ret.fstrCountry = dt.Rows[ 0 ][ "fstrCountry" ].ToString();
						ret.fstrID = id;
                        ret.fstrRealIdType = dt.Rows[0]["fstrRealIdType"].ToString();
						ret.flngKey = long.Parse( dt.Rows[ 0 ][ "flngAccountKey" ].ToString() );
						// now also get the joint ID, if there
						if(( dt.Rows[ 0 ][ "flngJointAccountKey" ].ToString() != "0" ) && (acctType == "PIT"))
						{
                            statement = "SELECT fstrId FROM tblId WHERE flngVer = 0 and fblnActive = 1 and fstrIdType IN ( " + idType + " ) AND flngCustomerKey = ( ";
                            statement += "SELECT DISTINCT flngCustomerKey FROM tblId WHERE flngVer = 0 AND fblnActive = 1 AND flngAccountKey = '" + dt.Rows[0]["flngJointAccountKey"].ToString() + "') ";
//							statement = "SELECT fstrId FROM tblId WHERE flngAccountKey = '" + dt.Rows[ 0 ][ "flngJointAccountKey" ].ToString() + "' AND fstrIdType IN ( " + idType + " )";
//                            statement += " AND fblnActive = 1 AND flngVer = 0";
                            object val = lookupGC.DoScalar( statement );
                            if (val != null)
                                ret.fstrJointID = val.ToString();
						}
						ret.fromTbl = "acct";
					}
				}

				// if not in "ACCOUNT" table try "CUSTOMER" table, if requested
				if( numRows == 0 && checkTables.IndexOf( "cus") != -1 )
				{
					statement = "SELECT cus.fstrListFormatName, ";
					statement += "cus.fstrFirstName, ";
					statement += "cus.fstrMiddleName, ";
					statement += "cus.fstrFamilyName, ";
					statement += "cus.fstrSuffix, ";
					statement += "cus.fstrStreet, ";
					statement += "cus.fstrCity, ";
					statement += "cus.fstrState, ";
					statement += "cus.fstrZip, ";
					statement += "cus.fstrCountry, ";
					statement += "cus.flngCustomerKey, ";
					statement += "cus.flngJointCustomerKey, ";
                    statement += "id.fstrIdType as fstrRealIdType ";
					statement += "FROM tblCustomerInfo cus, tblId id ";
					statement += "WHERE id.fstrID = '" + id + "' AND ";
					statement += "id.fstrIdType IN ( " + idType + " ) AND ";
                    statement += "id.flngVer = 0 AND ";
                    statement += "id.fblnActive = 1 AND ";
					statement += "cus.flngCustomerKey = id.flngCustomerKey";

					lookupGC.DoSelect( statement );
					dt = new DataTable();
					numRows = lookupGC.ReadSelect( out dt );
					if( numRows > 0 )
					{
						// build return
						ret.fstrListFormatName = dt.Rows[ 0 ][ "fstrListFormatName" ].ToString();
						ret.fstrFirstName = dt.Rows[ 0 ][ "fstrFirstName" ].ToString();
						ret.fstrMiddleName = dt.Rows[ 0 ][ "fstrMiddleName" ].ToString();
						ret.fstrFamilyName = dt.Rows[ 0 ][ "fstrFamilyName" ].ToString();
						ret.fstrSuffix = dt.Rows[ 0 ][ "fstrSuffix" ].ToString();
						ret.fstrStreet = dt.Rows[ 0 ][ "fstrStreet" ].ToString();
						ret.fstrCity = dt.Rows[ 0 ][ "fstrCity" ].ToString();
						ret.fstrState = dt.Rows[ 0 ][ "fstrState" ].ToString();
						ret.fstrZip = dt.Rows[ 0 ][ "fstrZip" ].ToString();
						ret.fstrCountry = dt.Rows[ 0 ][ "fstrCountry" ].ToString();
						ret.fstrID = id;
                        ret.fstrRealIdType = dt.Rows[0]["fstrRealIdType"].ToString();
                        ret.flngKey = long.Parse(dt.Rows[0]["flngCustomerKey"].ToString());
						// now also get the joint ID, if there
						if(( dt.Rows[ 0 ][ "flngJointCustomerKey" ].ToString() != "0" ) && (acctType == "PIT")) 
						{
							statement = "SELECT fstrId FROM tblId WHERE flngCustomerKey = '" + dt.Rows[ 0 ][ "flngJointCustomerKey" ].ToString() + "' AND fstrIdType IN ( " + idType + " )";
                            statement += " AND flngVer = 0 AND fblnActive = 1";
                            object val = lookupGC.DoScalar(statement);
							if( val != null )
								ret.fstrJointID = val.ToString();
						}
						ret.fromTbl = "cus";
					}
				}
				return ret;
			}
			catch( Exception ex )
			{
				GoodConn gc = new GoodConn();
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
				return ret;
			}
		}

		public bool IsReusable
		{
			get
			{
				return false;
			}
		}
	}
}