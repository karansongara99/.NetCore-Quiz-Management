USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Quiz_DeleteByPk]    Script Date: 29-01-2025 19:57:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Quiz_DeleteByPk]
	@QuizID INT
AS
BEGIN
	DELETE FROM [MST_Quiz]
	WHERE [MST_Quiz].QuizID = @QuizId
END
