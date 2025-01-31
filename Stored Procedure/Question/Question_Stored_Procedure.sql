----------Question Insert Procedure-----------
ALTER PROCEDURE PR_MST_Question_Insert
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

--------Question Update Procedure--------

CREATE PROCEDURE PR_MST_Question_UpdateByPk
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

------------Question Delete Procedure--------

CREATE PROCEDURE PR_MST_Question_DeleteByPk
	@QuestionID INT
AS
BEGIN
	DELETE FROM [MST_Question]
	WHERE [MST_Question].QuestionId = @QuestionID
END

-----------Question All Data-----
CREATE PROCEDURE PR_MST_Question_SelectAll
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

-----------Question Search By ID-------------

CREATE PROCEDURE PR_MST_Question_SelectByPK
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


-------------Tempory Data Entered--------
SET IDENTITY_INSERT [MST_Question] ON

SELECT * FROM [MST_Question]

INSERT INTO [MST_Question] (QuestionID,QuestionText,QuestionLevelID,OptionA,OptionB,OptionC,OptionD,CorrectOption,QuestionMarks,IsActive,UserID,Created,Modified)
VALUES (301,'ASP.NET is a ____.',401,'Client-Side technology','Server-side technology','Both','None','B',25,'True',101,'20-DEC-2015','25-DEC-2015')

INSERT INTO [MST_Question] (QuestionID,QuestionText,QuestionLevelID,OptionA,OptionB,OptionC,OptionD,CorrectOption,QuestionMarks,IsActive,UserID,Created,Modified)
VALUES (302,'What is the full form ASP?',402,'Access Server Pages','Active Service Pages','Active Server Pages','Access Service Pages','C',20,'False',102,'20-SEP-2023','25-SEP-2023')