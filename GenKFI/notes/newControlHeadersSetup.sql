/*
this will insert the form and block headers in rfrControlHeader table
Then it will set the FK value in the old rfrControls table
Lastly it will set flags in rfrcontrols for later deletion (header FK value = -1)

Update - don't delete the old column until we are ready, and won't be adding more
data to those columns
*/

USE GenKFI;
DELETE FROM rfrControlHeaders;

-- put the values of all headers in the headers table
INSERT INTO rfrControlHeaders (
	fstrFileType,
	fstrTaxProgram,
	flngTaxYear,
	fstrTaxForm,
	fstrBlockTitle,
	flngBlock,
	fstrTable,
	flngClipTop,
	flngClipRight,
	flngClipBottom,
	flngClipLeft,
	fstrTemplateImage,
	fstrFormType,
	flngRepeatOffset,
	flngReturnHeadersIDFK )
SELECT 
	fstrFileType,
	fstrTaxProgram,
	flngTaxYear,
	fstrTaxForm,
	fstrLabel,
	flngBlock,
	fstrTable,
	flngClipTop,
	flngClipRight,
	flngClipBottom,
	flngClipLeft,
	fstrBlockHeader,
	fstrFormType,
	0,
	-1
FROM
	rfrControls
WHERE
	flngOrder = 0 OR
	flngOrder = 1;

-- then update the old controls table with the FK values from the new headers table
UPDATE
	c
SET
	c.flngControlHeadersIDFK = ch.idControlHeaders
FROM
	rfrControlHeaders ch
		INNER JOIN
	rfrControls c ON 
		ch.fstrFileType = c.fstrFileType AND 
		ch.fstrTaxProgram = c.fstrTaxProgram AND
		ch.flngTaxYear = c.flngTaxYear AND 
		ch.fstrTaxForm = c.fstrTaxForm AND
		ch.fstrTable = c.fstrTable AND
		ch.flngBlock = c.flngBlock;


-- and lastly flag the old header rows for deletion
UPDATE
	rfrControls
SET
	flngControlHeadersIDFK = -1
WHERE
	flngOrder = 0;

-- and delete them when we are sure all this new stuff works
-- DELETE FROM
-- 	rfrControls
-- WHERE
-- 	flngHeaderIDFK = -1;


-- update with the return header values
UPDATE
	ch
SET
	ch.flngReturnHeadersIDFK = rh.idReturnHeaders
FROM
	rfrReturnHeaders rh
		INNER JOIN
	rfrControlHeaders ch ON 
		ch.fstrFileType = rh.fstrFileType AND 
		ch.fstrTaxProgram = rh.fstrTaxProgram AND
		ch.flngTaxYear = rh.flngTaxYear;


-- and finally, update the block titles to match the flngOrder = 0 values
UPDATE 
	ch1
SET
	ch1.fstrBlockTitle = ch2.fstrBlockTitle
FROM
	rfrControlHeaders ch1
		INNER JOIN
	rfrControlHeaders ch2 ON
		ch1.flngReturnHeadersIDFK = ch2.flngReturnHeadersIDFK AND
		ch1.fstrTable = ch2.fstrTable AND
		ch1.fstrTaxForm = ch2.fstrTaxForm
WHERE
	ch2.flngBlock = 0;
	
SELECT * FROM rfrControlHeaders WHERE fstrFileType = 'CITR11';
SELECT * FROM rfrControls WHERE fstrFileType = 'CITR11' ORDER BY fstrTaxForm, flngBlock, flngOrder;




