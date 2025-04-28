import pyodbc

# this script is to connect to two different databases and transfer data between them
# since this is probably a one-time-thing, there won't be any data checking or validation
# we know what is coming in and where it is going. Below are the connection strings for
# the two databases. The connection is, as seen above, made using pyodbc, which can be found
# at "http://code.google.com/p/pyodbc/"
#
# SOURCE DB
#   Data Source=(localdb)\Projects;User ID=gentax;Password=GenT@x;Persist Security Info=True;Initial Catalog=GenKFI2;
#
# DEST DB
#   Data Source=TRDSQLTST,2025;User ID=gentax;Password=GenT@x;Persist Security Info=True;Initial Catalog=GenKFI;
#
# We will be transfering the following IDs from the Source to the Dest on the rfrControls table
# WHERE IDrfrControls IN ( 1, 179, 181, 182, 184, 185, 186, 187, 188, 189, 190, 1191, 2190, 3192 )
#
# BEGIN!


# connect
sourceConn = pyodbc.connect( 'DRIVER={SQL Server Native Client 11.0};SERVER=(localdb)\Projects;UID=gentax;PWD=GenT@x;DATABASE=GenKFI2;' )
sourceCursor = sourceConn.cursor()
destConn = pyodbc.connect( 'DRIVER={SQL Server Native Client 10.0};SERVER=TRDSQLTST,2025;UID=gentax;PWD=GenT@x;DATABASE=GenKFI;' )
destCursor = destConn.cursor()

sourceCursor.execute( 'SELECT IDrfrControls, fstrFileType, fstrGenTaxFieldName, fstrInputID, fstrTaxProgram, flngTaxYear, fstrTaxForm, flngOrder, fstrTable, fstrColumn, fstrFormat, flngDispLength, flngMaxLength, fblnHidden, flngVBVarType, flngBlock, fblnPostBack, fblnVertSkip, fstrLabel, fstrOnFocus, fstrOnKeyDown, fblnActive, flngCtrlMove, flngImgMoveX, flngImgMoveY, flngMarkerMoveX, flngMarkerMoveY, fstrNextCtrl, flngFormatIDFK, flngClipTop, flngClipRight, flngClipBottom, flngClipLeft, fstrBlockHeader FROM rfrControls WHERE IDrfrControls IN ( 1, 179, 181, 182, 184, 185, 186, 187, 188, 189, 190, 1191, 2190, 3192 );' )
sourceRows = sourceCursor.fetchall()

