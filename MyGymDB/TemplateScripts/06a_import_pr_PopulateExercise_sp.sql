CREATE PROCEDURE [import].[pr_PopulateExercise]
AS
SET NOCOUNT ON;

INSERT INTO [import].[Exercise]
(
[Description]
)
SELECT 'Press Up' AS 'Description'
UNION ALL
SELECT 'Sit Up' AS 'Description'
UNION ALL
SELECT 'Pull Up' AS 'Description'
UNION ALL
SELECT 'Squat' AS 'Description'
EXCEPT 
SELECT [Description] FROM [import].[Exercise];

