USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Quiz_SelectAll]    Script Date: 29-01-2025 19:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Quiz_SelectAll]
AS
BEGIN
	SELECT 
		[MST_Quiz].QuizID,
		[MST_Quiz].QuizName,
		[MST_Quiz].TotalQuestions,
		[MST_Quiz].QuizDate,
		[MST_Quiz].UserID,
		[MST_Quiz].Created,
		[MST_Quiz].Modified
	FROM [MST_Quiz]
	INNER JOIN [MST_User] ON [MST_User].UserID = [MST_Quiz].UserID
	ORDER BY [MST_Quiz].QuizName
END
