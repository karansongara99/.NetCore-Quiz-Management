USE [Quiz_Management]
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_Insert]    Script Date: 29-01-2025 19:14:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PR_MST_User_Insert]
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
