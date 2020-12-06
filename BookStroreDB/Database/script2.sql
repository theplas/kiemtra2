USE[BookStroreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBooks]    Script Date: 12/6/2020 11:32:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Author,,Name >
 --Create date: < Create Date,,>
 --Description:	< Description,,>
 -- =============================================
 ALTER PROCEDURE[dbo].[sp_GetBooks]
AS
BEGIN
	SELECT [BookId]
		  ,[BookName]
		  ,[Author]
		  ,[BookRow]
FROM[dbo].[Books]
	  WHERE IsDelete = 0
END
