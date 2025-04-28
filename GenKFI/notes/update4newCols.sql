-- update flngCtrlMove
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( '(', fstrOnFocus ) + 1,
			CHARINDEX( ')', fstrOnFocus ) - CHARINDEX( '(', fstrOnFocus ) - 1 )
		AS INT )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*	
UPDATE
	rfrControls 
SET
	flngCtrlMove = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( '(', fstrOnFocus ) + 1,
			CHARINDEX( ')', fstrOnFocus ) - CHARINDEX( '(', fstrOnFocus ) - 1 )
		AS INT )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngImgMoveX
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'ImgMove(', fstrOnFocus ) + 8,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( ')', fstrOnFocus ) ) - CHARINDEX( 'ImgMove(', fstrOnFocus ) - 8 )
		AS INT )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	flngImgMoveX = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'ImgMove(', fstrOnFocus ) + 8,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( ')', fstrOnFocus ) ) - CHARINDEX( 'ImgMove(', fstrOnFocus ) - 8 )
		AS INT )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngImgMoveY
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'ImgMove(', fstrOnFocus ) ) + 1,
			CHARINDEX( ');Mark', fstrOnFocus ) - CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'ImgMove(', fstrOnFocus ) ) - 1 )
		AS INT )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	flngImgMoveY = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'ImgMove(', fstrOnFocus ) ) + 1,
			CHARINDEX( ');Mark', fstrOnFocus ) - CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'ImgMove(', fstrOnFocus ) ) - 1 )
		AS INT )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngMarkerMoveX
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'MarkMove(', fstrOnFocus ) + 9,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'Mark', fstrOnFocus ) ) - CHARINDEX( 'MarkMove(', fstrOnFocus ) - 9 )
		AS INT )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	flngMarkerMoveX = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'MarkMove(', fstrOnFocus ) + 9,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'Mark', fstrOnFocus ) ) - CHARINDEX( 'MarkMove(', fstrOnFocus ) - 9 )
		AS INT )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngMarkerMoveY
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'MarkMove(', fstrOnFocus ) ) + 1,
			LEN( fstrOnFocus ) - CHARINDEX( ';)', REVERSE( fstrOnFocus ) ) - CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'MarkMove(', fstrOnFocus ) ) - 1 )
		AS INT )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	flngMarkerMoveY = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'MarkMove(', fstrOnFocus ) ) + 1,
			LEN( fstrOnFocus ) - CHARINDEX( ';)', REVERSE( fstrOnFocus ) ) - CHARINDEX( ',', fstrOnFocus, CHARINDEX( 'MarkMove(', fstrOnFocus ) ) - 1 )
		AS INT )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update fstrNextCtrl
SELECT
	fstrOnKeyDown,
	CAST( 
		SUBSTRING(
			fstrOnKeyDown,
			CHARINDEX( 'this,', fstrOnKeyDown ) + 5,
			LEN( fstrOnKeyDown ) - CHARINDEX( ';)', REVERSE( fstrOnKeyDown ) ) - CHARINDEX( 'this,', fstrOnKeyDown ) - 5 )
		AS VARCHAR )
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	fstrNextCtrl = CAST( 
		SUBSTRING(
			fstrOnKeyDown,
			CHARINDEX( 'this,', fstrOnKeyDown ) + 5,
			LEN( fstrOnKeyDown ) - CHARINDEX( ';)', REVERSE( fstrOnKeyDown ) ) - CHARINDEX( 'this,', fstrOnKeyDown ) - 5 )
		AS VARCHAR )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngFormatIDFK
SELECT
	fstrOnKeyDown,
	CAST( 
		SUBSTRING(
			fstrOnKeyDown,
			CHARINDEX( 'fmt', fstrOnKeyDown ),
			CHARINDEX( '(this', fstrOnKeyDown ) - CHARINDEX( 'fmt', fstrOnKeyDown ) )
		AS VARCHAR ),
	( SELECT IDrfrFormatTypes FROM rfrFormatTypes WHERE fstrFJSfuncName = CAST( 
		SUBSTRING(
			fstrOnKeyDown,
			CHARINDEX( 'fmt', fstrOnKeyDown ),
			CHARINDEX( '(this', fstrOnKeyDown ) - CHARINDEX( 'fmt', fstrOnKeyDown ) )
		AS VARCHAR ) )

FROM
	rfrControls
WHERE
	fstrOnFocus LIKE 'CtlMove%';

/*
UPDATE
	rfrControls 
SET
	flngFormatIDFK = ( SELECT IDrfrFormatTypes FROM rfrFormatTypes WHERE fstrFJSfuncName = CAST( 
		SUBSTRING(
			fstrOnKeyDown,
			CHARINDEX( 'fmt', fstrOnKeyDown ),
			CHARINDEX( '(this', fstrOnKeyDown ) - CHARINDEX( 'fmt', fstrOnKeyDown ) )
		AS VARCHAR ) )
WHERE
	fstrOnFocus LIKE 'CtlMove%';
*/

-- update flngClipTo, flngClipRight, flngClipBottom, flngClipLeft
SELECT
	fstrOnFocus,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( '(', fstrOnFocus ) + 1,
			CHARINDEX( 'px ', fstrOnFocus ) - CHARINDEX( '(', fstrOnFocus ) - 1 )
		AS INT ) AS clipTop,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus ) + 3,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus ) - 3 )
		AS INT ) AS clipRight,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 3,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) - 3 )
		AS INT ) AS clipBottom,
	CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) + 3,
			CHARINDEX( 'px', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) - 3 )
		AS INT ) AS clipLeft		
FROM
	rfrControls
WHERE
	fstrOnFocus LIKE '%clip%';

/*
UPDATE
	rfrControls 
SET
	fstrClipTop = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( '(', fstrOnFocus ) + 1,
			CHARINDEX( 'px ', fstrOnFocus ) - CHARINDEX( '(', fstrOnFocus ) - 1 )
		AS INT ),
	fstrClipRight = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus ) + 3,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus ) - 3 )
		AS INT ),
	fstrClipBottom = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 3,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) - 3 )
		AS INT ),
	fstrClipLeft = CAST( 
		SUBSTRING(
			fstrOnFocus,
			CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) + 3,
			CHARINDEX( 'px', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) + 1 ) - CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus, CHARINDEX( 'px ', fstrOnFocus ) + 1 ) + 1 ) - 3 )
		AS INT )
WHERE
	fstrOnFocus LIKE '%clip%';
*/

-- update fstrBlockHeader
UPDATE
	rfrControls 
SET
	fstrBlockHeader = fstrOnKeyDown
WHERE 
	fstrOnKeyDown NOT LIKE '%this%';

