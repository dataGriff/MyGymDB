CREATE TABLE [import].[Sex]
(
	[SexId] TINYINT IDENTITY NOT NULL PRIMARY KEY
	,[Description] NVARCHAR(15) NOT NULL
    ,[FirstInserted] DATETIME2 NOT NULL CONSTRAINT DFT_import_Sex_FirstInserted DEFAULT SYSUTCDATETIME()
	,[LastUpdated] DATETIME2 NOT NULL CONSTRAINT DFT_import_Sex_LastUpdated DEFAULT SYSUTCDATETIME() 
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is the table holding sex reference data',
    @level0type = N'SCHEMA',
    @level0name = N'import',
    @level1type = N'TABLE',
    @level1name = N'Sex',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is the unique identifer for sex',
    @level0type = N'SCHEMA',
    @level0name = N'import',
    @level1type = N'TABLE',
    @level1name = N'Sex',
    @level2type = N'COLUMN',
    @level2name = N'SexId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is the sex description',
    @level0type = N'SCHEMA',
    @level0name = N'import',
    @level1type = N'TABLE',
    @level1name = N'Sex',
    @level2type = N'COLUMN',
    @level2name = N'Description'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is when the row was first inserted',
    @level0type = N'SCHEMA',
    @level0name = N'import',
    @level1type = N'TABLE',
    @level1name = N'Sex',
    @level2type = N'COLUMN',
    @level2name = N'FirstInserted'