USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_QuestionLevel_Insert]    Script Date: 29-01-2025 19:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_QuestionLevel_Insert]
    @QuestionLevel  NVARCHAR(50),
    @UserID			INT,
    @Created		DATETIME,
	@Modified		DATETIME
AS
BEGIN
    INSERT INTO [MST_QuestionLevel]
	(
		QuestionLevel,
		UserID,
		Created,
		Modified
	)
	VALUES 
	(
		@QuestionLevel,
		@UserID, 
		@Created, 
		@Modified
	);
END