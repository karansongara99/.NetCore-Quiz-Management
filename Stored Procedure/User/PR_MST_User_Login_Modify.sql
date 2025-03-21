USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_Login]    Script Date: 29-01-2025 19:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_User_Login]
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