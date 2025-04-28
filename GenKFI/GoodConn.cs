using System;
using System.Data;
using System.Data.SqlClient;
using GenKFI.Properties;

namespace GenKFI
{
    /*
	 * this class will handle ALL connections throughout the program
	 * it is simply a central place for all the connection, cursor, 
	 * query returns, and execution code
	 * it uses a default admin login to the DB, which no one will ever be able to see
	 * 
	 * eventually we need to put exception catching in here, but make sure it all works first
	 * with the addition of exception catching, we will need to throw exceptions also for the calling classes to catch and deal with
	 * 
	 * Below is the basic usage for looping over a given select statement
	 * 
	 ********************************************************
	 * GoodConn gc = new GoodConn();
	 * try
	 * {
	 *		gc.connect();
	 *		string statement = "SELECT someColumns FROM someTable;";
	 *		gc.doSelect( statement );
	 *		DataTable dt = new DataTable();
	 *		int numRows = gc.readSelect( out dt );
	 *		// if there is even anything
	 *		if( numRows > 0 )
	 *		{
	 *			// loop over the results
	 * 			foreach( DataRow row in dt.Rows )
	 * 			{
	 * 				// do something with the results
	 * 				MessageBox.Show( row[ 0 ].ToString() );
	 * 			}
	 *		}
	 *		gc.disconnect();
	 * }
	 * catch( Exception ex )
	 * {
	 *		// handle exception here, if needed
	 *		gc.disconnect();
	 * }
	 ********************************************************
	 * 
	 * 
	 */
    public class GoodConn
	{

		// some globals that will be used throughout the class
		private SqlConnection myConn;
		private SqlCommand myCommand;
		private SqlDataReader myReader;
		private SqlTransaction myTrans;	// track if we have a transaction going

		public bool IsOpen { get { return myConn.State == System.Data.ConnectionState.Open; } }

		// the default constructor will do nothing more than load the settings file for the connection string
		// connections must be explicitly requested
		public GoodConn()
		{
		}

		// on destruction, any open connections will be closed
		~GoodConn()
		{
			//disconnect();
		}

		// the connection function
		public bool Connect( string connString = "" )
		{
			if( connString == "" )
				connString = Resources.connString;
			try
			{
				myConn = new SqlConnection( connString );
				myConn.Open();
				return ( myConn.State == System.Data.ConnectionState.Open );
			}
			catch( SqlException ex )
			{
				throw new Exception( "Connection Error ", ex );
			}
		}

		// we keep getting errors on destruction, so add a disconnect function
		public void Disconnect()
		{
			if( myConn != null )
			{
				if( myConn.State == System.Data.ConnectionState.Open )
					myConn.Close();
			}
		}

		#region Transactions

