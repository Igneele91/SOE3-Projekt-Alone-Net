USE [PanjutorialsDB]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 23.01.2023 17:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zoo]    Script Date: 23.01.2023 17:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zoo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZooAnimal]    Script Date: 23.01.2023 17:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZooAnimal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZooId] [int] NOT NULL,
	[AnimalId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([Id], [Name]) VALUES (1, N'Wolf')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (2, N'Eule')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (3, N'Tiger')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (4, N'Krokodil')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (5, N'Hai')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (6, N'Delphin')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (7, N'Hund')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (8, N'Austria')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (9, N'Papagei')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (10, N'Gecko')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (11, N'Kanguru')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (12, N'Zebra')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (23, N'Kuh')
INSERT [dbo].[Animal] ([Id], [Name]) VALUES (25, N'Zebra')
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[Zoo] ON 

INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (1, N'New York')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (2, N'Tokyo')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (3, N'Berlin')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (4, N'Hairo')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (5, N'Milano')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (7, N'Zurich')
INSERT [dbo].[Zoo] ([Id], [Location]) VALUES (13, N'Shengo')
SET IDENTITY_INSERT [dbo].[Zoo] OFF
GO
SET IDENTITY_INSERT [dbo].[ZooAnimal] ON 

INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (1, 1, 1)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (2, 1, 2)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (4, 2, 3)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (6, 2, 4)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (9, 3, 5)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (10, 3, 6)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (13, 4, 7)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (14, 4, 8)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (15, 5, 1)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (16, 5, 2)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (17, 5, 3)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (31, 5, 4)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (33, 5, 5)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (34, 5, 6)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (35, 5, 7)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (36, 5, 8)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (37, 4, 7)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (38, 4, 4)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (39, 7, 6)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (40, 7, 4)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (41, 7, 3)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (42, 7, 10)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (44, 7, 8)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (45, 7, 5)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (46, 7, 11)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (53, 4, 5)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (59, 13, 6)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (60, 13, 3)
INSERT [dbo].[ZooAnimal] ([Id], [ZooId], [AnimalId]) VALUES (61, 13, 2)
SET IDENTITY_INSERT [dbo].[ZooAnimal] OFF
GO
ALTER TABLE [dbo].[ZooAnimal]  WITH CHECK ADD  CONSTRAINT [AnimalFK] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ZooAnimal] CHECK CONSTRAINT [AnimalFK]
GO
ALTER TABLE [dbo].[ZooAnimal]  WITH CHECK ADD  CONSTRAINT [ZooFK] FOREIGN KEY([ZooId])
REFERENCES [dbo].[Zoo] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ZooAnimal] CHECK CONSTRAINT [ZooFK]
GO
