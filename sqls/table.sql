drop table if exists userinfo;
drop table if exists usertype;

create table usertype (
	typeid tinyint primary key,
	name varchar(35) NOT NULL
);

insert into usertype values (1, "admin");
insert into usertype values (2, "guest");

create table userinfo (
	id varchar(20) primary key,
	pwd blob NOT NULL,
	re blob NOT NULL,
	nickname varchar(50) NOT NULL UNIQUE,
	email varchar(60) NOT NULL UNIQUE,
	address varchar(50) NULL,
	typeid tinyint NOT NULL,
	foreign key (typeid) references usertype(typeid),
	check(re = pwd)
);

insert into userinfo values ("admin", aes_encrypt("admin1234", sha2("key", 512)), aes_encrypt("admin1234", sha2("key", 512)), "admin", "admin@mylib.co.kr", NULL, 1);

insert into userinfo values ("alistart01",	aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart01",	"alistart01@naver.com",	"부산",	2);
insert into userinfo values ("alistart02",	aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart02",	"alistart02@naver.com",	"부산",	2);
insert into userinfo values ("alistart03",		aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),"alistart03",	"alistart03@naver.com",	"부산",	2);
insert into userinfo values ("alistart04",		aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart04",	"alistart04@naver.com",	"부산",	2);
insert into userinfo values ("alistart05",		aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart05",	"alistart05@naver.com",	"부산",	2);
insert into userinfo values ("alistart06",		aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart06",	"alistart06@naver.com",	"부산",	2);
insert into userinfo values ("alistart07",	aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)), "alistart07",	"alistart07@naver.com",	"부산",	2);
insert into userinfo values ("alistart08",	aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart08",	"alistart08@naver.com",	"부산",	2);
insert into userinfo values ("alistart09", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),   "alistart09",	"alistart09@naver.com",	"부산"	2);
insert into userinfo values ("alistart10", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart10",	"alistart10@naver.com",	"부산",	2);
insert into userinfo values ("alistart11", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart11",	"alistart11@naver.com",	"부산",	2);
insert into userinfo values ("alistart12", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart12",	"alistart12@naver.com",	"부산",	2);
insert into userinfo values ("alistart13", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart13",	"alistart13@naver.com",	"부산",	2);
insert into userinfo values ("alistart14", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart14",	"alistart14@naver.com",	"부산",	2);
insert into userinfo values ("alistart15", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart15",	"alistart15@naver.com",	"부산",	2);
insert into userinfo values ("alistart16", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart16",	"alistart16@naver.com",	"부산",	2);
insert into userinfo values ("alistart17", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart17",	"alistart17@naver.com",	"부산",	2);
insert into userinfo values ("alistart18", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart18",	"alistart18@naver.com",	"부산",	2);
insert into userinfo values ("alistart19", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart19",	"alistart19@naver.com",	"부산",	2);
insert into userinfo values ("alistart20", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart20",	"alistart20@naver.com",	"부산",	2);
insert into userinfo values ("alistart21", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart21",	"alistart21@naver.com",	"부산",	2);
insert into userinfo values ("alistart22", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart22",	"alistart22@naver.com",	"부산",	2);
insert into userinfo values ("alistart23", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart23",	"alistart23@naver.com",	"부산",	2);
insert into userinfo values ("alistart24", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart24",	"alistart24@naver.com",	"부산",	2);
insert into userinfo values ("alistart25", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart25",	"alistart25@naver.com",	"부산",	2);
insert into userinfo values ("alistart26", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart26",	"alistart26@naver.com",	"부산",	2);
insert into userinfo values ("alistart27", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart27",	"alistart27@naver.com",	"부산",	2);
insert into userinfo values ("alistart28", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart28",	"alistart28@naver.com",	"부산",	2);
insert into userinfo values ("alistart29", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart29",	"alistart29@naver.com",	"부산",	2);
insert into userinfo values ("alistart30", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart30",	"alistart30@naver.com",	"부산",	2);
insert into userinfo values ("alistart31", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart31",	"alistart31@naver.com",	"부산",	2);
insert into userinfo values ("alistart32", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart32",	"alistart32@naver.com",	"부산",	2);
insert into userinfo values ("alistart33", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart33",	"alistart33@naver.com",	"부산",	2);
insert into userinfo values ("alistart34", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart34",	"alistart34@naver.com",	"부산",	2);
insert into userinfo values ("alistart35", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart35",	"alistart35@naver.com",	"부산",	2);
insert into userinfo values ("alistart36", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart36",	"alistart36@naver.com",	"부산",	2);
insert into userinfo values ("alistart37", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart37",	"alistart37@naver.com",	"부산",	2);
insert into userinfo values ("alistart38", aes_encrypt("12345", sha2("key", 512)),	 aes_encrypt("12345", sha2("key", 512)),	"alistart38",	"alistart38@naver.com",	"부산",	2);


