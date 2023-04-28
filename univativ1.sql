create Table filiale(
 	f_id serial primary key,
 	f_name varchar(20),
 	mitarbeiterzahl integer
);
create Table mitarbeter(
 	mit_id integer  primary key,
 	mit_name varchar(20),
 	abteilung varchar(20),
	gehalt money,
	standort integer references filiale(f_id)
);

--Wie viele Mitarbeiter hat jede Filiale
--und welches ist die Filiale mit den meisten Mitarbeitern?
select f_name,mitarbeiterzahl,
(select f_name from filiale order by mitarbeiterzahl desc
	  limit 1) as anz
	  from filiale;
bewerber(
 	b_id serial primary key,
 	bewerberposition varchar(20),
 	zusage boolean,
	kundigungsfrist date
);
	
create Table unternehmen(
 	u_id integer primary key,
 	u_name varchar(20),
 	freieposition integer,
	bereich varchar(20)
);
--Welche Bewerber haben eine Zusage erhalten und bei welchen Unternehmen haben sie sich beworben?

--Inserts filiale
insert into filiale(f_name,mitarbeiterzahl) values ('Hamburg', 39),
													('Frankfurt', 50),
													('Gießen', 39),
													('Berlin', 20),
													('Achen', 60);
select * from filiale;													
													
--Inserts mitarbeiter
insert into mitarbeter(mit_id,mit_name,abteilung,gehalt,standort) values (1234, 'Leaticia Bauer','Finanz',17000,1),
													(1245, 'Ruben Rudloff','Medizin',24000,5),
													(1256, 'Franck Adolf','IT',20000,1),
													(2234, 'Vanesa Sauber','Administration',18000,2),
													(1634, 'Ashley Bimberg','Legal/IT',37000,3);
													
select * from mitarbeter;														
--Inserts bewerber
insert into bewerber(bewerberposition,zusage,kundigungsfrist) values ('Werkstudent',false,'2024-10-28'),
													('Praktikant',true,'2025-11-28'),
													('Werkstudent',true,'2023-09-22'),
													('Berufseinsteiger',false,'2023-10-20'),
													('Praktikant',true,'2024-11-28');
select * from bewerber;													
													
--Inserts unternehmen
insert into unternehmen(u_id,u_name,freieposition,bereich) values (115, 'Bosch',10,'Recruiting'),
													(205, 'Sparkasse',2,'Recruiting'),
													(111, 'THM',1,'IT'),
													(300, 'SAP',1,'Consulting'),
													(110, 'BASF',3,'Finanz'),
													(211, 'BMW',2,'Technik'),
													(240, 'Telekom',5,'Design'),
													(103, 'Henkel',0,'Datenanalysis');
select * from unternehmen;														


--Abfragen
--Adding new element
insert into filiale(f_name,mitarbeiterzahl) values ('Berlin Mitte', 25);
select * from filiale;

--Aktualisieren Sie das Gehalt des Mitarbeiters mit der ID 123 auf 55000€.
update mitarbeter 
set gehalt = 55000
where mit_id = 1234;
select * from mitarbeter;

--Zeigen Sie den Namen und die Anzahl der freien Positionen für jedes Unternehmen an,
--bei dem es mindestens 5 freie Positionen gibt.
select u_name, freieposition
from unternehmen
where unternehmen.freieposition >= 5;

--Fügen Sie eine neue Spalte namens "telefonnummer" zur Tabelle "filiale" hinzu.
alter table filiale add column telefonnummer integer;

--Wie viele Mitarbeiter hat jede Filiale insgesamt?
select f_name, sum(mitarbeiterzahl) as totMitarbeiter
from filiale join mitarbeter on filiale.f_id = mitarbeter.standort
group by f_name;

--Wie viele Mitarbeiter die Filiale, die mit B anfangen insgesamt?
select f_name, sum(mitarbeiterzahl) as totMitarbeiter
from filiale
where f_name like 'B%'
group by f_name;

--Was ist das durchschnittliche Gehalt aller Mitarbeiter in der Abteilung "Finanzen"?
select abteilung, AVG(gehalt) as durchschnitt
from mitarbeter 
where abteilung = 'Finanz';

--Was ist das höchste Gehalt aller Mitarbeiter in der gesamten Firma?
select max(gehalt)
from mitarbeter

select mit_name, gehalt
from mitarbeter
order by gehalt desc
limit 1 ;

--Was ist das Minimum und Maximum der Anzahl freier Positionen pro Bereich?
select bereich,max(freieposition) as maxi, min(freieposition) as mini
from unternehmen 
group by bereich;

--Wie viele Bewerber haben eine Zusage erhalten und wie viele nicht?
select zusage,count(*) as behalten
from bewerber
group by zusage;

--Welche Bewerber haben eine Zusage erhalten und für welche Positionen?
select b_id, bewerberposition
from bewerber
where zusage = true
group by bewerberposition;

--Zeigen Sie den Namen, die Abteilung und das Gehalt aller Mitarbeiter an, die in
--einem Unternehmen arbeiten, dessen Name mit "A" beginnt.
select f_name, abteilung, gehalt, mit_name
from filiale f join mitarbeter mi on f.f_if = mi.standort
where f_name like 'A%' ;

--Wie viele Bewerber haben sich für jede Position beworben?
select bewerberposition, count(*) as anzahl
from bewerber
group by bewerberposition;

--Welche Mitarbeiter verdienen mehr als ihr Abteilungsdurchschnitt?
select mit_name, gehalt
from mitarbeter
having gehalt > avg(gehalt)
group by mit_name;
