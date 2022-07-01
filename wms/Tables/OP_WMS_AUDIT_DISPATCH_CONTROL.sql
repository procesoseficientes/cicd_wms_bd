﻿CREATE TABLE [wms].[OP_WMS_AUDIT_DISPATCH_CONTROL] (
    [AUDIT_ID]        NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [CODIGO_POLIZA]   VARCHAR (50)  NOT NULL,
    [COUNTING_METHOD] VARCHAR (10)  NOT NULL,
    [STATUS]          VARCHAR (15)  NOT NULL,
    [LAST_UPDATED]    DATETIME      NULL,
    [LAST_UPDATED_BY] VARCHAR (25)  NULL,
    [COMMENTS]        VARCHAR (750) NULL,
    [NUMERO_ORDEN]    VARCHAR (25)  NULL,
    [PASS_DATE]       DATETIME      NULL,
    [PASS]            NUMERIC (18)  CONSTRAINT [DF_OP_WMS_AUDIT_DISPATCH_CONTROL_PASS] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_OP_WMS_AUDIT_DISPATCH_HEADER_1] PRIMARY KEY CLUSTERED ([AUDIT_ID] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_AUDIT_DISPATCH_CONTROL_BY_UPD]
    ON [wms].[OP_WMS_AUDIT_DISPATCH_CONTROL]([LAST_UPDATED] ASC) WITH (FILLFACTOR = 80);
