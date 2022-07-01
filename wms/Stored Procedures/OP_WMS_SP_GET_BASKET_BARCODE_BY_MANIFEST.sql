﻿-- =============================================
-- Autor:	        hector.gonzalez
-- Fecha de Creacion: 	2017-11-24 @ Team REBORN - Sprint Nach
-- Description:	        Sp que devuelve los barcode de las canastas de un manifiesto

/*
-- Ejemplo de Ejecucion:
			EXEC [wms].OP_WMS_SP_GET_BASKET_BARCODE_BY_MANIFEST @MANIFEST_HEADER_ID= 2151
*/
-- =============================================
CREATE PROCEDURE [wms].[OP_WMS_SP_GET_BASKET_BARCODE_BY_MANIFEST] (
		@MANIFEST_HEADER_ID INT
	)
AS
BEGIN
	SET NOCOUNT ON;
  --
	SELECT
		[MH].[MANIFEST_HEADER_ID]
		,[MD].[PICKING_DEMAND_HEADER_ID]
		,[PL].[BARCODE]
		,[PDH].[DOC_NUM]
		,[PDH].[ERP_REFERENCE_DOC_NUM]
	FROM
		[wms].[OP_WMS_MANIFEST_HEADER] [MH]
	INNER JOIN [wms].[OP_WMS_MANIFEST_DETAIL] [MD] ON [MH].[MANIFEST_HEADER_ID] = [MD].[MANIFEST_HEADER_ID]
	INNER JOIN [wms].[OP_WMS_PICKING_LABEL_BY_MANIFEST] [PLBM] ON (
											[MD].[MANIFEST_DETAIL_ID] = [PLBM].[MANIFEST_DETAIL_ID]
											AND [MD].[MATERIAL_ID] = [PLBM].[MATERIAL_ID]
											)
	INNER JOIN [wms].[OP_WMS_PICKING_LABELS] [PL] ON [PLBM].[LABEL_ID] = [PL].[LABEL_ID]
	INNER JOIN [wms].[OP_WMS_NEXT_PICKING_DEMAND_HEADER] [PDH] ON [MD].[PICKING_DEMAND_HEADER_ID] = [PDH].[PICKING_DEMAND_HEADER_ID]
	WHERE
		[MH].[MANIFEST_HEADER_ID] = @MANIFEST_HEADER_ID
		AND [PL].[BARCODE] IS NOT NULL
	GROUP BY
		[MH].[MANIFEST_HEADER_ID]
		,[MD].[PICKING_DEMAND_HEADER_ID]
		,[PL].[BARCODE]
		,[PDH].[DOC_NUM]
		,[PDH].[ERP_REFERENCE_DOC_NUM];
END;