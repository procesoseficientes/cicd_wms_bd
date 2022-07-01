﻿-- =============================================
-- Autor:				        rudi.garcia
-- Fecha de Creacion: 	07-07-2016 Sprint ζ
-- Description:			    Obtiene las polizas rectificadas.

/*
 --Ejemplo de ejecucion
      EXEC [wms].OP_WMS_GET_RECTIFICATIONS  
        @START_DATE = '20160701'
        ,@END_DATE = '20160715'

*/

-- =============================================


CREATE PROCEDURE [wms].OP_WMS_GET_RECTIFICATIONS
  @START_DATE DATETIME
  ,@END_DATE DATETIME
AS 
  SELECT DISTINCT
     RC.DOC_ID_RECTIFADA
     ,RC.NUMERO_ORDEN_RECTIFADA
     ,RC.CODIGO_POLIZA_RECTIFADA
     ,RC.CLASE_POLIZA_RECTIFADA
     ,RC.COMENTARIO_RECTIFADA
     ,RC.FECHA_RECTIFICADA
     ,RC.OPERADOR_RECTIFICADA
     ,RC.DOC_ID_RECTIFICACION
     ,RC.NUMERO_ORDEN_RECTIFICACION
     ,RC.CODIGO_POLIZA_RECTIFICACION   
     ,RC.COMENTARIO_RECTIFICACION
     ,RC.FECHA_RECTIFICACION
     ,RC.OPERADOR_RECTIFICACION
     , CASE PH.PENDIENTE_RECTIFICACION
       WHEN 1 THEN 'SI'
       WHEN 2 THEN 'Rectificada'
      ELSE 'NO'
      END AS PENDIENTE_RECTIFICACION_DESCRIPCION
    , PH.PENDIENTE_RECTIFICACION
     ,VC.CLIENT_CODE
     ,VC.CLIENT_NAME
  FROM [wms].OP_WMS_RECTIFICATION_HISTORY RC
    INNER JOIN [wms].OP_WMS_POLIZA_HEADER PH ON (RC.DOC_ID_RECTIFICACION = PH.DOC_ID)
    INNER JOIN [wms].OP_WMS_VIEW_CLIENTS VC ON (PH.CLIENT_CODE = VC.CLIENT_CODE)
  WHERE 
    RC.DOC_ID_RECTIFICACION IS NOT NULL
  AND FECHA_RECTIFICACION BETWEEN @START_DATE AND @END_DATE