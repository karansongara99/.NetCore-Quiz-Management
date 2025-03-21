USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_SelectByPK]    Script Date: 29-01-2025 19:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_User_SelectByPK]
    @UserID INT
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
    WHERE [MST_User].[UserID] = @UserID
    ORDER BY [MST_User].[UserID];
END