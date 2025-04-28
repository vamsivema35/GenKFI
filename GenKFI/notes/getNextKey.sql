USE GenKFI;
SELECT
	b.fstrBatchID,
	CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ),
	b.fstrBatchSource,
	b.fstrTaxProgram,
	i.flngSequence,
	i.fstrDLN,
FROM
	tblBatchImage i,
	tblBatchInfo b,
	rfrControls c
WHERE
	i.fstrBatchID = b.fstrBatchID AND 
	i.fstrTaxProgram = b.fstrTaxProgram AND 
	i.fstrFormName IS NOT NULL AND 
	ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND 
	ISNULL( i.fblnImageBlankSizeCompare, 0 ) = 0 AND 
	ISNULL( i.fblnImageBlankMiniCheck, 0 ) = 0 AND 
	ISNULL( i.fblnImageBlankUserCheck, 0 ) = 0 AND 
	i.fstrBatchID = b.fstrBatchID AND 
	i.fstrTaxProgram = b.fstrTaxProgram AND 
	CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND
	( i.fdtmImageCheckedOut <> '12/31/9999' OR i.fdtmImageCheckedOut IS NULL ) AND
	i.fdtmImageCheckedIn = '12/31/9999' AND
	i.fstrFormName = c.fstrTaxForm AND
	i.fstrTaxProgram = c.fstrTaxProgram AND 
	b.fstrForm = CONVERT( VARCHAR(50), c.flngTaxYear ) AND
	c.flngOrder = 0 AND
	c.flngBlock = 0 AND 
	c.fblnActive = 1 AND
	RIGHT( i.fstrDLN, 2 ) = '01' AND 
	c.fstrTaxForm LIKE '%page 1%' AND
	b.fstrBatchUser = 'TRD_MASTER\josephd'
ORDER BY
	b.fdtmBatchDate,
	b.fstrBatchID,
	i.flngSequence


