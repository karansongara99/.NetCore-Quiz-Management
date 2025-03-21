USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Question_SelectAll]    Script Date: 29-01-2025 19:35:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Question_SelectAll]
AS
BEGIN
	SELECT 
		[MST_Question].QuestionId,
		[MST_Question].QuestionText,
		[MST_Question].QuestionLevelID,
		[MST_Question].OptionA,
		[MST_Question].OptionB,
		[MST_Question].OptionC,
		[MST_Question].OptionD,
		[MST_Question].CorrectOption,
		[MST_Question].QuestionMarks,
		[MST_Question].IsActive,
		[MST_Question].UserID,
		[MST_Question].Created,
		[MST_Question].Modified,
		[MST_QuestionLevel].[QuestionLevel]
	FROM [MST_Question]
	INNER JOIN [MST_QuestionLevel] ON [MST_QuestionLevel].QuestionLevelID = [MST_Question].QuestionLevelID
	INNER JOIN [MST_User] ON [MST_User].[UserID] = [MST_Question].[UserID]
	ORDER BY [MST_Question].QuestionID
END
