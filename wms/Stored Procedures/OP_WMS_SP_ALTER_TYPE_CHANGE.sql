﻿
CREATE PROCEDURE wms.OP_WMS_SP_ALTER_TYPE_CHANGE @CHARGE VARCHAR(100),
@DESCRIPTION VARCHAR(250),
@WAREHOUSE_WEATHER VARCHAR(60),
@REGIMEN VARCHAR(25),
@COMMENT VARCHAR(200),
@DAY_TRIP VARCHAR(40),
@SERVICE_CODE VARCHAR(25),
@TO_MOVIL NUMERIC(18, 0),
@pResult VARCHAR(250) OUTPUT

AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRAN
  BEGIN
    INSERT INTO wms.OP_WMS_TYPE_CHARGE (CHARGE
    , [DESCRIPTION]
    , WAREHOUSE_WEATHER
    , REGIMEN
    , COMMENT
    , DAY_TRIP
    , SERVICE_CODE
    , TO_MOVIL)
      VALUES (@CHARGE, @DESCRIPTION, @WAREHOUSE_WEATHER, @REGIMEN, @COMMENT, @DAY_TRIP, @SERVICE_CODE, @TO_MOVIL)
  END
  IF @@error = 0
  BEGIN
    SET @pResult = 'OK'
    COMMIT TRAN
  END
  ELSE
  BEGIN
    ROLLBACK TRAN
    SET @pResult = ERROR_MESSAGE()
  END

END