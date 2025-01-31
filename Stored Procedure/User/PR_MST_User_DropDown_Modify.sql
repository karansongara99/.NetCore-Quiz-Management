USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_UserDropDown]    Script Date: 29-01-2025 19:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_UserDropDown]
AS
BEGIN
	SELECT 
		UserID , 
		UserName 
	FROM [MST_User]
	ORDER BY [MST_User].UserName
END
