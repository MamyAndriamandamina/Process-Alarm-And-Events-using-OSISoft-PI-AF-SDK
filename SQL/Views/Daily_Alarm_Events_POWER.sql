USE [DCS]
GO

/****** Object:  View [dbo].[Daily_Alarm_Events_POWER]    Script Date: 20/09/2021 9:53:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[Daily_Alarm_Events_POWER]
AS
SELECT top 10 [Priority] = ROW_NUMBER() OVER (ORDER BY (SELECT 1)), max (Timestamp) as Timestamp, t1.Source, max(Condition) as Condition, max(Message) as [Message], COUNT(Source) as Occurence  FROM (select DISTINCT * from [DCS].[dbo].[tbl_DCS_Alarm_Events]) as t1 where Source like '%_PRJ_OSS7401%'  AND [Condition] NOT LIKE '%Failure%' AND Message NOT LIKE '%operator%' AND [Condition] NOT LIKE '%error%' AND Message NOT LIKE '%error%' AND Message NOT LIKE '%administrator%'
GROUP BY  T1.Source order by (Occurence) DESC

GO

