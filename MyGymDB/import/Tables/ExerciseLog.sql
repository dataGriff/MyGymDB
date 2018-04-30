CREATE TABLE [import].[ExerciseLog]
(
	[ExerciseLogID] INT NOT NULL CONSTRAINT PK_ExerciseLogID PRIMARY KEY, 
    [ExerciseID] int NOT NULL, 
    [ActivityDate] DATETIME2 NOT NULL, 
    [ExerciseCount] TINYINT NOT NULL, 
    [GymUserId] INT NOT NULL, 
    [FirstInserted] DATETIME2 NOT NULL CONSTRAINT DFT_import_ExerciseLog_FirstInserted DEFAULT SYSUTCDATETIME(),
	[LastUpdated] DATETIME2 NOT NULL CONSTRAINT DFT_import_ExerciseLog_LastUpdated DEFAULT SYSUTCDATETIME() 
    CONSTRAINT [FK_ExerciseLog_Exercise] FOREIGN KEY ([ExerciseId]) REFERENCES [import].[Exercise]([ExerciseId]), 
    CONSTRAINT [FK_ExerciseLog_GymUser] FOREIGN KEY ([GymUserId]) REFERENCES [import].[GymUser]([GymUserId])
)
