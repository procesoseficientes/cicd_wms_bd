﻿CREATE TABLE [wms].[OP_WMS_KARDEX_TXNS] (
    [TXNS_ID]            INT             IDENTITY (1, 1) NOT NULL,
    [CERTIFICATE_ID]     INT             NULL,
    [TX_DATE]            DATE            NULL,
    [TX_CREATED]         DATETIME        CONSTRAINT [DF_OP_WMS_KARDEX_TXNS_TX_CREATED] DEFAULT (getdate()) NULL,
    [TX_RECEIPTS]        NUMERIC (18, 2) NULL,
    [TX_DISPACTIL]       NUMERIC (18, 2) NULL,
    [TX_LAST_BALACE]     NUMERIC (18, 2) NULL,
    [TX_CURRENT_BALANCE] NUMERIC (18, 2) NULL,
    [SKU]                VARCHAR (50)    NULL,
    [SKU_DESCRIPTION]    VARCHAR (200)   NULL,
    [COST]               MONEY           NULL,
    CONSTRAINT [PK_OP_WMS_KARDEX_TXNS] PRIMARY KEY CLUSTERED ([TXNS_ID] ASC) WITH (FILLFACTOR = 80)
);
