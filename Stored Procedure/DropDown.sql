CREATE PROCEDURE PR_MST_UserDropDown
AS
BEGIN
	SELECT 
		UserID , 
		UserName 
	FROM [MST_User]
	ORDER BY [MST_User].UserName
END

---------------

CREATE PROCEDURE PR_MST_QuestionLevelDropDown
AS
BEGIN 
	SELECT 
		QuestionLevelID,
		QuestionLevel
	From [MST_QuestionLevel] 
	ORDER BY QuestionLevel
END



------------

CREATE PROCEDURE PR_MST_QuizDropDown
AS
BEGIN 
	SELECT 
		QuizID,
		QuizName
	From [MST_Quiz] 
	ORDER BY QuizName
END


---------

CREATE PROCEDURE PR_MST_QuestionDropDown
AS
BEGIN 
	
	SELECT 
		QuestionID,
		QuestionText
	From [MST_Question] 
	ORDER BY QuestionText
END