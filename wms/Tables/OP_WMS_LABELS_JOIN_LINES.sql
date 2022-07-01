﻿CREATE TABLE [wms].[OP_WMS_LABELS_JOIN_LINES] (
    [LINE_ID]  VARCHAR (15) NOT NULL,
    [LABEL_ID] VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_OP_WMS_LABELS_JOIN_LINES] PRIMARY KEY CLUSTERED ([LINE_ID] ASC, [LABEL_ID] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_OP_WMS_LABELS_JOIN_LINES_OP_WMS_LABELS_JOIN_LINES] FOREIGN KEY ([LINE_ID], [LABEL_ID]) REFERENCES [wms].[OP_WMS_LABELS_JOIN_LINES] ([LINE_ID], [LABEL_ID])
);

