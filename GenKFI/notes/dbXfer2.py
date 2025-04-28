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

# somehow the ImgMoveX values all got set to zero, so we need to pull them form the local DB
# pull fstrOnFocus, fstrOnKeyDown, flngImgMoveX, flngImbMoveY, flngMarkerMoveX, flngMarkerMoveY


# connect
sourceConn = pyodbc.connect( 'DRIVER={SQL Server Native Client 11.0};SERVER=(localdb)\Projects;UID=gentax;PWD=GenT@x;DATABASE=GenKFI2;' )
sourceCursor = sourceConn.cursor()
destConn = pyodbc.connect( 'DRIVER={SQL Server Native Client 10.0};SERVER=TRDSQLTST,2025;UID=gentax;PWD=GenT@x;DATABASE=GenKFI;' )
destCursor = destConn.cursor()

sourceCursor.execute( 'SELECT fstrFileType, fstrGenTaxFieldName, fstrInputID, fstrTaxProgram, flngTaxYear, fstrOnFocus, fstrOnKeyDown, flngImgMoveX, flngImgMoveY, flngMarkerMoveX, flngMarkerMoveY FROM rfrControls;' )
sourceRows = sourceCursor.fetchall()

for row in sourceRows:
    updStatement = "UPDATE rfrControls SET "
    updStatement += "fstrOnFocus = '" + row[ 5 ] + "', "            # fstrOnFocus
    updStatement += "fstrOnKeyDown = '" + row[ 6 ] + "', "          # fstrOnKeyDown
    updStatement += "flngImgMoveX = " + str( row[ 7 ] ) + ", "      # flngImgMoveX
    updStatement += "flngImgMoveY =" + str( row[ 8 ] ) + ", "       # flngImgMoveY
    updStatement += "flngMarkerMoveX =" + str( row[ 9 ] ) + ", "    # flngMarkerMoveX
    updStatement += "flngMarkerMoveY =" + str( row[ 10 ] ) + " "    # flngMarkerMoveY
    updStatement += "WHERE "
    updStatement += "fstrFileType = '" + row[ 0 ] + "' AND "
    updStatement += "fstrGenTaxFieldName = '" + row[ 1 ] + "' AND "
    updStatement += "fstrInputID = '" + row[ 2 ] + "' AND "
    updStatement += "fstrTaxProgram = '" + row[ 3 ] + "' AND "
    updStatement += "flngTaxYear = " + str( row[ 4 ] ) + ";"
    destCursor.execute( updStatement )


# commit and clean up
destConn.commit()
sourceCursor.close()
destCursor.close()
sourceConn.close()
destConn.close()
