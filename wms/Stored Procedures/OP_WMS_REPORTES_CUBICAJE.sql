﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [wms].[OP_WMS_REPORTES_CUBICAJE]
	-- Add the parameters for the stored procedure here
	 @CLASIFICACION VARCHAR(250),
	 @IDENTIFICADOR VARCHAR(250)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    IF @CLASIFICACION='BODEGA'
		BEGIN
		   select
		   REGIMEN,
		   BARCODE_ID,
           MATERIAL_NAME,
           MATERIAL_CLASS,
           SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
		   CURRENT_LOCATION,
		   VOLUMEN,
           CLIENT_NAME,
           CLIENT_OWNER,
           sum (QTY) as CANTIDAD,
           sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
           from
           [wms].OP_WMS_VIEW_RPT_ALMGEN
           WHERE QTY>0 AND SUBSTRING( CURRENT_LOCATION,1,3) = @IDENTIFICADOR
           group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
           UNION
           select
           REGIMEN,
           BARCODE_ID,
           MATERIAL_NAME,
           MATERIAL_CLASS,
           SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
           CURRENT_LOCATION,
           VOLUMEN,
           CLIENT_NAME,
           CLIENT_OWNER,
           sum (QTY) as CANTIDAD,
           sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
           from
           [wms].OP_WMS_VIEW_RPT_FISCAL
           WHERE QTY>0 AND SUBSTRING( CURRENT_LOCATION,1,3) = @IDENTIFICADOR
           group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
		END	
      ELSE IF   @CLASIFICACION='CLIENTE'
			BEGIN
					   select
		   REGIMEN,
		   BARCODE_ID,
           MATERIAL_NAME,
           MATERIAL_CLASS,
           SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
           VOLUMEN,
           CLIENT_NAME,
           CLIENT_OWNER,
           sum (QTY) as CANTIDAD,
           sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
           from
           [wms].OP_WMS_VIEW_RPT_ALMGEN
           WHERE QTY>0 AND CLIENT_NAME = @IDENTIFICADOR
           group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
           UNION
           select
           REGIMEN,
           BARCODE_ID,
           MATERIAL_NAME,
           MATERIAL_CLASS,
           SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
           VOLUMEN,
           CLIENT_NAME,
           CLIENT_OWNER,
           sum (QTY) as CANTIDAD,
           sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
           from
           [wms].OP_WMS_VIEW_RPT_FISCAL
           WHERE QTY>0 AND CLIENT_NAME = @IDENTIFICADOR
           group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
				
			END
		ELSE IF   @CLASIFICACION='SKU'
			BEGIN
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_ALMGEN
				   WHERE QTY>0 AND OP_WMS_VIEW_RPT_ALMGEN.BARCODE_ID = @IDENTIFICADOR
				   group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
				   UNION
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_FISCAL
				   WHERE QTY>0 AND BARCODE_ID= @IDENTIFICADOR
				   group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
				
			END
		ELSE IF   @CLASIFICACION='MATERIAL_CLASS'
			BEGIN
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_ALMGEN
				   WHERE QTY>0 AND MATERIAL_CLASS = @IDENTIFICADOR
				   group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
				   UNION
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_FISCAL
				   WHERE QTY>0 AND MATERIAL_CLASS = @IDENTIFICADOR
				   group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
				
			END
		ELSE IF   @CLASIFICACION='UBICACION'
			BEGIN
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_ALMGEN
				   WHERE QTY>0 AND  CURRENT_LOCATION = @IDENTIFICADOR
				   group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
				   UNION
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_FISCAL
				   WHERE QTY>0 AND CURRENT_LOCATION = @IDENTIFICADOR
				   group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
				
			END
		ELSE IF   @CLASIFICACION='REGIMEN'
			BEGIN
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_ALMGEN
				   WHERE QTY>0 AND REGIMEN = @IDENTIFICADOR
				   group by CLIENT_NAME,CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,cURRENT_LOCATION
				   UNION
				   select
				   REGIMEN,
				   BARCODE_ID,
				   MATERIAL_NAME,
				   MATERIAL_CLASS,
				   SUBSTRING(CURRENT_LOCATION,1,3) AS BODEGA,
				   VOLUMEN,
				   CLIENT_NAME,
				   CLIENT_OWNER,
				   sum (QTY) as CANTIDAD,
				   sum (TOTAL_VOLUMEN) AS TOTAL_VOLUMEN
				   from
				   [wms].OP_WMS_VIEW_RPT_FISCAL
				   WHERE QTY>0 AND REGIMEN= @IDENTIFICADOR
				   group by CLIENT_NAME, CLIENT_OWNER, REGIMEN ,BARCODE_ID,MATERIAL_NAME,MATERIAL_CLASS,VOLUMEN,CURRENT_LOCATION
				
			END
END