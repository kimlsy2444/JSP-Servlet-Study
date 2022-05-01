drop table if exists GameInfo;

create table GameInfo (
	gameTitle varchar(30) not null,
	gameTrailer text, 
	
	gameDescription text,
	gameTitleImage varchar(30),
	gameImage varchar(30),
	gameurl varchar(30),
	primary key (gameTitle)
) default charset=utf8mb4;
