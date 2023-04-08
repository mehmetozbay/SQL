-- person adinda yeni bir table olusturun 
-- id adi soyadi yas
-- 3 tane kayi ekleyin-- 
create table proje1.person(
id int not null,
adi varchar(15),
soyadi varchar(16),
yas int,
primary key(id)
);

insert into proje1.person values(1, "Ali", "Korkmaz", 17);
insert into proje1.person values(2,"Ahmet", "Coban", 13);

select * from proje1.person;


create table proje1.student(
id int not null,
ad varchar(45) not null,
not_ort double,
kayit_tarihi date,

primary key(id)
);


insert into proje1.student values(1, "Ali",85.85, curdate());
insert into proje1.student values(2, "Can",65.85, curdate());
select * from proje1.student;

create table proje1.siniflar(
id int not null,
sinif_adi varchar(4) not null unique,
kayit_zamani datetime,
primary key(id)
);


insert into proje1.siniflar values(1,"2/A",now());
insert into proje1.siniflar values(2,"3/A","2023-03-08 20:10:15");
select * from proje1.siniflar;

create table proje1.kisiler(
id int not null auto_increment,
adi varchar(45),
primary key(id)
);


insert into proje1.kisiler(adi) values("Ali");
insert into proje1.kisiler(adi) values("Sena");
select * from proje1.kisiler;



create table proje1.persons(
id int not null,
adi varchar(45),
yas int,
check (yas>18),
primary key(id)
);
insert into proje1.persons values(1, "Asya",20);
insert into proje1.persons values(2, "Can",18);

create table proje1.person2(
id int not null,
adi varchar(45),
yas int,
check (yas>=18),
primary key(id)
);


insert into proje1.person2 values(1, "Asya",20);
insert into proje1.person2 values(2, "Can",18);



create table proje1.person3(
id int not null,
adi varchar(45),
yas int,
check (yas>=18&&yas<25),
primary key(id)
);


insert into proje1.person3 values(1, "Asya",28);
insert into proje1.person3 values(2, "Can",18);


create table proje1.Orders(
id int not null,
price double,
orderDate datetime default now(), 
primary key(id)
);


insert into proje1.Orders(id, price) values(1, 35.55);
select * from proje1.Orders;


create table proje1.Orders2(
id int not null,
price double default 0,
orderDate datetime default now(), 
primary key(id)
);
insert into proje1.Orders2(id) values(1);
select * from proje1.Orders2;


-- product tablosu olusturalim
-- id auto_increment
-- adi not null
-- fiyat 0 dan buyuk olsun
-- adet default 0
-- num unique olsun
-- kayittarihi dateTime default now()
-- 2 tane kayit ekleyiniz-- 



create table proje1.product(
id int not null auto_increment,
adi varchar(45) not null,
fiyat double,
adet int default 0,
num int unique,
kayitTarihi datetime default now(),
check (fiyat>0),
primary key(id)
);


insert into proje1.product(adi,fiyat,adet, num) values("Elma", 20.30, 10, 128);



-- customer tablosu

-- id ->auto_increment not null
-- adi ->not null
-- adres
-- kayit tarihi default now
-- yas>18

-- 2 tane kayit ekleyiniz



create table proje1.customer(
id int not null auto_increment,
adi varchar(45) not null,
adres varchar(255),
kayitTarihi datetime default now(),
yas int,
check (yas>18),
primary key(id)
);


insert into proje1.customer(adi, adres, yas) values("Nergis", "Ankara", 19);

select * from proje1.customer;







