
create table parent (
	id varchar(50) primary key
);

insert into parent values ('ground444');
insert into parent values ('keiko2023');

create table child (
	num int primary key auto_increment,
	author varchar(50) NOT NULL,
	content text not null,
	foreign key(author) references parent(id) on delete cascade
);

insert into child value ('ground444', 'hellohello');