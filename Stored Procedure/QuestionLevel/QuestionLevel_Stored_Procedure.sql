----Question Level Insert Procedure----

CREATE PROCEDURE PR_MST_QuestionLevel_Insert
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

----Question Level Update Procedure--------

CREATE PROCEDURE PR_MST_QuestionLevel_UpdateByPk
	@QuestionLevelID	INT,
	@QuestionLevel		NVARCHAR(50),
    @UserID				INT,
    @Created			DATETIME,
	@Modified			DATETIME
AS
BEGIN
    UPDATE [MST_QuestionLevel]
    SET   
		 [dbo].[MST_QuestionLevel].[QuestionLevel]		= @QuestionLevel, 
         [dbo].[MST_QuestionLevel].[UserID]				= @UserID, 
		 [dbo].[MST_QuestionLevel].[Created]			= @Created,
		 [dbo].[MST_QuestionLevel].[Modified]			= @Modified
   WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID]	= @QuestionLevelID
END

-------Question Level Delete Procedure-------

CREATE PROCEDURE PR_MST_QuestionLevel_DeleteByPk
    @QuestionLevelID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_QuestionLevel]
    WHERE [dbo].[MST_QuestionLevel].[QuestionLevelID] = @QuestionLevelID;
END

--------Question Level All Data-----------

CREATE PROCEDURE PR_MST_QuestionLevel_SelectAll
AS
BEGIN
   SELECT  [MST_QuestionLevel].[QuestionLevelID], 
		   [MST_QuestionLevel].[QuestionLevel], 
           [MST_QuestionLevel].[UserID], 
		   [MST_QuestionLevel].[Created],
		   [MST_QuestionLevel].[Modified]
    FROM [MST_QuestionLevel]
	INNER JOIN [MST_User] ON [MST_User].UserID = [MST_QuestionLevel].UserID
    ORDER BY [MST_QuestionLevel].QuestionLevel
END

---------------------Question Level By ID---------

CREATE PROCEDURE PR_MST_QuestionLevel_SelectByPk
    @QuestionLevelID INT
AS
BEGIN
    SELECT [MST_QuestionLevel].[QuestionLevelID], 
		   [MST_QuestionLevel].[QuestionLevel], 
           [MST_QuestionLevel].[UserID], 
		   [MST_QuestionLevel].[Created],
		   [MST_QuestionLevel].[Modified]
    FROM [MST_QuestionLevel]
    WHERE [MST_QuestionLevel].QuestionLevelID = @QuestionLevelID
    ORDER BY [MST_QuestionLevel].QuestionLevel
END

-------------Tempory Data Entered--------
SET IDENTITY_INSERT [MST_QuestionLevel] ON

SELECT * FROM [MST_QuestionLevel]

INSERT INTO [MST_QuestionLevel] (QuestionLevelID,QuestionLevel,UserID,Created,Modified) 
VALUES (401,'Easy',101,'20-DEC-2015','25-DEC-2015')

INSERT INTO [MST_QuestionLevel] (QuestionLevelID,QuestionLevel,UserID,Created,Modified) 
VALUES (402,'Hard',102,'10-DEC-2020','18-DEC-2020')

