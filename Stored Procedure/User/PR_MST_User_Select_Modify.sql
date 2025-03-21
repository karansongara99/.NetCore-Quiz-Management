USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_SelectAll]    Script Date: 29-01-2025 19:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_User_SelectAll]
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
