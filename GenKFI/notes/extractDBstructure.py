import os

"""
From SMMS, right click on the desired database, select Tasks > Generate Scripts.
In the following popup, select the TABLES you wish to extract and format. Be sure to select 'ANSI Encoding'
This works for TABLES ONLY!
Save the file somewhere. Put that somewhere in the basePath variable.
Put the desired filenames in the fNames list.
Run the script!
"""

basePath = "C:\\temp\\_Projects\\"
fNames = [ 'GenKFI_DEV.sql', 'GenKFI_PRD.sql' ]

for f in fNames:

    # output file
    outFile = open( basePath + "C_" + f.replace( ".sql", ".csv" ), 'w' )
    outFile.close()

    # read the entire einput file
    inFile = open( basePath + f, 'r' )
    inTXT = inFile.read()
    inFile.close()
    # trim to first table header
    inTXT = inTXT[ inTXT.find( "/*" ) : ]

    # loop while we have headers
    while inTXT.find( "/*" ) != -1 and inTXT.find( "CREATE TABLE" ) != -1:

        oneTable = inTXT[ inTXT.find( "**" ) + 1: ]
        oneTable = oneTable[ oneTable.find( "CREATE TABLE" ) : ]
        oneTable = oneTable[ : oneTable.find( "GO\n" ) ]
        # get the name
        tableName = oneTable[ : oneTable.find( "](" ) ]
        tableName = tableName[ tableName.rfind( "[" ) + 1 : ]

        # trim to the constraints, if there
        if oneTable.find( "CONSTRAINT" ) != -1:
            
            constraints = oneTable[ oneTable.find( "CONSTRAINT" ) : ]
            constraints = constraints[ : constraints.find( ")" ) + 1 ]
            oneTable = oneTable[ oneTable.find( "](" ) + 2 : oneTable.find( constraints ) ]
            constraints = constraints[ constraints.find( "(" ) + 1 : ]
            constraints = constraints[ : constraints.find( ")" ) ]

        else:
            oneTable = oneTable[ oneTable.find( "](" ) + 2 : oneTable.rfind( ")" ) ]
            constraints = ""
        
        # write the table name and constraints once
        outFile = open( basePath + "C_" + f.replace( ".sql", ".csv" ), 'a' )
        outFile.write( "NAME," + tableName + "\n" )
        outFile.write( "KEYS," + constraints.replace( "\n", "" ).replace( "\t", "" ).replace( "[", "" ).replace( "]", "" ).replace( " ", "" ).replace( "ASC", "" ).replace( "DESC", "" ).replace( ",", "\n," ) + "\n" )
        outFile.write( "COLUMNS" )
        outFile.close()
        
        # now split to get the column names
        for s in oneTable.split( ",\n" ):

            s = s.strip()
            if s == "":
                continue
            
            s = s.replace( "[", "" ).replace( "]", "" ).replace( ", ", ";" )
            cName = s.split( " " )[ 0 ]
            cType = s.split( " " )[ 1 ]
            notNull = ( s.find( "NOT NULL" ) != -1 )

            # write to file
            outFile = open( basePath + "C_" + f.replace( ".sql", ".csv" ), 'a' )
            outFile.write( "," + cName + "," + cType + "," + ( "NOT NULL" if notNull else "NULL" ) + "\n" )
            outFile.close()
            
        
        # trim for next loop
        inTXT = inTXT[ inTXT.find( "/*" ) + 1 : ]
