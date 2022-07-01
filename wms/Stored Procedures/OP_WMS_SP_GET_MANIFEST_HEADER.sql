﻿-- =============================================
-- Autor:				rodrigo.gomez
-- Fecha de Creacion: 	8/28/2017 @ NEXUS-Team Sprint CommandAndConquer 
-- Description:			Obtiene el encabezado de los manifiestos de carga por su ID

/*
-- Ejemplo de Ejecucion:
				EXEC [wms].[OP_WMS_SP_GET_MANIFEST_HEADER]
					@MANIFEST_HEADER_ID = 'MC-4'
				--
				EXEC [wms].[OP_WMS_SP_GET_MANIFEST_HEADER]
					@MANIFEST_HEADER_ID = '4'
*/
-- =============================================
CREATE PROCEDURE [wms].[OP_WMS_SP_GET_MANIFEST_HEADER](
	@MANIFEST_HEADER_ID VARCHAR(25)
)
AS
BEGIN
	SET NOCOUNT ON;
	--
	DECLARE @DOCUMENT_PREFIX VARCHAR(10)
	--
	SELECT @DOCUMENT_PREFIX = [VALUE]
	FROM [wms].[OP_WMS_PARAMETER]
	WHERE [GROUP_ID] = 'PREFIX' AND [PARAMETER_ID] = 'CARGO_MANIFEST'
	--
	IF ISNUMERIC(@MANIFEST_HEADER_ID) = 0
	BEGIN
		IF EXISTS (SELECT TOP 1 1 WHERE @MANIFEST_HEADER_ID LIKE @DOCUMENT_PREFIX +'%')
		BEGIN
			SELECT @MANIFEST_HEADER_ID = [VALUE]
			FROM [wms].[OP_WMS_FN_SPLIT](@MANIFEST_HEADER_ID, '-')
			ORDER BY [ID] ASC		
		END
		ELSE
		BEGIN
			RAISERROR ('Id de documento invalido.', 16, 1);  
			RETURN	
		END
	END
	--
	SELECT [MANIFEST_HEADER_ID]
			,[DRIVER]
			,[VEHICLE]
			,[DISTRIBUTION_CENTER]
			,[CREATED_DATE]
			,[STATUS]
			,[LAST_UPDATE]
			,[LAST_UPDATE_BY]
			,[MANIFEST_TYPE]
			,[TRANSFER_REQUEST_ID] 
			,@DOCUMENT_PREFIX [DOCUMENT_PREFIX]
			,ISNULL([CAI], '') [CAI]
			,(ISNULL(CAI_SERIE, '')) CAI_SERIE
			,ISNULL(CAI_NUMERO, '') CAI_NUMERO
			,ISNULL(CAI_RANGO_INICIAL, CAST(0 AS DECIMAL)) CAI_RANGO_INICIAL
			,ISNULL(CAI_RANGO_FINAL, CAST(0 AS DECIMAL)) CAI_RANGO_FINAL
			,ISNULL(CAI_FECHA_VENCIMIENTO, '') CAI_FECHA_VENCIMIENTO
	FROM [wms].[OP_WMS_MANIFEST_HEADER]
	WHERE [MANIFEST_HEADER_ID] = @MANIFEST_HEADER_ID
END