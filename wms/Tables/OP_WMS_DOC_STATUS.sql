﻿CREATE TABLE [wms].[OP_WMS_DOC_STATUS] (
    [ID_STATUS]          INT          IDENTITY (1, 1) NOT NULL,
    [DESCRIPTION_STATUS] VARCHAR (50) DEFAULT ('') NOT NULL,
    PRIMARY KEY CLUSTERED ([ID_STATUS] ASC) WITH (FILLFACTOR = 80),
    UNIQUE NONCLUSTERED ([DESCRIPTION_STATUS] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE NONCLUSTERED INDEX [IX_OP_WMS_DOC_STATUS_ID_STATUS]
    ON [wms].[OP_WMS_DOC_STATUS]([ID_STATUS] ASC)
    INCLUDE([DESCRIPTION_STATUS]) WITH (FILLFACTOR = 80);

