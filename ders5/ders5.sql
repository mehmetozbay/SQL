-- round kullanımı -> ondalikli sayilari yuvarlamak icin kullanilir
select round(maas, 1) as yuvarlanmis_maas from proje1.personel;

-- maas ortalamasini virgulden sonra 2 basamak olacak sekilde yazdiriniz
select round(avg(maas),2) as maas_ort from proje1.personel;


-- limit kullanimi=> istenilen sayi kadar elemanlari listelemek icin kullanilir

select * from proje1.personel limit 3; 

						      -- limit atlama sayisi, getirilen kayit sayisi
select * from proje1.personel limit 3,2; 


-- order by => siralama yapmak icin kullanilir
-- desc buyukten kucuge 
-- asc yada yic bir sey yazmassak kucukten buyuge
select * from proje1.personel order by maas;
select * from proje1.personel order by maas desc;
select * from proje1.personel order by maas asc;
-- istenilirse kolon sira numarasi da yazilabilir 
select * from proje1.personel order by 5 desc;

-- maasa gore siralayip maasi en buyuk olan kisinin bilgilerini yazdiriniz 

select * from proje1.personel order by maas desc limit 1;

-- yonetim ve bakim bolumlerinde yasi 15 den buyuk en kucuk kisinin bilgileri

select yas from proje1.personel where bolum in("Yonetim", "Bakim") and yas>15 order by yas asc limit 1;

-- ilk once en kucuk yasi bulun  sonra bu yasa sahip olan kisilerin bilgilerini getirin

-- 15 ten buyuk En kucuk yasa sahip olanlarin (16) olanlarin bilgileri

select * from proje1.personel where yas=16 and bolum in ("Yonetim", "Bakim");

select * from proje1.personel where yas=(select yas from proje1.personel where bolum in("Yonetim", "Bakim") and yas>15 order by yas asc limit 1)
and bolum in("Bakim", "Yonetim");


-- personelleri isminde a harfi olanlari isme gore siralayiniz 

select * from proje1.personel where ad like "%a%" order by ad;

-- maasi ortalamanin uzerinde olanlardan en dusuk maas alanin maasini yazdiriniz

select avg(maas) from proje1.personel;

select maas from proje1.personel where maas>(select avg(maas) from proje1.personel) order by maas limit 1;


-- yas ortalamasinin uzerinde olanlardan en dusuk maas alanin tum bilgilerini getirelim

/* 
1. asama => yas ortalamasinin bulalim
2. asama => yas ortalamasinin uzerindeki en dusuk maasi bulalim
3. asama => bu maasa sahip olan kisileri listeleyelim 
*/

select avg(yas) from proje1.personel;


select min(maas) from proje1.personel where yas>(select avg(yas) from proje1.personel);

select * from proje1.personel where maas=(select min(maas) from proje1.personel where yas>(select avg(yas) from proje1.personel));

 --  delete komutu=> herhangi bir satiri silmek icin delete komutu kullaniriz
 
insert into proje1.personel values(1, "Yunus", "Bakim", 16, 4800.50);
insert into proje1.personel values(2, "Sena", "Personel", 15, 4250.25);
insert into proje1.personel values(3, "Ali", "Personel", 17, 5000.25);
insert into proje1.personel values(4, "Ahmet", "Yonetim", 14, 7000.50);
insert into proje1.personel values(5, "Zafer", "Yonetim", 16, 8000.50);
insert into proje1.personel values(6, "Tugrul", "Yonetim", 25, 25000.50);
insert into proje1.personel values(7, "Huzeyfe", "Tesis", 15, 5000.50);
insert into proje1.personel values(8, "Huzeyfe", "Bakim", 15, 8000.50);

-- id si 1 olani silelim
delete from proje1.personel where id=1;

set sql_safe_updates=0;

-- tum tabloyu silelim 
delete from proje1.personel;

-- Yonetim bolumundeki kisileri silelim

delete from proje1.personel where bolum="Yonetim";

--  maasi ortalamanin uzerinde olan maasi en dusuk olan kisiler siliniz

-- 1-asama maas ortalamasini bul
select avg(maas) from proje1.personel;

-- maasi ortalamadan fazla olan ilk maas 
select maas from proje1.personel where maas>(select avg(maas) from proje1.personel) order by maas limit 1;

-- bu maasa sahip olan kisileri silelim

delete from proje1.personel where maas = (select * from (select maas from proje1.personel where maas>(select avg(maas) from proje1.personel) order by maas limit 1
)as del) ;

select * from proje1.personel;
start transaction;

savepoint asd;


delete from proje1.personel where id=1;

rollback to asd;

select *  from proje1.personel;


truncate table proje1.personel;





