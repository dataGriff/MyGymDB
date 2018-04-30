CREATE PROCEDURE [import].[pr_PopulateSex]
AS
SET NOCOUNT ON;

INSERT INTO [import].[Sex]
(
[Description]
)
SELECT 'Male' AS 'Description'
UNION ALL
SELECT 'Female' AS 'Description'
EXCEPT 
SELECT [Description] FROM [import].[Sex];
