create table usertype (
	typeid tinyint primary key,
	name varchar(35) NOT NULL
);

insert into usertype values (1, "admin");
insert into usertype values (2, "guest");

create table userinfo (
	id varchar(20) primary key,
	pwd varchar(512) NOT NULL,
	re varchar(512) NOT NULL,
	email varchar(60) NOT NULL UNIQUE,
	address varchar(50) NULL,
	typeid tinyint NOT NULL,
	foreign key (typeid) references usertype(typeid)
);

insert into userinfo values ("admin", sha2("admin1234", 512), "admin", "admin@mylib.co.kr", NULL, 1);