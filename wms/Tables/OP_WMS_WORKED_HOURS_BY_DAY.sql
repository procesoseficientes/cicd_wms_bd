﻿CREATE TABLE [wms].[OP_WMS_WORKED_HOURS_BY_DAY] (
    [WORKED_DAY]   DATE NOT NULL,
    [WORKED_HOURS] INT  NULL,
    CONSTRAINT [PK_OP_WMS_WORKED_HOURS_BY_DAY] PRIMARY KEY CLUSTERED ([WORKED_DAY] ASC) WITH (FILLFACTOR = 80)
);

