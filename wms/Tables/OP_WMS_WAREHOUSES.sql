﻿CREATE TABLE [wms].[OP_WMS_WAREHOUSES] (
    [WAREHOUSE_ID]               VARCHAR (25)  NOT NULL,
    [NAME]                       VARCHAR (50)  NOT NULL,
    [COMMENTS]                   VARCHAR (150) NULL,
    [ERP_WAREHOUSE]              VARCHAR (50)  NULL,
    [ALLOW_PICKING]              NUMERIC (18)  NULL,
    [DEFAULT_RECEPTION_LOCATION] VARCHAR (25)  NULL,
    [SHUNT_NAME]                 VARCHAR (25)  NULL,
    [WAREHOUSE_WEATHER]          VARCHAR (50)  NULL,
    [WAREHOUSE_STATUS]           INT           NULL,
    [IS_3PL_WAREHUESE]           INT           NULL,
    [WAHREHOUSE_ADDRESS]         VARCHAR (250) NULL,
    [GPS_URL]                    VARCHAR (100) NULL,
    [DISTRIBUTION_CENTER_ID]     VARCHAR (50)  DEFAULT ('') NOT NULL,
    [USE_PICKING_LINE]           INT           CONSTRAINT [DEF_WAREHOUSE_USE_LINE] DEFAULT ((0)) NOT NULL,
    [PICKING_TYPE]               VARCHAR (50)  CONSTRAINT [DEF_PICKING_TYPE] DEFAULT ('Ascendente') NOT NULL,
    CONSTRAINT [PK_OP_WMS_WAREHOUSES] PRIMARY KEY CLUSTERED ([WAREHOUSE_ID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_WAREHOUSES_DISTRIBUTION_CENTER_ID]
    ON [wms].[OP_WMS_WAREHOUSES]([DISTRIBUTION_CENTER_ID] ASC)
    INCLUDE([ALLOW_PICKING], [COMMENTS], [DEFAULT_RECEPTION_LOCATION], [ERP_WAREHOUSE], [GPS_URL], [IS_3PL_WAREHUESE], [NAME], [SHUNT_NAME], [WAHREHOUSE_ADDRESS], [WAREHOUSE_ID], [WAREHOUSE_STATUS], [WAREHOUSE_WEATHER]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_WAREHOUSES_ERP_WAREHOUSE]
    ON [wms].[OP_WMS_WAREHOUSES]([ERP_WAREHOUSE] ASC)
    INCLUDE([ALLOW_PICKING], [COMMENTS], [DEFAULT_RECEPTION_LOCATION], [DISTRIBUTION_CENTER_ID], [GPS_URL], [IS_3PL_WAREHUESE], [NAME], [SHUNT_NAME], [WAHREHOUSE_ADDRESS], [WAREHOUSE_ID], [WAREHOUSE_STATUS], [WAREHOUSE_WEATHER]) WITH (FILLFACTOR = 80);

