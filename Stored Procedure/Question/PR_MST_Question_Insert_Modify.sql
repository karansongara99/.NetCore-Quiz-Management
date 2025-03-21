USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Question_Insert]    Script Date: 29-01-2025 19:31:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_Question_Insert]
	@QuestionText		NVARCHAR(50),
	@QuestionLevelID	INT,
	@OptionA			NVARCHAR(50),
	@OptionB			NVARCHAR(50),
	@OptionC			NVARCHAR(50),
	@OptionD			NVARCHAR(50),
	@CorrectOption		NVARCHAR(50),
	@QuestionMarks		INT,
	@IsActive			BIT,
	@UserID				INT,
	@Created			DATETIME,
	@Modified			DATETIME
AS
BEGIN
	INSERT INTO [MST_Question]
	(
		QuestionText,
		QuestionLevelID,
		OptionA,
		OptionB,
		OptionC,
		OptionD,
		CorrectOption,
		QuestionMarks,
		IsActive,
		UserID,	
		Created,
		Modified
	)
	VALUES
	(
		@QuestionText,
		@QuestionLevelID,
		@OptionA,
		@OptionB,
		@OptionC,
		@OptionD,
		@CorrectOption,
		@QuestionMarks,
		@IsActive,
		@UserID,
		@Created,
		@Modified
	)
END