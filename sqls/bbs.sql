drop table if exists comment;
drop table if exists bbs;

create table bbs (
	num int primary key auto_increment,
	title varchar(70) NOT NULL,
	author varchar(50) NOT NULL,
	writeDate date NOT NULL,
	content MEDIUMTEXT NOT NULL,
	viewcnt int default 0 not null,
	foreign key (author) references userinfo(nickname) on delete cascade
);

create table comment (
	bbs_num int NOT NULL,
	num int primary key auto_increment,
	author varchar(50) NOT NULL,
	writeDate date NOT NULL,
	content TEXT NOT NULL,
	foreign key (bbs_num) references bbs(num) on delete cascade,
	foreign key (author) references userinfo(id) on delete cascade
);