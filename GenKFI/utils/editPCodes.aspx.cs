using GenKFI.Properties;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class editPCodes : System.Web.UI.Page
	{
		protected string GetPostBack()
		{
			return ClientScript.GetPostBackEventReference( this, "" );
		}

		protected void Page_Load( object sender, EventArgs e )
		{
			if( !IsPostBack )
				LoadCodes();
		}

		protected void OnClick_addBTN( object sender, EventArgs e )
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				string statement = "INSERT INTO progCodes ( progCode, description, removed ) VALUES ( '" + UtilClass.Sanitize( codeTXT.Text ) + "', '" + UtilClass.Sanitize( descTXT.Text ) + "', 0 );";
				gc.DoExecute( statement );
				gc.Disconnect();
				LoadCodes();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_editBTN( object sender, EventArgs e )
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				string statement = "UPDATE progCodes SET progCode = '" + UtilClass.Sanitize( codeTXT.Text ) + "', description = '" + UtilClass.Sanitize( descTXT.Text ) + "' WHERE idProgcodes = " + codesLST.SelectedValue + ";";
				gc.DoExecute( statement );
				gc.Disconnect();
				LoadCodes();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_remBTN( object sender, EventArgs e )
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				string statement = "UPDATE progCodes SET removed = @@ WHERE idProgCodes = " + codesLST.SelectedValue + ";";
				if( remBTN.Text == "Restore Code" )
					statement = statement.Replace( "@@", "0" );
				else if( remBTN.Text == "Remove Code" )
					statement = statement.Replace( "@@", "1" );
				gc.DoExecute( statement );
				gc.Disconnect();
				codeTXT.Text = "";
				descTXT.Text = "";
				LoadCodes();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnSelectedIndexChanged_codesLST( object sender, EventArgs e )
		{
			LoadDetails();
		}

		private void LoadCodes()
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				string statement = "SELECT idProgCodes, progCode, removed FROM progCodes;";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );

				// save the old selection, if any
				ListItem oldSel = codesLST.SelectedItem;
				codesLST.Items.Clear();
				if( numRows > 0 )
				{
					foreach( DataRow row in dt.Rows )
					{
						string starred = ( row[ "removed" ].ToString() == "0" ? "" : "* " );
						codesLST.Items.Add( new ListItem( starred + row[ "progCode" ].ToString(), row[ "idProgCodes" ].ToString() ) );
					}
				}
				// reselect the old one, if it's still there
				if( oldSel != null && codesLST.Items.IndexOf( oldSel ) != -1 )
				{
					int q = codesLST.Items.IndexOf( oldSel );
					codesLST.SelectedIndex = q;
					LoadDetails();
				}

				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		private void LoadDetails()
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				string statement = "SELECT progCode, description, removed FROM progCodes WHERE idProgCodes = " + codesLST.SelectedValue + ";";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					codeTXT.Text = dt.Rows[ 0 ][ "progCode" ].ToString();
					descTXT.Text = dt.Rows[ 0 ][ "description" ].ToString();
					if( dt.Rows[ 0 ][ "removed" ].ToString() == "1" )
						remBTN.Text = "Restore Code";
					else
						remBTN.Text = "Remove Code";
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
	}
}