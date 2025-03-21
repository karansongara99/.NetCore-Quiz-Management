USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Question_UpdateByPk]    Script Date: 29-01-2025 19:33:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_Question_UpdateByPk]
	@QuestionID			INT,
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
	UPDATE [MST_Question] 
	SET
		[MST_Question].[QuestionText]		= @QuestionText,
		[MST_Question].[QuestionLevelID]	= @QuestionLevelID,
		[MST_Question].[OptionA]			= @OptionA,
		[MST_Question].[OptionB]			= @OptionB,
		[MST_Question].[OptionC]			= @OptionC,
		[MST_Question].[OptionD]			= @OptionD,
		[MST_Question].[CorrectOption]		= @CorrectOption,
		[MST_Question].[QuestionMarks]		= @QuestionMarks,
		[MST_Question].[IsActive]			= @IsActive,
		[MST_Question].[UserID]				= @UserID,
		[MST_Question].[Created]			= @Created,
		[MST_Question].[Modified]			= @Modified
	WHERE [MST_Question].QuestionID			= @QuestionID
END