
use proje1;

create table urunler(
urun_id int primary key auto_increment,
urun_adi varchar(50), 
fiyat double
);

-- insert into urunler(urun_adi, fiyat) values ('Hamburger', 8.50),('Cheeseburger', 10.50),('Sucuk Burger', 11);

insert into urunler(urun_adi, fiyat) values ('Hamburger', 8.50);
insert into urunler(urun_adi, fiyat) values('Cheeseburger', 10.50);
insert into urunler(urun_adi, fiyat) values('Sucuk Burger', 11);




create table siparis(
siparis_id int primary key auto_increment,
urun_id int,
adet int, 
toplam_fiyat double,
adres varchar(255), 
foreign key (urun_id) references urunler(urun_id)
-- on delete cascade
-- on update cascade

on delete set null
on update set null
);

insert into siparis(urun_id, adet, toplam_fiyat, adres) values(1, 5, 42.5,'Istanbul');
insert into siparis(urun_id, adet, toplam_fiyat, adres) values(2, 2, 21,'Ankara');
insert into siparis(urun_id, adet, toplam_fiyat, adres) values(3, 1, 11,'Ankara');

select * from siparis;
select * from urunler; 

-- left join right join inner join full join

-- siparis_id urun_id urun_adi fiyat adet toplam_fiyat adres

select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
left join siparis s
on u.urun_id =s.urun_id;


select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
right join siparis s
on u.urun_id =s.urun_id;


select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
inner join siparis s
on u.urun_id =s.urun_id;


select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
left join siparis s
on u.urun_id =s.urun_id
union
select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
right join siparis s
on u.urun_id =s.urun_id;

select s.siparis_id, u.urun_id, u.urun_adi,u.fiyat, s.adet, s.toplam_fiyat, s.adres from urunler u
left join siparis s
on u.urun_id =s.urun_id where s.adres='Ankara';


