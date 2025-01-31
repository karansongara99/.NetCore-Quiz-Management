----User Insert Procedure----
CREATE PROCEDURE PR_MST_User_Insert
	@UserName	NVARCHAR(50),
    @Password	NVARCHAR(50),
    @Email		NVARCHAR(50),
    @Mobile		NVARCHAR(50),
    @IsActive	BIT,
	@IsAdmin	BIT,
    @Created	DATETIME,
	@Modified	DATETIME
AS
BEGIN
    INSERT INTO [MST_User] 
	(
		UserName,
		Password,
		Email,
		Mobile,
		IsActive,
		IsAdmin,
		Created,
		Modified)
	VALUES 
	(
		@UserName,
		@Password,
		@Email, 
		@Mobile,
		@IsActive,
		@IsAdmin, 
		@Created,
		@Modified
	);
END

----User Update Procedure--------

CREATE PROCEDURE PR_MST_User_UpdateByPk
	@UserID		INT,
	@UserName	NVARCHAR(50),
    @Password	NVARCHAR(50),
    @Email		NVARCHAR(50),
    @Mobile		NVARCHAR(50),
    @IsActive	BIT,
	@IsAdmin	BIT,
    @Created	DATETIME,
	@Modified	DATETIME
AS
BEGIN
    UPDATE [MST_User]
    SET  [dbo].[MST_User].[UserName]	= @UserName, 
         [dbo].[MST_User].[Password]	= @Password, 
         [dbo].[MST_User].[Email]		= @Password, 
         [dbo].[MST_User].[Mobile]		= @Email, 
         [dbo].[MST_User].[IsActive]	= @IsActive,
		 [dbo].[MST_User].[IsAdmin]		= @IsAdmin,
		 [dbo].[MST_User].[Created]		= @Created
   WHERE [dbo].[MST_User].[UserID]		= @UserID;
END

-------User Delete Procedure-------

CREATE PROCEDURE PR_MST_User_DeleteByPk
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_User]
    WHERE [dbo].[MST_User].[UserID] = @UserID;
END

--------User All Data-----------

CREATE PROCEDURE PR_MST_User_SelectAll
AS
BEGIN
    SELECT [MST_User].[UserID], 
           [MST_User].[UserName], 
           [MST_User].[Password], 
		   [MST_User].[Email], 
           [MST_User].[Mobile], 
           [MST_User].[IsActive],
		   [MST_User].[IsAdmin],
		   [MST_User].[Created],
		   [MST_User].[Modified]
    FROM [MST_User]
    ORDER BY [MST_User].UserName
END

---------------------User By ID---------

CREATE PROCEDURE PR_MST_User_SelectByPK
    @UserID INT
AS
BEGIN
    SELECT [MST_User].[UserID], 
		   [MST_User].UserName, 
           [MST_User].Password, 
		   [MST_User].Email, 
           [MST_User].Mobile, 
           [MST_User].IsActive,
		   [MST_User].IsAdmin,
		   [MST_User].Created,
		   [MST_User].Modified
    FROM [MST_User]
    WHERE [MST_User].[UserID] = @UserID
    ORDER BY [MST_User].[UserID];
END

----PR_MST_User_SelectByUsernamePassword

CREATE PROCEDURE PR_MST_User_Login
@UserName  NVARCHAR(50),
@Password  NVARCHAR(50)
AS
BEGIN
	SELECT 
		Username, 
		Password 
	FROM [MST_User]
	WHERE 
	(Username = @UserName OR Email = @UserName OR Mobile = @UserName)
	AND Password = @Password
END

EXEC PR_MST_User_Login  '6353263735','5623'

SELECT * FROM [Mst_User]

-------------Tempory Data Entered--------
SET IDENTITY_INSERT MST_User ON

INSERT INTO MST_User (UserID,UserName,Password,Email,Mobile,IsActive,IsAdmin,Created,Modified) 
VALUES (101,'Karan',5623,'karansongara@gmail.com',6353263735,'True','True','1-JAN-91','5-JAN-91')

INSERT INTO MST_User (UserID,UserName,Password,Email,Mobile,IsActive,IsAdmin,Created,Modified) 
VALUES (102,'Nikhil',1112,'nikhilpatel04@gmail.com',94228230244,'True','True','1-JAN-2000','5-JAN-2000')
