USE [master]
GO

/****** Object:  UserDefinedFunction [dbo].[TrimSpecialChars]    Script Date: 04-02-2024 20:50:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TrimSpecialChars] (@inputString NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @trimmedString NVARCHAR(MAX);

	SET @trimmedString = Reverse(Stuff(Reverse(STUFF(@inputString, 1, PATINDEX('%[^' + CHAR(9) + CHAR(10) + CHAR(13) + CHAR(32) + ']%', @inputString) - 1, '')), 1, PATINDEX('%[^' + CHAR(9) + CHAR(10) + CHAR(13) + CHAR(32) + ']%', Reverse(STUFF(@inputString, 1, PATINDEX('%[^' + CHAR(9) + CHAR(10) + CHAR(13) + CHAR(32) + ']%', @inputString) - 1, ''))) - 1, ''))

	RETURN @trimmedString;
END;

GO


