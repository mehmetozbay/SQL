-- update=> Tablodaki verileri guncellemek icin kullaniriz

-- update tablo ismi set kolon ismi = yeni deger 
set sql_safe_updates=0;
-- id lerin hepsini 10 artiralim
update proje1.personel set id=id+10;
-- id si 11 olanin Bolumunu tesis yapalim yasini 20 yapalim
update proje1.personel set bolum='Tesis', yas=20 where id=11;
-- bolumu personel olanin maaslarini 2000 artirin  
update proje1.personel set maas=maas+2000 where bolum="Personel";

-- Tugrulu CEO  yapalim
update proje1.personel set bolum='CEO' where id=16;
 

-- degisken tanimlama  


select @maxMaas:=max(maas) as maxMaas from proje1.personel;

select * from proje1.personel where maas = @maxMaas;

-- yas ortalamasinin uzerinde olanlardan en dusuk maas alanin tum bilgilerini getirelim

/* 
1. asama => yas ortalamasinin bulalim
2. asama => yas ortalamasinin uzerindeki en dusuk maasi bulalim
3. asama => bu maasa sahip olan kisileri listeleyelim 
*/

select @ortalamaYas:=avg(yas) from proje1.personel;
select @kckMaas:=min(maas) from proje1.personel where yas>@ortalamaYas;
select * from proje1.personel where maas=@kckMaas;

-- bakim personel bolumlerindeki calisanlarin maaslarini 500 lira azaltalim

 update proje1.personel set maas=maas-500 where bolum in ("Bakim", "Personel");



-- alter kullanimi

-- kolon ekleme 
-- adres kolonu ekleyelim 
alter table proje1.personel add adres varchar(150) default 'Almanya';

-- cinsiyet kolonu ekleyelim

alter table proje1.personel add cinsiyet varchar(50);
drop table proje1.persons;

-- tablo ismi degistirme 
       --        eski isim               yeni isim
	
alter table proje1.personel rename to proje1.persons;

--  tekrardan table ismini personel ismine cevirelim

alter table proje1.persons rename to proje1.personel;

alter table world.city rename to world.city2;


-- id si 12 disinda olanlarin cinsiyetini erkek yapiniz

-- esit degildir != yada  <> kullanilarak  yapilarak gosterilir 
update proje1.personel set cinsiyet='erkek' where id<>12;

update proje1.personel set cinsiyet='kiz' where id=12;


-- kolon isim degistirme
-- bolum kolonunu departman ismine degistirdik
alter table proje1.personel rename column bolum to departman;
alter table proje1.personel rename column departman to bolum;

-- ad kolonunu isime cevirelim
alter table proje1.personel rename column ad to isim;

-- herhangi bir kolonun bilgilerini guncellemek icin modify yapisi kullanilir
  -- adres kolonunu varchar(150) den varchar(200) yapalim 
 alter table proje1.personel modify adres varchar(200);

-- adres kolonunu default olarak Turkiye atayalim

alter table proje1.personel alter column adres set default 'Turkiye';

 alter table proje1.personel modify adres  varchar(200) default 'Turkiye';
 
 --  yeni bir kisi ekleyip default olarak Turkiye gozuksun
-- insert into proje1.Orders(id, price) values(1, 35.55);
insert into proje1.personel(id, isim, departman, yas, maas, cinsiyet) values (19, 'Can', 'Tesis', 35, 7000, 'Erkek');

-- check ekleme
alter table proje1.personel add constraint check (maas>4000);

insert into proje1.personel(id, isim, departman, yas, maas, cinsiyet) values (20, 'Hasan', 'Tesis', 35, 5000, 'Erkek');

select * from proje1.personel;






 
