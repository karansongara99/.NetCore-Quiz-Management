USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_DeleteByPk]    Script Date: 29-01-2025 19:17:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_User_DeleteByPk]
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[MST_User]
    WHERE [dbo].[MST_User].[UserID] = @UserID;
END
