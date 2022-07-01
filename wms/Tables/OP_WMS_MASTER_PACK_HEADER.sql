﻿CREATE TABLE [wms].[OP_WMS_MASTER_PACK_HEADER] (
    [MASTER_PACK_HEADER_ID]  INT           IDENTITY (1, 1) NOT NULL,
    [LICENSE_ID]             INT           NOT NULL,
    [MATERIAL_ID]            VARCHAR (50)  NOT NULL,
    [POLICY_HEADER_ID]       NUMERIC (18)  NOT NULL,
    [LAST_UPDATED]           DATETIME      NULL,
    [LAST_UPDATE_BY]         VARCHAR (50)  NULL,
    [EXPLODED]               INT           DEFAULT ((0)) NULL,
    [EXPLODED_DATE]          DATETIME      NULL,
    [RECEPTION_DATE]         DATETIME      NULL,
    [IS_AUTHORIZED]          INT           DEFAULT ((0)) NOT NULL,
    [ATTEMPTED_WITH_ERROR]   INT           DEFAULT ((0)) NOT NULL,
    [IS_POSTED_ERP]          INT           DEFAULT ((0)) NOT NULL,
    [POSTED_ERP]             DATETIME      NULL,
    [POSTED_RESPONSE]        VARCHAR (500) NULL,
    [ERP_REFERENCE]          VARCHAR (50)  NULL,
    [ERP_REFERENCE_DOC_NUM]  VARCHAR (200) NULL,
    [QTY]                    INT           NULL,
    [IS_IMPLOSION]           INT           DEFAULT ((0)) NOT NULL,
    [IS_SENDING]             INT           NULL,
    [IS_FROM_ERP]            INT           NULL,
    [LAST_UPDATE_IS_SENDING] DATETIME      NULL,
    [POSTED_STATUS]          INT           NULL,
    [WAVE_PICKING_ID]        NUMERIC (18)  NULL,
    PRIMARY KEY CLUSTERED ([MASTER_PACK_HEADER_ID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_MASTER_PACK_HEADER_POLICY_HEADER] FOREIGN KEY ([POLICY_HEADER_ID]) REFERENCES [wms].[OP_WMS_POLIZA_HEADER] ([DOC_ID])
);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MASTER_PACK_HEADER_LICENSE_MATERIAL]
    ON [wms].[OP_WMS_MASTER_PACK_HEADER]([LICENSE_ID] ASC, [MATERIAL_ID] ASC)
    INCLUDE([EXPLODED], [QTY]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IN_OP_WMS_MASTER_PACK_HEADER_POLICY_HEADER_ID]
    ON [wms].[OP_WMS_MASTER_PACK_HEADER]([POLICY_HEADER_ID] ASC)
    INCLUDE([EXPLODED], [LICENSE_ID], [MATERIAL_ID], [QTY]) WITH (FILLFACTOR = 80);


GO
CREATE NONCLUSTERED INDEX [IDX_OP_WMS_MASTER_PACK_HEADER_MATERIAL_ID]
    ON [wms].[OP_WMS_MASTER_PACK_HEADER]([MATERIAL_ID] ASC)
    INCLUDE([EXPLODED], [IS_AUTHORIZED], [IS_IMPLOSION], [LICENSE_ID], [MASTER_PACK_HEADER_ID], [QTY]) WITH (FILLFACTOR = 80);

