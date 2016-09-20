CREATE VIEW [acc].[User]
	AS 
SELECT 
 GymUser.Email
 , Sex.Description
,[Age]  = CASE  WHEN GETDATE() 
< DATEADD(YEAR, DATEDIFF(YEAR, [BirthDate], GETDATE()), [BirthDate])   
THEN DATEDIFF(YEAR, [BirthDate], GETDATE()) - 1    
ELSE DATEDIFF(YEAR, [BirthDate], GETDATE())  END
FROM import.GymUser GymUser 

JOIN import.Sex Sex ON
Sex.SexId = GymUser.SexId
