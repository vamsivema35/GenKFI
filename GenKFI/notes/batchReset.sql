-- to reset a batch
USE GenKFI;
DECLARE @batchID varchar(10);
SET @batchID = '69615';
UPDATE tblBatchImage SET fdtmImageCheckedOut = NULL, fdtmImageCheckedIn = '9999-12-31 00:00:00' WHERE fstrBatchID = @batchID;
UPDATE tblBatchInfo SET fintBatchCount = 0 WHERE fstrBatchID = @batchID;

