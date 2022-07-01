﻿CREATE TABLE [wms].[OP_WMS_MATERIALS] (
    [CLIENT_OWNER]               VARCHAR (25)    NOT NULL,
    [MATERIAL_ID]                VARCHAR (50)    NOT NULL,
    [BARCODE_ID]                 VARCHAR (25)    NOT NULL,
    [ALTERNATE_BARCODE]          VARCHAR (25)    NULL,
    [MATERIAL_NAME]              VARCHAR (200)   NOT NULL,
    [SHORT_NAME]                 VARCHAR (200)   NOT NULL,
    [VOLUME_FACTOR]              DECIMAL (18, 4) NULL,
    [MATERIAL_CLASS]             VARCHAR (25)    NULL,
    [HIGH]                       NUMERIC (18, 3) CONSTRAINT [tmp_devart_tmp_devart_DF_OP_WMS_MATERIALS_ALTO] DEFAULT ((0)) NULL,
    [LENGTH]                     NUMERIC (18, 3) CONSTRAINT [tmp_devart_tmp_devart_DF_OP_WMS_MATERIALS_LARGO] DEFAULT ((0)) NULL,
    [WIDTH]                      NUMERIC (18, 3) CONSTRAINT [tmp_devart_tmp_devart_DF_OP_WMS_MATERIALS_ANCHO] DEFAULT ((0)) NULL,
    [MAX_X_BIN]                  NUMERIC (18)    NULL,
    [SCAN_BY_ONE]                NUMERIC (18)    NULL,
    [REQUIRES_LOGISTICS_INFO]    NUMERIC (18)    NULL,
    [WEIGTH]                     DECIMAL (18, 6) NULL,
    [IMAGE_1]                    IMAGE           NULL,
    [IMAGE_2]                    IMAGE           NULL,
    [IMAGE_3]                    IMAGE           NULL,
    [LAST_UPDATED]               DATETIME        NULL,
    [LAST_UPDATED_BY]            VARCHAR (25)    NULL,
    [IS_CAR]                     NUMERIC (18)    CONSTRAINT [tmp_devart_tmp_devart_DF_OP_WMS_MATERIALS_IS_CAR] DEFAULT ((0)) NULL,
    [MT3]                        NUMERIC (18, 2) NULL,
    [BATCH_REQUESTED]            NUMERIC (18)    NULL,
    [SERIAL_NUMBER_REQUESTS]     NUMERIC (18)    NULL,
    [IS_MASTER_PACK]             INT             DEFAULT ((0)) NOT NULL,
    [ERP_AVERAGE_PRICE]          NUMERIC (18, 6) DEFAULT ((0.0)) NOT NULL,
    [WEIGHT_MEASUREMENT]         VARCHAR (50)    NULL,
    [EXPLODE_IN_RECEPTION]       INT             DEFAULT ((0)) NOT NULL,
    [HANDLE_TONE]                INT             DEFAULT ((0)) NOT NULL,
    [HANDLE_CALIBER]             INT             DEFAULT ((0)) NOT NULL,
    [USE_PICKING_LINE]           INT             DEFAULT ((0)) NOT NULL,
    [ITEM_CODE_ERP]              VARCHAR (50)    NULL,
    [NON_STORAGE]                INT             DEFAULT ((0)) NOT NULL,
    [ALLOW_DECIMAL_VALUE]        INT             DEFAULT ((0)) NOT NULL,
    [QUALITY_CONTROL]            INT             DEFAULT ((0)) NOT NULL,
    [PREFIX_CORRELATIVE_SERIALS] VARCHAR (20)    NULL,
    [HANDLE_CORRELATIVE_SERIALS] INT             DEFAULT ((0)) NOT NULL,
    [BASE_MEASUREMENT_UNIT]      VARCHAR (50)    NULL,
    [LEAD_TIME]                  INT             CONSTRAINT [tmp_devart_DF_OP_WMS_MATERIALS_LEAD_TIME] DEFAULT ((0)) NULL,
    [SUPPLIER]                   VARCHAR (64)    NULL,
    [NAME_SUPPLIER]              VARCHAR (250)   NULL,
    [UPDATE_PROPERTIES_BY_HH]    SMALLINT        NULL,
    [MATERIAL_SUB_CLASS]         VARCHAR (25)    NULL,
    [EXPIRATION_TOLERANCE]       INT             NULL,
    CONSTRAINT [tmp_devart_tmp_devart_PK_OP_WMS_MATERIALS_1] PRIMARY KEY CLUSTERED ([CLIENT_OWNER] ASC, [MATERIAL_ID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IDX_BARCODE_ID]
    ON [wms].[OP_WMS_MATERIALS]([BARCODE_ID] ASC, [ALTERNATE_BARCODE] ASC, [CLIENT_OWNER] ASC)
    INCLUDE([MATERIAL_ID]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_MATERIAL_ID_WEIGTH]
    ON [wms].[OP_WMS_MATERIALS]([MATERIAL_ID] ASC)
    INCLUDE([WEIGHT_MEASUREMENT], [WEIGTH]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MATERIALS_IS_MASTER_PACK]
    ON [wms].[OP_WMS_MATERIALS]([IS_MASTER_PACK] ASC)
    INCLUDE([MATERIAL_ID], [ALTERNATE_BARCODE], [BARCODE_ID]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MATERIALS_MATERIAL_ID]
    ON [wms].[OP_WMS_MATERIALS]([MATERIAL_ID] ASC)
    INCLUDE([ALTERNATE_BARCODE], [BARCODE_ID], [BATCH_REQUESTED], [CLIENT_OWNER], [EXPLODE_IN_RECEPTION], [HANDLE_CALIBER], [HANDLE_TONE], [IS_CAR], [IS_MASTER_PACK], [MATERIAL_CLASS], [MATERIAL_NAME], [SERIAL_NUMBER_REQUESTS], [USE_PICKING_LINE], [VOLUME_FACTOR], [WEIGTH]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MATERIALS_MATERIAL_ID_BARCODE_ID_ALTERNATE_BARCODE]
    ON [wms].[OP_WMS_MATERIALS]([MATERIAL_ID] ASC, [BARCODE_ID] ASC, [ALTERNATE_BARCODE] ASC)
    INCLUDE([IS_MASTER_PACK]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MATERIALS_MATERIAL_ID_BATCH_REQUESTED]
    ON [wms].[OP_WMS_MATERIALS]([MATERIAL_ID] ASC, [BATCH_REQUESTED] ASC)
    INCLUDE([ALTERNATE_BARCODE], [BARCODE_ID], [CLIENT_OWNER], [IS_CAR]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MATERIALS_USE_PICKING_LINE]
    ON [wms].[OP_WMS_MATERIALS]([USE_PICKING_LINE] ASC)
    INCLUDE([MATERIAL_ID]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_MATERIALS]
    ON [wms].[OP_WMS_MATERIALS]([BARCODE_ID] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_MATERIALS_1]
    ON [wms].[OP_WMS_MATERIALS]([ALTERNATE_BARCODE] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_MATERIALS_2]
    ON [wms].[OP_WMS_MATERIALS]([CLIENT_OWNER] ASC, [BARCODE_ID] ASC, [ALTERNATE_BARCODE] ASC) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_MATERIALS_3]
    ON [wms].[OP_WMS_MATERIALS]([BARCODE_ID] ASC, [ALTERNATE_BARCODE] ASC) WITH (FILLFACTOR = 80);

