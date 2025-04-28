DELETE FROM tblKeQueue WHERE fstrBatchID = '53796';
DELETE FROM tblKeQMast WHERE fstrBatchID = '53796';
DELETE FROM tblPit WHERE fstrBatchID = '53796';
DELETE FROM tblPit2 WHERE fstrBatchID = '53796';
DELETE FROM tblPitAdj WHERE fstrBatchID = '53796';
DELETE FROM tblPitB WHERE fstrBatchID = '53796';
DELETE FROM tblPitB2 WHERE fstrBatchID = '53796';
DELETE FROM tblPitCR WHERE fstrBatchID = '53796';
DELETE FROM tblPitD WHERE fstrBatchID = '53796';
DELETE FROM tblPitRC WHERE fstrBatchID = '53796';
DELETE FROM tblPitRC2 WHERE fstrBatchID = '53796';
DELETE FROM tblPitS WHERE fstrBatchID = '53796';
UPDATE tblBatchInfo SET fintBatchCount = 0 WHERE fstrBatchId = '53796';
UPDATE tblBatchImage SET fdtmImageCheckedIn = '9999-12-31 00:00:00.000', fdtmImageCheckedOut = NULL WHERE fstrbatchId = '53796'

