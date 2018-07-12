IF (OBJECT_ID(N'Fun_GetSumByStringAscii', N'FN') IS NOT NULL)
BEGIN
	DROP FUNCTION [dbo].[Fun_GetSumByStringAscii];
END
GO

CREATE FUNCTION [dbo].[Fun_GetSumByStringAscii]
(@string NVARCHAR(1000))
RETURNS INT
AS
BEGIN
	DECLARE @position INT, @sum INT;
	SET @position = 1;
	SET @sum = 0;
	WHILE @position <= LEN(@string)
	BEGIN  
		SET @sum = @sum + ASCII(SUBSTRING(@string, @position, 1));
		SET @position = @position + 1;
	END
	RETURN @sum;
END
GO