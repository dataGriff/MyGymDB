CREATE TABLE [import].[Exercise]
(
	[ExerciseId] INT IDENTITY(-32768,1) NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(255) NOT NULL, 
    [FirstInserted] DATETIME2 NOT NULL DEFAULT getdate(), 
    [Category] VARCHAR(50) NULL
)
