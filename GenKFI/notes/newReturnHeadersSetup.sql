USE GenKFI;

/*
similar to the ControlHeaderSetup
this inserts the return headers (tax program, year, file type)
and updates the controlHeader FKs appropriately

Update - don't delete the old column until we are ready, and won't be adding more
data to those columns
 */
DELETE FROM rfrReturnHeaders;

INSERT INTO rfrReturnHeaders (
	fstrFileType,
	fstrTaxProgram, 
	flngTaxYear )
SELECT
	fstrFileType, 
	fstrTaxProgram,
	flngTaxYear
FROM
	rfrControlHeaders
GROUP BY 
	fstrFileType, 
	fstrTaxProgram,
	flngTaxYear;

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
		
SELECT * FROM rfrControlHeaders;
SELECT * FROM rfrReturnHeaders;

