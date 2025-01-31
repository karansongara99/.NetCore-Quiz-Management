USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Question_DeleteByPk]    Script Date: 29-01-2025 19:34:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Question_DeleteByPk]
	@QuestionID INT
AS
BEGIN
	DELETE FROM [MST_Question]
	WHERE [MST_Question].QuestionId = @QuestionID
END
