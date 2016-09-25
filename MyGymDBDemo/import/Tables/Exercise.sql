CREATE TABLE [import].[Exercise]
(
	[ExerciseId] INT NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(50) NOT NULL, 
    [FirstInserted] DATETIME2 NOT NULL DEFAULT getdate()
)
