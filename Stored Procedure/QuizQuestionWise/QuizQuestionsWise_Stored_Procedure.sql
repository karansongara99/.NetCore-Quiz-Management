----QuizQuestionsWise Insert Procedure----

CREATE PROCEDURE PR_MST_QuizQuestionsWise_Insert
	@QuizID			INT,
    @QuestionID		INT,
    @UserID			INT,
    @Created		DATETIME,
	@Modified		DATETIME
AS
BEGIN
    INSERT INTO [MST_QuizWiseQuestions] 
	(
		QuizID,
		QuestionID,
		UserID,
		Created,
		Modified
	)
	VALUES 
	(
		@QuizID,
		@QuestionID, 
		@UserID,
		@Created,
		@Modified
	);
END

----QuizQuestionsWise Update Procedure--------
CREATE PROCEDURE PR_MST_QuizQuestionsWise_UpdateByPk
	@QuizWiseQuestionsID	INT,
	@QuizID					INT,
    @QuestionID				INT,
    @UserID					INT,
    @Created				DATETIME,
	@Modified				DATETIME
AS
BEGIN
    UPDATE [MST_QuizWiseQuestions]
    SET  [dbo].[MST_QuizWiseQuestions].[QuizID]					= @QuizID, 
         [dbo].[MST_QuizWiseQuestions].[QuestionID]				= @QuestionID, 
         [dbo].[MST_QuizWiseQuestions].[UserID]					= @UserID, 
		 [dbo].[MST_QuizWiseQuestions].[Created]				= @Created
   WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID]	= @QuizWiseQuestionsID;
END

-------QuizQuestionsWise Delete Procedure-------

CREATE PROCEDURE PR_MST_QuizQuestionsWise_DeleteByPk
    @QuizWiseQuestionsID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuizWiseQuestions]
    WHERE [dbo].[MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID;
END

--------QuizQuestionsWise All Data-----------

CREATE PROCEDURE PR_MST_QuizQuestionsWise_SelectAll
AS
BEGIN
     SELECT [MST_QuizWiseQuestions].[QuizWiseQuestionsID], 
			[MST_QuizWiseQuestions].[QuizID], 
			[MST_QuizWiseQuestions].[QuestionID], 
			[MST_QuizWiseQuestions].[UserID], 
			[MST_QuizWiseQuestions].[Created],
			[MST_QuizWiseQuestions].[Modified]
    FROM [MST_QuizWiseQuestions]
	INNER JOIN [MST_Quiz] ON [MST_QuizWiseQuestions].QuizID = [MST_QuizWiseQuestions].QuizID
	INNER JOIN [MST_Question] ON [MST_Question].QuestionID = [MST_QuizWiseQuestions].QuestionID
	INNER JOIN [MST_User] ON [MST_User].UserID = [MST_QuizWiseQuestions].UserID
    ORDER BY [MST_QuizWiseQuestions].[QuizWiseQuestionsID];
END

---------------------QuizQuestionsWise By ID---------

CREATE PROCEDURE PR_MST_QuizQuestionsWise_SelectByPk
    @QuizWiseQuestionsID INT
AS
BEGIN
    SELECT [MST_QuizWiseQuestions].[QuizWiseQuestionsID], 
		   [MST_QuizWiseQuestions].[QuizID], 
           [MST_QuizWiseQuestions].[QuestionID], 
		   [MST_QuizWiseQuestions].[UserID], 
		   [MST_QuizWiseQuestions].[Created],
		   [MST_QuizWiseQuestions].[Modified]
    FROM  [MST_QuizWiseQuestions]
    WHERE [MST_QuizWiseQuestions].[QuizWiseQuestionsID] = @QuizWiseQuestionsID
    ORDER BY [MST_QuizWiseQuestions].[QuizWiseQuestionsID];
END

-------------Tempory Data Entered--------

SELECT * FROM [MST_QuizWiseQuestions]

SET IDENTITY_INSERT MST_QuizWiseQuestions ON

INSERT INTO  [MST_QuizWiseQuestions] (QuizWiseQuestionsID,QuizID,QuestionID,UserID,Created,Modified)
VALUES (501,201,301,101,'20-DEC-2015','25-DEC-2015')

INSERT INTO  [MST_QuizWiseQuestions] (QuizWiseQuestionsID,QuizID,QuestionID,UserID,Created,Modified)
VALUES (502,202,302,102,'11-AUG-2012','12-AUG-2012')