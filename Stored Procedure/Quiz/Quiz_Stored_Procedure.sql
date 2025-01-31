------Quiz Insert Procedure-------
SELECT * FROM MST_Quiz

CREATE PROCEDURE PR_MST_Quiz_Insert
	@QuizName			NVARCHAR(50),
    @TotalQuestions		NVARCHAR(50),
	@QuizDate			DATETIME,
    @UserID				INT,
    @Created			DATETIME,
    @Modified			DATETIME
AS
BEGIN
    INSERT INTO [MST_Quiz] 
	(
		QuizName,
		TotalQuestions,
		QuizDate,
		UserID,
		Created,
		Modified
	)
	VALUES 
	(
		@QuizName,
		@TotalQuestions,
		@QuizDate,
		@UserID, 
		@Created, 
		@Modified
	);
END

------Quiz UPDATE Procedure-------

CREATE PROCEDURE PR_MST_Quiz_UpdateByPK
	@QuizId				INT,
	@QuizName			NVARCHAR(50),
    @TotalQuestions		NVARCHAR(50),
	@QuizDate			DATETIME,
    @UserID				INT,
    @Created			DATETIME,
    @Modified			DATETIME
AS
BEGIN
   UPDATE [MST_Quiz] 
   SET
		[MST_Quiz].QuizName			= @QuizName,
		[MST_Quiz].TotalQuestions	= @TotalQuestions,
		[MST_Quiz].QuizDate			= @QuizDate,
		[MST_Quiz].UserID			= @UserID,
		[MST_Quiz].Created			= @Created,
		[MST_Quiz].Modified			= @Modified
		WHERE [MST_Quiz].QuizID		= @QuizID
END

------------Quiz Delete Data-------------

CREATE PROCEDURE PR_MST_Quiz_DeleteByPk
	@QuizID INT
AS
BEGIN
	DELETE FROM [MST_Quiz]
	WHERE [MST_Quiz].QuizID = @QuizId
END

--------------Quiz All Data-------------
CREATE PROCEDURE PR_MST_Quiz_SelectAll
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

-----------------Quiz Search By ID-------
CREATE PROCEDURE PR_MST_Quiz_SelectByID
	@QuizID INT
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
	WHERE [MST_Quiz].QuizID = @QuizID
	ORDER BY [MST_Quiz].QuizName
END


-------------Tempory Data Entered--------

SET IDENTITY_INSERT [MST_Quiz] ON

SELECT * FROM [MST_Quiz]

INSERT INTO [MST_Quiz] (QuizID,QuizName,TotalQuestions,QuizDate,UserID,Created,Modified)
VALUES (201,'Tree',02,'08-FEB-2015',101,'05-MAR-2012','08-JUN-2012')

INSERT INTO [MST_Quiz] (QuizID,QuizName,TotalQuestions,QuizDate,UserID,Created,Modified)
VALUES (202,'Java',02,'04-APR-2015',102,'16-JUL-2012','20-JUL-2018')