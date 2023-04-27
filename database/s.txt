CREATE TABLE MusicAlbum(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE
);

CREATE TABLE genre(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  name VARCHAR(255),
  FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE [Label](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[title] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[items] [nvarchar](MAX) NULL,
);

CREATE TABLE [Source](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[name] [varchar](50) NULL,
	[items] [nvarchar](MAX) NULL,
)

CREATE TABLE [Author](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[items] [varchar](50) NULL,
)


CREATE TABLE [Item](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[genre] [int] ,
	[author] [int] ,
	[source] [int] ,
	[label] [int] ,
	[publishdate] [date] ,
	[archived] [BOOLEAN] ,
);

ALTER TABLE [Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Author] FOREIGN KEY([author])
REFERENCES [Author] ([id])
ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_Author]

ALTER TABLE [Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Genre] FOREIGN KEY([genre])
REFERENCES [Genre] ([id])
ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_Genre]

ALTER TABLE [Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Label] FOREIGN KEY([label])
REFERENCES [Label] ([id])
ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_Label]

ALTER TABLE [Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Source] FOREIGN KEY([source])
REFERENCES [Source] ([id])
ALTER TABLE [Item] CHECK CONSTRAINT [FK_Item_Source]

CREATE TABLE [Book](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[genre] [int] ,
	[author] [int] ,
	[source] [int] ,
	[label] [int] ,
	[publishdate] [date] ,
	[archived] [BOOLEAN] ,
);

ALTER TABLE [Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([author])
REFERENCES [Author] ([id])
ALTER TABLE [Book] CHECK CONSTRAINT [FK_Book_Author]

ALTER TABLE [Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Genre] FOREIGN KEY([genre])
REFERENCES [Genre] ([id])
ALTER TABLE [Book] CHECK CONSTRAINT [FK_Book_Genre]

ALTER TABLE [Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Label] FOREIGN KEY([label])
REFERENCES [Label] ([id])
ALTER TABLE [Book] CHECK CONSTRAINT [FK_Book_Label]

ALTER TABLE [Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Source] FOREIGN KEY([source])
REFERENCES [Source] ([id])
ALTER TABLE [Book] CHECK CONSTRAINT [FK_Book_Source]

CREATE TABLE [Game](
	[id] [int] GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
	[genre] [int] ,
	[author] [int] ,
	[source] [int] ,
	[label] [int] ,
	[publishdate] [date] ,
	[archived] [BOOLEAN] ,
);

ALTER TABLE [Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Author] FOREIGN KEY([author])
REFERENCES [Author] ([id])
ALTER TABLE [Game] CHECK CONSTRAINT [FK_Game_Author]

ALTER TABLE [Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Genre] FOREIGN KEY([genre])
REFERENCES [Genre] ([id])
ALTER TABLE [Game] CHECK CONSTRAINT [FK_Game_Genre]

ALTER TABLE [Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Label] FOREIGN KEY([label])
REFERENCES [Label] ([id])
ALTER TABLE [Game] CHECK CONSTRAINT [FK_Game_Label]

ALTER TABLE [Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Source] FOREIGN KEY([source])
REFERENCES [Source] ([id])
ALTER TABLE [Game] CHECK CONSTRAINT [FK_Game_Source]