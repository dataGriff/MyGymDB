CREATE TABLE [import].[Exercise]
(
	[ExerciseId] INT IDENTITY(-32768,1) NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(255) NOT NULL, 
    [Category] VARCHAR(50) NULL,
	[FirstInserted] DATETIME2 NOT NULL CONSTRAINT DFT_import_Exercise_FirstInserted DEFAULT SYSUTCDATETIME(),
	[LastUpdated] DATETIME2 NOT NULL CONSTRAINT DFT_import_Exercise_LastUpdated DEFAULT SYSUTCDATETIME() 
)
