﻿CREATE VIEW [wms].OP_WMS_VIEW_DETAIL_WAVEPICKING
AS
SELECT     BARCODE_ID, MATERIAL_NAME, QUANTITY_ASSIGNED, CODIGO_POLIZA_SOURCE, CODIGO_POLIZA_TARGET, WAVE_PICKING_ID, REGIMEN, CLIENT_OWNER, 
                      CLIENT_NAME, ASSIGNED_DATE
FROM         [wms].OP_WMS_TASK_LIST