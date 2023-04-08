create table proje1.dersler(
id int not null,
dersAdi varchar(45),
kont int,
primary key(id)
);

insert into proje1.urunler values(1, "bilgisayar", 12);
insert into proje1.urunler values(2, "elma", 20);
insert into proje1.urunler values(3, "masa", 100.50);
insert into proje1.urunler(urunId,urunAdi) values(4, "armut");
select * from proje1.urunler;

drop table proje1.ogrenciler;
