--FactTableScript

CREATE TABLE [dbo].[FactMedian](
	[FactMedianKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolKey] [int] NOT NULL,
	[SuburbKey] [int] NOT NULL,
	[StationKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[PropertyMedianValue] [bigint] NULL,
 CONSTRAINT [PK_Fact_Median] PRIMARY KEY CLUSTERED 
(
	[FactMedianKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactMedian]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Median_DimDate] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactMedian]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Median_DimSchool] FOREIGN KEY([SchoolKey])
REFERENCES [dbo].[Dim.School] ([SchoolKey])
GO

ALTER TABLE [dbo].[FactMedian]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Median_DimStation] FOREIGN KEY([StationKey])
REFERENCES [dbo].[Dim.Station] ([StationKey])
GO

ALTER TABLE [dbo].[FactMedian]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Median_DimSuburb] FOREIGN KEY([SuburbKey])
REFERENCES [dbo].[Dim.Suburb] ([SuburbKey])
GO

--DimSuburbTable

CREATE TABLE [dbo].[Dim.Suburb](
	[SuburbKey] [int] IDENTITY(1,1) NOT NULL,
	[SuburbAlternateKey] [int] NOT NULL,
	[StateName] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[SuburbKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--DimSchoolTable

CREATE TABLE [dbo].[Dim.School](
	[SchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[SchoolAlternateKey] [int] NOT NULL,
	[SchoolName] [nvarchar](255) NULL,
	[StreetName] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[PostCode] [int] NULL,
	[SchoolLevel] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--DimStationTable

CREATE TABLE [dbo].[Dim.Station](
	[StationKey] [int] IDENTITY(1,1) NOT NULL,
	[StationAlternateKey] [int] NOT NULL,
	[TrainStation] [nvarchar](255) NULL,
	[StreetName] [nvarchar](255) NULL,
	[StreetType] [nvarchar](255) NULL,
	[EntranceType] [nvarchar](255) NULL,
	[Lat] [float] NULL,
	[Long] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[StationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


--DimDatetable

CREATE TABLE [dbo].[DimDate](
	[CalendarDate] [datetime] NULL,
	[CalendarYear] [int] NULL,
	[DayShort] [nvarchar](255) NULL,
	[DayLong] [nvarchar](255) NULL,
	[DayInMonth] [int] NULL,
	[MonthShort] [nvarchar](255) NULL,
	[MonthLong] [nvarchar](255) NULL,
	[MonthShortCaption] [datetime] NULL,
	[MonthLongCaption] [datetime] NULL,
	[CalendarMonthNo] [int] NULL,
	[CalendarMonth] [int] NULL,
	[CalendarQuarterNo] [int] NULL,
	[CalendarQuarter] [int] NULL,
	[CalendarQuarterShort] [nvarchar](255) NULL,
	[CalendarQuarterLong] [nvarchar](255) NULL,
	[CalendarQuarterShortCaption] [nvarchar](255) NULL,
	[CalendarQuarterLongCaption] [nvarchar](255) NULL,
	[FinancialYearNo] [int] NULL,
	[FinancialMonthNo] [int] NULL,
	[FinancialMonth] [int] NULL,
	[FinancialQuarterNo] [int] NULL,
	[FinancialQuarter] [int] NULL,
	[FinancialQuarterLongCaption] [nvarchar](255) NULL,
	[FinancialYear] [nvarchar](255) NULL,
	[FinancialYearShortCaption] [nvarchar](255) NULL,
	[FinancialYearLongCaption] [nvarchar](255) NULL,
	[DayInWeekMonday] [int] NULL,
	[DayInWeekSaturday] [int] NULL,
	[DayInWeekSunday] [int] NULL,
	[CalendarWeek] [int] NULL,
	[CalendarWeekCaption] [nvarchar](255) NULL,
	[CalendarWeekKey] [int] NULL,
	[DateKey] [int] NOT NULL,
 CONSTRAINT [PK_DateKey] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
