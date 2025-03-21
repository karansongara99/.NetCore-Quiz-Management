USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Question_SelectByPK]    Script Date: 29-01-2025 19:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Question_SelectByPK]
	@QuestionID INT
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
		[MST_Question].Modified
	FROM [MST_Question]	
	WHERE [MST_Question].QuestionId = @QuestionID
	ORDER BY [MST_Question].QuestionID
END