		// to implement the "Cancel" of the lists window, we need a transaction we can roll back if needed
		// so we need a way to start, commit, and rollback a transaction
		public void StartTransaction()
		{
			// first we need to be connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					myTrans = myConn.BeginTransaction();
				}
				catch( SqlException ex )
				{
					throw new Exception( "TRANSACTION error, please see Exception Details.", ex );
				}
			}
		}

		// if we need to cancel the transaction, do so
		// return bool, true if there was a transaction that was rolled back, false if there wasn't even a transaction
		public bool RollbackTransaction()
		{
			// first we need to be connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// if no transaction, just return false, nothing to rollback
			if( myTrans == null )
				return false;

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					// do the rollback and reset it
					myTrans.Rollback();
					myTrans = null;
					return true;
				}
				catch( SqlException ex )
				{
					throw new Exception( "TRANSACTION error, please see Exception Details.", ex );
				}
			}
			// if connection not open, just return false, transaction would never have been started
			// if connection was lost, transaction would automatically be rolled back
			return false;
		}

		// and finally commit a transaction
		// like above return true if the transaction committed, false if there wasn't one or it failed to commit
		public bool CommitTransaction()
		{
			// first we need to be connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// if no transaction, just return false, nothing to commit
			if( myTrans == null )
				return false;

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					// do the commit and reset it
					myTrans.Commit();
					myTrans = null;
					return true;
				}
				catch( SqlException ex )
				{
					throw new Exception( "TRANSACTION error, please see Exception Details.", ex );
				}
			}
			// if connection not open, just return false, transaction would never have been started
			// if connection was lost, transaction would automatically be rolled back
			return false;
		}

		#endregion

		#region Statements

		// a SELECT function, returns bool indicating success, false if connection not open
		// possibly change this to throw an exception later
		public bool DoSelect( string selStatement )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					myCommand = new SqlCommand( selStatement, myConn );
					// if there is a transaction, we need to associate it with this command
					if( myTrans != null )
						myCommand.Transaction = myTrans;
					myReader = myCommand.ExecuteReader();
					return myReader.HasRows;
				}
				catch( SqlException ex )
				{
					throw new Exception( "SELECT error, please see Exception Details.\nSTATEMENT: " + selStatement, ex );
				}
			}
			else
				return false;
		}

		// we don't want to allow the main program access to the DB, so put in reader functions here
		// returns the number of rows read into the referenced DataTable
		// if no connection or reader, returns -1 and the DataTable is null
		public int ReadSelect( out DataTable dt )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			if( myReader != null && myConn.State == ConnectionState.Open )
			{
				try
				{
					dt = new DataTable();
					dt.Load( myReader );
					return dt.Rows.Count;
				}
				catch( Exception ex )
				{
					throw new Exception( "SELECT read error. Please see Exception Details.", ex );
				}
			}
			else
			{
				dt = null;
				return -1;
			}
		}

		// execution function, for UPDATEs, INSERTs, and DELETEs
		// returns the rows affected, if not connected returns -1
		public int DoExecute( string execStatement )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			int ret = -1;
			if( myConn.State == ConnectionState.Open )
			{
				try
				{
					myCommand = new SqlCommand( execStatement, myConn );
					// if there is a transaction, we need to associate it with this command
					if( myTrans != null )
						myCommand.Transaction = myTrans;
					ret = myCommand.ExecuteNonQuery();
				}
				catch( SqlException ex )
				{
					throw new Exception( "EXECUTE error. Please see Exception Details.\nSTATEMENT: " + execStatement, ex );
				}
			}
			return ret;
		}

		// for a simple one value return (insert id?) we have a doScalar
		// returns the value returned from Sql, as an object, typecast it to use
		public object DoScalar( string scalarStatement )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			if( myConn.State == ConnectionState.Open )
			{
				try
				{
					myCommand = new SqlCommand( scalarStatement, myConn );
					// if there is a transaction, we need to associate it with this command
					if( myTrans != null )
						myCommand.Transaction = myTrans;
					return myCommand.ExecuteScalar();
				}
				catch( SqlException ex )
				{
					throw new Exception( "SCALAR error. Please see Exception Details.\nSTATEMENT: " + scalarStatement, ex );
				}
			}
			return null;
		}

		#endregion

		#region Parameterization Functions

		// start the command with the statement to execute, with @parameter values
		public void ParamCommand( string statement )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			if( myConn.State == ConnectionState.Open )
			{
				try
				{
					myCommand = new SqlCommand( statement, myConn );
					// if there is a transaction, we need to associate it with this command
					if( myTrans != null )
						myCommand.Transaction = myTrans;
				}
				catch( SqlException ex )
				{
					throw new Exception( "PARAMETER COMMAND error. Please see Exception Details.\nSTATEMENT: " + statement, ex );
				}
			}
		}

		// after setting the parameter command, use this to set the values, one by one
		// include parameter name, data type, and the value
		public void SetParam( string pName, SqlDbType pType, object value )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
                    SqlParameter param = new SqlParameter(pName, pType)
                    {
                        Direction = ParameterDirection.Input,
                        Value = value
                    };
                    myCommand.Parameters.Add( param );
				}
				catch( SqlException ex )
				{
					throw new Exception( "PARAMETER SET error, please see Exception Details.\nPARAM_NAME: " + pName, ex );
				}
			}
		}

		// another version that takes a SqlParameter array
		public void SetParam( SqlParameter[] pars )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					foreach( SqlParameter p in pars )
						myCommand.Parameters.Add( p );
				}
				catch( SqlException ex )
				{
					throw new Exception( "PARAMETER SET error, please see Exception Details.", ex );
				}
			}
		}

		// one last version that simply takes three arrays
		// first array is the list of names
		// second array is the list of SqlDbTypes
		// third array is the list of values
		public void SetParam( string[] pNames, SqlDbType[] pTypes, object[] values )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			// exception if arrays aren't the same length
			int i1 = pNames.Length;
			int i2 = pTypes.Length;
			int i3 = values.Length;
			if( i1 != i2 || i1 != i3 || i2 != i3 )
				throw new Exception( "Parameter arrays are different lengths." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					for( int i = 0; i < i1; i++ )
					{
                        SqlParameter param = new SqlParameter(pNames[i], pTypes[i])
                        {
                            Direction = ParameterDirection.Input,
                            Value = values[i]
                        };
                        myCommand.Parameters.Add( param );
					}
				}
				catch( SqlException ex )
				{
					throw new Exception( "PARAMETER SET error, please see Exception Details.", ex );
				}
			}
		}

		// a SELECT function, returns bool indicating success, false if connection not open
		// possibly change this to throw an exception later
		public bool DoSelectPARAM()
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			if( myConn.State == System.Data.ConnectionState.Open )
			{
				try
				{
					myReader = myCommand.ExecuteReader();
					return myReader.HasRows;
				}
				catch( SqlException ex )
				{
					throw new Exception( "SELECT error, please see Exception Details.\nSTATEMENT: " + myCommand.CommandText, ex );
				}
			}
			else
				return false;
		}

		// we don't want to allow the main program access to the DB, so put in reader functions here
		// returns the number of rows read into the referenced DataTable
		// if no connection or reader, returns -1 and the DataTable is null
		public int ReadSelectPARAM( out DataTable dt )
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			if( myReader != null && myConn.State == ConnectionState.Open )
			{
				try
				{
					dt = new DataTable();
					dt.Load( myReader );
					return dt.Rows.Count;
				}
				catch( Exception ex )
				{
					throw new Exception( "SELECT read error. Please see Exception Details.\nSTATEMENT: " + myCommand.CommandText, ex );
				}
			}
			else
			{
				dt = null;
				return -1;
			}
		}

		// execution function, for UPDATEs, INSERTs, and DELETEs
		// returns the rows affected, if not connected returns -1
		public int DoExecutePARAM()
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			int ret = -1;
			if( myConn.State == ConnectionState.Open )
			{
				try
				{
					ret = myCommand.ExecuteNonQuery();
				}
				catch( SqlException ex )
				{
					throw new Exception( "EXECUTE error. Please see Exception Details.\nSTATEMENT: " + myCommand.CommandText, ex );
				}
			}
			return ret;
		}

		// for a simple one value return (insert id?) we have a doScalar
		// returns the value returned from Sql, as an object, typecast it to use
		public object DoScalarPARAM()
		{
			// exception if we never connected
			if( myConn == null )
				throw new Exception( "Connection not set." );

			// exception if we have no command
			if( myCommand == null )
				throw new Exception( "SQL Command not set." );

			if( myConn.State == ConnectionState.Open )
			{
				try
				{
					return myCommand.ExecuteScalar();
				}
				catch( SqlException ex )
				{
					throw new Exception( "SCALAR error. Please see Exception Details.\nSTATEMENT: " + myCommand.CommandText, ex );
				}
			}
			return null;
		}

		#endregion
	}
}