for row in sourceRows:
    insStatement = "INSERT INTO rfrControls ( fstrFileType, fstrGenTaxFieldName, fstrInputID, fstrTaxProgram, flngTaxYear, fstrTaxForm, flngOrder, fstrTable, fstrColumn, fstrFormat, flngDispLength, flngMaxLength, fblnHidden, flngVBVarType, flngBlock, fblnPostBack, fblnVertSkip, fstrLabel, fstrOnFocus, fstrOnKeyDown, fblnActive, flngCtrlMove, flngImgMoveX, flngImgMoveY, flngMarkerMoveX, flngMarkerMoveY, fstrNextCtrl, flngFormatIDFK, flngClipTop, flngClipRight, flngClipBottom, flngClipLeft, fstrBlockHeader ) VALUES ( "
    insStatement += "'" + row[ 1 ] + "', "  # fstrFileType
    insStatement += "'" + row[ 2 ] + "', "  # fstrGenTaxFieldName
    insStatement += "'" + row[ 3 ] + "', "  # fstrInputID
    insStatement += "'" + row[ 4 ] + "', "  # fstrTaxProgram
    insStatement += str( row[ 5 ] ) + ", "  # flngTaxYear
    insStatement += "'" + row[ 6 ] + "', "  # fstrTaxForm
    insStatement += str( row[ 7 ] ) + ", "  # flngOrder
    insStatement += "'" + row[ 8 ] + "', "  # fstrTable
    insStatement += "'" + row[ 9 ] + "', "  # fstrColumn
    insStatement += "'" + row[ 10 ] + "', " # fstrFormat
    insStatement += str( row[ 11 ] ) + ", " # flngDispLength
    insStatement += str( row[ 12 ] ) + ", " # flngMaxLength
    insStatement += str( row[ 13 ] ) + ", " # fblnHidden
    insStatement += str( row[ 14 ] ) + ", " # flngVBVarType
    insStatement += str( row[ 15 ] ) + ", " # flngBlock
    insStatement += str( row[ 16 ] ) + ", " # fblnPostBack
    insStatement += str( row[ 17 ] ) + ", " # fblnVertSkip
    insStatement += "'" + row[ 18 ] + "', " # fstrLabel
    insStatement += "'" + row[ 19 ] + "', " # fstrOnFocus
    insStatement += "'" + row[ 20 ] + "', " # fstrOnKeyDown
    insStatement += str( row[ 21 ] ) + ", " # fblnActive
    insStatement += str( row[ 22 ] ) + ", " # flngCtrlMove
    insStatement += str( row[ 23 ] ) + ", " # flngImgMoveX
    insStatement += str( row[ 24 ] ) + ", " # flngImgMoveY
    insStatement += str( row[ 25 ] ) + ", " # flngMarkerMoveX
    insStatement += str( row[ 26 ] ) + ", " # flngMarkerMoveY
    insStatement += "'" + row[ 27 ] + "', " # fstrNextCtrl
    insStatement += str( row[ 28 ] ) + ", " # flngFormatIDFK
    insStatement += str( row[ 29 ] ) + ", " # flngClipTop
    insStatement += str( row[ 30 ] ) + ", " # flngClipRight
    insStatement += str( row[ 31 ] ) + ", " # flngClipBottom
    insStatement += str( row[ 32 ] ) + ", " # flngClipLeft
    insStatement += "'" + row[ 33 ] + "' )" # fstrBlockHeader
    destCursor.execute( insStatement )

# commit this, so we can get to it below
# destConn.commit()

# we're not allowed to update the identity column
# then we also want to get the IDs the same as in the source
### first make them all huge, to avoid an overlap
##destCursor.execute( 'UPDATE rfrControls SET IDrfrControls = 100 * IDrfrControls' )
##
### then select the other keys from the source
##sourceCursor.execute( 'SELECT IDrfrControls, fstrFileType, fstrGenTaxFieldName, fstrInputID FROM rfrControls' )
##sourceRows = sourceCursor.fetchall()
##for row in sourceRows:
##    
##    # match to the dest, and set the ID
##    updStatement = "UPDATE rfrControls SET IDrfrControls = " + row[ 0 ] + " WHERE "
##    updStatement += "fstrFileType = '" + row[ 1 ] + "' AND "
##    updStatement += "fstrGenTaxFieldName = '" + row[ 2 ] + "' AND "
##    updStatement += "fstrInputID = '" + row[ 3 ] + "'"
##    destCursor.execute( updStatement )

# instead, get the control IDFKs used in the source tables, find the corresponding one in the destination table, and reset the FK value in the corresponding dest table
idfks = [ "flngControlOutIDFK", "flngControl1IDFK", "flngControl2IDFK" ]
for idfk in idfks:
    
    sourceCursor.execute( "SELECT IDtblAutoJavaComplete, " + idfk + ", fstrFileType, fstrGenTaxFieldName, fstrInputID FROM tblAutoJavaComplete, rfrControls WHERE " + idfk + " = IDrfrControls;" )
    sourceRows = sourceCursor.fetchall()
    for row in sourceRows:

        updStatement = "UPDATE tblAutoJavaComplete SET " + idfk + " = ( SELECT IDrfrControls FROM rfrControls WHERE "
        updStatement += "fstrFileType = '" + row[ 2 ] + "' AND "
        updStatement += "fstrGenTaxFieldName = '" + row[ 3 ] + "' AND "
        updStatement += "fstrInputID = '" + row[ 4 ] + "' ) WHERE "
        updStatement += "IDtblAutoJavaComplete = " + str( row[ 0 ] ) + ";"
        print updStatement
        destCursor.execute( updStatement )



# commit and clean up
destConn.commit()
sourceCursor.close()
destCursor.close()
sourceConn.close()
destConn.close()
