CREATE TABLE [import].[Activity]
(
	[ActivityID] INT NOT NULL PRIMARY KEY, 
    [ExerciseID] SMALLINT NOT NULL, 
    [ActivityDate] DATETIME2 NOT NULL, 
    [ExerciseCount] TINYINT NOT NULL, 
    [GymUserId] INT NOT NULL, 
    [FirstInserted] DATETIME2 NOT NULL DEFAULT getdate(), 
    CONSTRAINT [FK_Activity_Exercise] FOREIGN KEY ([ExerciseId]) REFERENCES [import].[Exercise]([ExerciseId]), 
    CONSTRAINT [FK_Activity_GymUser] FOREIGN KEY ([GymUserId]) REFERENCES [import].[GymUser]([GymUserId])
)
