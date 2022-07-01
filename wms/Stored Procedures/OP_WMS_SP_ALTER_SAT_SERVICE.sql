﻿
CREATE PROC wms.OP_WMS_SP_ALTER_SAT_SERVICE @XML VARCHAR(MAX)
, @STATUS VARCHAR(10)
, @TYPE VARCHAR(25)
, @MESSAGE VARCHAR(250)
, @MESSAGE_CODE VARCHAR(15)
, @ACUSE_DOC_ID VARCHAR(15)
, @pResult VARCHAR(200) OUTPUT

AS
BEGIN TRY
  INSERT INTO [wms].[OP_WMS_SAT_SERVICES] ([XML]
  , [STATUS]
  , [TYPE]
  , [MESSAGE]
  , [MESSAGE_CODE]
  , [UPDATE_DATE]
  , [NUMBER_OF_ATTEMPTS]
  , [ACUSE_DOC_ID])
    VALUES (@XML, @STATUS, @TYPE, @MESSAGE, @MESSAGE_CODE, CURRENT_TIMESTAMP, '1', @ACUSE_DOC_ID)
  SET @pResult = 'OK'
END TRY
BEGIN CATCH
  SET @pResult = ERROR_MESSAGE();
END CATCH