﻿CREATE TABLE [dbo].[OP_WMS_HOLD_INVENTORY] (
    [ERP_DOC]         VARCHAR (50)  NOT NULL,
    [CLIENT_ID]       NUMERIC (18)  NOT NULL,
    [SKU]             VARCHAR (50)  NOT NULL,
    [SKU_DESCRIPTION] VARCHAR (150) NULL,
    [LAST_UPDATE_BY]  DATETIME      NULL,
    [QTY]             NUMERIC (18)  NULL,
    [MATERIAL_ID]     VARCHAR (25)  NULL,
    [MATERIAL_NAME]   VARCHAR (150) NULL,
    CONSTRAINT [PK_OP_WMS_HOLD_INVENTORY] PRIMARY KEY CLUSTERED ([ERP_DOC] ASC, [CLIENT_ID] ASC, [SKU] ASC) WITH (FILLFACTOR = 80)
);
