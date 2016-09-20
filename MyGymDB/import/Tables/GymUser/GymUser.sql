CREATE TABLE [import].[GymUser]
(
	[GymUserId] INT IDENTITY(-2147483648, 1) NOT NULL  CONSTRAINT PK_GymUser PRIMARY KEY
	,[Email] NVARCHAR(255) NOT NULL
    ,[SexId] TINYINT NOT NULL
    ,[BirthDate] DATE NOT NULL,
    [FirstInserted] DATETIME2 NOT NULL DEFAULT getdate(), 
    CONSTRAINT [FK_GymUser_Sex] FOREIGN KEY ([SexId]) REFERENCES [import].[Sex]([SexId])
)

GO

CREATE UNIQUE INDEX [IX_GymUser_Email] ON [import].[GymUser] ([Email])
