USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_UpdateByPk]    Script Date: 29-01-2025 19:16:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PR_MST_User_UpdateByPk]
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
