CREATE TABLE [import].[Exercise]
(
	[ExerciseId] SMALLINT IDENTITY(-32768,1) NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(255) NOT NULL, 
    [FirstInserted] DATETIME2 NOT NULL DEFAULT getdate()
)
