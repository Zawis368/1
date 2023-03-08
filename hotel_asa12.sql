/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     21.02.2023 10:17:16                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_DYZURYPE_DYZURYPER_PERSONEL') then
    alter table DyzuryPersonelu
       delete foreign key FK_DYZURYPE_DYZURYPER_PERSONEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DYZURYPE_DYZURYPER_POKOJ') then
    alter table DyzuryPersonelu
       delete foreign key FK_DYZURYPE_DYZURYPER_POKOJ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PERSONEL_PERSONELH_HOTEL') then
    alter table Personel
       delete foreign key FK_PERSONEL_PERSONELH_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POKOJ_POKOJHOTE_HOTEL') then
    alter table Pokoj
       delete foreign key FK_POKOJ_POKOJHOTE_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POKOJ_TYPPOKOJU_RODZAJPO') then
    alter table Pokoj
       delete foreign key FK_POKOJ_TYPPOKOJU_RODZAJPO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POZYCJAR_POZYCJARE_HOTEL') then
    alter table PozycjaRezerwacji
       delete foreign key FK_POZYCJAR_POZYCJARE_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POZYCJAR_POZYCJARE_REZERWAC') then
    alter table PozycjaRezerwacji
       delete foreign key FK_POZYCJAR_POZYCJARE_REZERWAC
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_POZYCJAR_POZYCJARE_USLUGA') then
    alter table PozycjaRezerwacji
       delete foreign key FK_POZYCJAR_POZYCJARE_USLUGA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REZERWAC_REZERWACJ_KLIENT') then
    alter table Rezerwacja
       delete foreign key FK_REZERWAC_REZERWACJ_KLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REZERWAC_REZERWACJ_POKOJ') then
    alter table Rezerwacja
       delete foreign key FK_REZERWAC_REZERWACJ_POKOJ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REZERWAC_REZERWACJ_KLIENT') then
    alter table RezerwacjaKlienta
       delete foreign key FK_REZERWAC_REZERWACJ_KLIENT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REZERWAC_REZERWACJ_REZERWAC') then
    alter table RezerwacjaKlienta
       delete foreign key FK_REZERWAC_REZERWACJ_REZERWAC
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USLUGAHO_USLUGAHOT_HOTEL') then
    alter table UslugaHotelowa
       delete foreign key FK_USLUGAHO_USLUGAHOT_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_USLUGAHO_USLUGAHOT_USLUGA') then
    alter table UslugaHotelowa
       delete foreign key FK_USLUGAHO_USLUGAHOT_USLUGA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_WYPOSAZE_WYPOSAZEN_POKOJ') then
    alter table WyposazeniePokoju
       delete foreign key FK_WYPOSAZE_WYPOSAZEN_POKOJ
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_WYPOSAZE_WYPOSAZEN_WYPOSAZE') then
    alter table WyposazeniePokoju
       delete foreign key FK_WYPOSAZE_WYPOSAZEN_WYPOSAZE
end if;

drop index if exists DyzuryPersonelu.DyzuryPersonelu2_FK;

drop index if exists DyzuryPersonelu.DyzuryPersonelu_FK;

drop table if exists DyzuryPersonelu;

drop index if exists Hotel.Hotel_PK;

drop table if exists Hotel;

drop index if exists Klient.Klient_PK;

drop table if exists Klient;

drop index if exists Personel.PersonelHotelu_FK;

drop index if exists Personel.Personel_PK;

drop table if exists Personel;

drop index if exists Pokoj.TypPokoju_FK;

drop index if exists Pokoj.PokojHotelu_FK;

drop index if exists Pokoj.Pokoj_PK;

drop table if exists Pokoj;

drop index if exists PozycjaRezerwacji.PozycjaRezerwacji3_FK;

drop index if exists PozycjaRezerwacji.PozycjaRezerwacji2_FK;

drop index if exists PozycjaRezerwacji.PozycjaRezerwacji_FK;

drop index if exists PozycjaRezerwacji.PozycjaRezerwacji_PK;

drop table if exists PozycjaRezerwacji;

drop index if exists Rezerwacja.RezerwacjaPokoju_FK;

drop index if exists Rezerwacja.RezerwacjaKlienta_FK;

drop table if exists Rezerwacja;

drop index if exists RezerwacjaKlienta.RezerwacjaKlienta3_FK;

drop index if exists RezerwacjaKlienta.RezerwacjaKlienta2_FK;

drop index if exists RezerwacjaKlienta.RezerwacjaKlienta_PK;

drop table if exists RezerwacjaKlienta;

drop index if exists RodzajPokoju.RodzajPokoju_PK;

drop table if exists RodzajPokoju;

drop index if exists Usluga.Usluga_PK;

drop table if exists Usluga;

drop index if exists UslugaHotelowa.UslugaHotelowa2_FK;

drop index if exists UslugaHotelowa.UslugaHotelowa_FK;

drop table if exists UslugaHotelowa;

drop index if exists Wyposazenie.Wyposazenie_PK;

drop table if exists Wyposazenie;

drop index if exists WyposazeniePokoju.WyposazeniePokoju2_FK;

drop index if exists WyposazeniePokoju.WyposazeniePokoju_FK;

drop table if exists WyposazeniePokoju;

/*==============================================================*/
/* Table: DyzuryPersonelu                                       */
/*==============================================================*/
create table DyzuryPersonelu 
(
   PESEL                char(11)                       not null,
   IdPokoju             integer                        not null,
   DataRozp             date                           null,
   DataZak              date                           null,
   constraint PK_DYZURYPERSONELU primary key (PESEL, IdPokoju)
);

comment on table DyzuryPersonelu is 
'DyzuryPersonelu to intersekcja, która zawiera dane w którym pokoju dy¿uruje jaki pracownik.';

comment on column DyzuryPersonelu.PESEL is 
'PESEL to atrybut informuj¹cy o PESELU danej osoby.';

comment on column DyzuryPersonelu.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column DyzuryPersonelu.DataRozp is 
'DataRozp informuje od kiedy jest dy¿ur.';

comment on column DyzuryPersonelu.DataZak is 
'DataZak informuje kiedy koñczy siê dy¿ur.';

/*==============================================================*/
/* Index: DyzuryPersonelu_FK                                    */
/*==============================================================*/
create index DyzuryPersonelu_FK on DyzuryPersonelu (
PESEL ASC
);

/*==============================================================*/
/* Index: DyzuryPersonelu2_FK                                   */
/*==============================================================*/
create index DyzuryPersonelu2_FK on DyzuryPersonelu (
IdPokoju ASC
);

/*==============================================================*/
/* Table: Hotel                                                 */
/*==============================================================*/
create table Hotel 
(
   NazwaHotelu          char(40)                       not null,
   Ulica                char(40)                       null,
   NrUlicy              char(10)                       null,
   KodPocztowy          char(6)                        null,
   Poczta               char(20)                       null,
   Miasto               char(40)                       null,
   IloscGwaizdek        integer                        null,
   constraint PK_HOTEL primary key (NazwaHotelu)
);

comment on table Hotel is 
'Hotel to encja zawieracj¹ca informacje o hotelach.';

comment on column Hotel.NazwaHotelu is 
'NazwaHotelu to atrybut informuj¹cy o nazwie danego hotelu.';

comment on column Hotel.Ulica is 
'Ulica to atrybut informuj¹cy o ulicy, przy której znajduje siê dany hotel.';

comment on column Hotel.NrUlicy is 
'NrUlicy to atrybut informuj¹cy o numerze budynku danej ulicy.';

comment on column Hotel.KodPocztowy is 
'KodPocztowy to atrybut informuj¹cy o kodzie pocztowym miasta dla danego hotrlu.';

comment on column Hotel.Poczta is 
'Poczta to atrybut informuj¹cy o poczcie, do której przydzielony jest budynek.';

comment on column Hotel.Miasto is 
'Miasto to atrybut informuj¹cy o mieœcie, w którym dany hotel siêznajduje.';

comment on column Hotel.IloscGwaizdek is 
'IloscGwazdek to atrybut informuj¹cy o iloœci gwiazdek danego hotelu.';

comment on primary key on Hotel is 
'KluczHotelu jest to klucz g³ówny encji Hotel.';

/*==============================================================*/
/* Index: Hotel_PK                                              */
/*==============================================================*/
create unique index Hotel_PK on Hotel (
NazwaHotelu ASC
);

/*==============================================================*/
/* Table: Klient                                                */
/*==============================================================*/
create table Klient 
(
   PESEL                char(11)                       not null,
   Ulica                char(40)                       null,
   NrUlicy              char(10)                       null,
   KodPocztowy          char(6)                        null,
   Poczta               char(20)                       null,
   Miasto               char(40)                       null,
   Imie                 char(20)                       null,
   Nazwisko             char(20)                       null,
   DataU                date                           null,
   Plec                 char(1)                        null,
   constraint PK_KLIENT primary key clustered (PESEL)
);

comment on table Klient is 
'Klient to osoba, która rezerwuje pobyt w hotelu.
';

comment on column Klient.PESEL is 
'PESEL to atrybut informuj¹cy o PESELU danej osoby.';

comment on column Klient.Ulica is 
'Ulica to atrybut informuj¹cy o ulicy, przy której znajduje siê dany hotel.';

comment on column Klient.NrUlicy is 
'NrUlicy to atrybut informuj¹cy o numerze budynku danej ulicy.';

comment on column Klient.KodPocztowy is 
'KodPocztowy to atrybut informuj¹cy o kodzie pocztowym miasta dla danego hotrlu.';

comment on column Klient.Poczta is 
'Poczta to atrybut informuj¹cy o poczcie, do której przydzielony jest budynek.';

comment on column Klient.Miasto is 
'Miasto to atrybut informuj¹cy o mieœcie, w którym dany hotel siêznajduje.';

comment on column Klient.Imie is 
'Imie to atrybut informuj¹cy o imieniu danej osoby.';

comment on column Klient.Nazwisko is 
'Nazwiko to atrybut informuj¹cy o nazwisku danej osoby.';

comment on column Klient.DataU is 
'DataU to atrybut informuj¹cy o dacie urodzienia danej osoby.';

comment on column Klient.Plec is 
'Plec to atrybut informuj¹cy o p³ci danej osoby (K- kobieta, M-mê¿czyzna, H-hemafrodyta).';

/*==============================================================*/
/* Index: Klient_PK                                             */
/*==============================================================*/
create unique clustered index Klient_PK on Klient (
PESEL ASC
);

/*==============================================================*/
/* Table: Personel                                              */
/*==============================================================*/
create table Personel 
(
   PESEL                char(11)                       not null,
   NazwaHotelu          char(40)                       not null,
   Ulica                char(40)                       null,
   NrUlicy              char(10)                       null,
   KodPocztowy          char(6)                        null,
   Poczta               char(20)                       null,
   Miasto               char(40)                       null,
   Imie                 char(20)                       null,
   Nazwisko             char(20)                       null,
   DataU                date                           null,
   Plec                 char(1)                        null,
   Funkcja              char(10)                       null,
   constraint PK_PERSONEL primary key clustered (PESEL)
);

comment on table Personel is 
'Personel to encja zawieraj¹ca informacje o pracownikach danego hotelu.';

comment on column Personel.PESEL is 
'PESEL to atrybut informuj¹cy o PESELU danej osoby.';

comment on column Personel.NazwaHotelu is 
'NazwaHotelu to atrybut informuj¹cy o nazwie danego hotelu.';

comment on column Personel.Ulica is 
'Ulica to atrybut informuj¹cy o ulicy, przy której znajduje siê dany hotel.';

comment on column Personel.NrUlicy is 
'NrUlicy to atrybut informuj¹cy o numerze budynku danej ulicy.';

comment on column Personel.KodPocztowy is 
'KodPocztowy to atrybut informuj¹cy o kodzie pocztowym miasta dla danego hotrlu.';

comment on column Personel.Poczta is 
'Poczta to atrybut informuj¹cy o poczcie, do której przydzielony jest budynek.';

comment on column Personel.Miasto is 
'Miasto to atrybut informuj¹cy o mieœcie, w którym dany hotel siêznajduje.';

comment on column Personel.Imie is 
'Imie to atrybut informuj¹cy o imieniu danej osoby.';

comment on column Personel.Nazwisko is 
'Nazwiko to atrybut informuj¹cy o nazwisku danej osoby.';

comment on column Personel.DataU is 
'DataU to atrybut informuj¹cy o dacie urodzienia danej osoby.';

comment on column Personel.Plec is 
'Plec to atrybut informuj¹cy o p³ci danej osoby (K- kobieta, M-mê¿czyzna, H-hemafrodyta).';

comment on column Personel.Funkcja is 
'Funkcja to atrybut informuj¹cy o funkcji jak¹ pe³ni pracownik w danym hotelu.';

/*==============================================================*/
/* Index: Personel_PK                                           */
/*==============================================================*/
create unique clustered index Personel_PK on Personel (
PESEL ASC
);

/*==============================================================*/
/* Index: PersonelHotelu_FK                                     */
/*==============================================================*/
create index PersonelHotelu_FK on Personel (
NazwaHotelu ASC
);

/*==============================================================*/
/* Table: Pokoj                                                 */
/*==============================================================*/
create table Pokoj 
(
   IdPokoju             integer                        not null,
   NazwaHotelu          char(40)                       not null,
   IdRodzajPokoju       integer                        not null,
   NrPokoju             integer                        null,
   Stan                 smallint                       null,
   constraint PK_POKOJ primary key (IdPokoju)
);

comment on table Pokoj is 
'Pokoj to encja zawieraj¹ca informacje o pokoju hotelu.';

comment on column Pokoj.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column Pokoj.NazwaHotelu is 
'NazwaHotelu to atrybut informuj¹cy o nazwie danego hotelu.';

comment on column Pokoj.IdRodzajPokoju is 
'IdRodzajPokoju to atrybut bêd¹cy kluczem g³ównym encji RodzajPokoju.';

comment on column Pokoj.NrPokoju is 
'NrPokoju to atrybut zawieraj¹cy informacje o numerze pokoju.';

comment on column Pokoj.Stan is 
'Stan jest to atrybut informuj¹cy o stanie pokoju tzn. 1 - zajêty pokój, 0 - wolny pokój.';

comment on primary key on Pokoj is 
'KluczPokoju to klucz g³ówny encji Pokoj.';

/*==============================================================*/
/* Index: Pokoj_PK                                              */
/*==============================================================*/
create unique index Pokoj_PK on Pokoj (
IdPokoju ASC
);

/*==============================================================*/
/* Index: PokojHotelu_FK                                        */
/*==============================================================*/
create index PokojHotelu_FK on Pokoj (
NazwaHotelu ASC
);

/*==============================================================*/
/* Index: TypPokoju_FK                                          */
/*==============================================================*/
create index TypPokoju_FK on Pokoj (
IdRodzajPokoju ASC
);

/*==============================================================*/
/* Table: PozycjaRezerwacji                                     */
/*==============================================================*/
create table PozycjaRezerwacji 
(
   NazwaHotelu          char(40)                       not null,
   IdPokoju             integer                        not null,
   IdRezerwacji         integer                        not null,
   IdUslugi             integer                        not null,
   constraint PK_POZYCJAREZERWACJI primary key clustered (IdPokoju, NazwaHotelu, IdRezerwacji, IdUslugi)
);

comment on table PozycjaRezerwacji is 
'PozycjaRezerwacji jest to intersekcja, w której zapisywane s¹ dane o rezerwacji, us³ugach oraz hotelu.';

comment on column PozycjaRezerwacji.NazwaHotelu is 
'NazwaHotelu to atrybut informuj¹cy o nazwie danego hotelu.';

comment on column PozycjaRezerwacji.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column PozycjaRezerwacji.IdRezerwacji is 
'IdRezerwacji to klucz g³ówny encji Rezerwacja.';

comment on column PozycjaRezerwacji.IdUslugi is 
'UdUslugi to klucz g³ówny encji Usluga.';

/*==============================================================*/
/* Index: PozycjaRezerwacji_PK                                  */
/*==============================================================*/
create unique clustered index PozycjaRezerwacji_PK on PozycjaRezerwacji (
IdPokoju ASC,
NazwaHotelu ASC,
IdRezerwacji ASC,
IdUslugi ASC
);

/*==============================================================*/
/* Index: PozycjaRezerwacji_FK                                  */
/*==============================================================*/
create index PozycjaRezerwacji_FK on PozycjaRezerwacji (
NazwaHotelu ASC
);

/*==============================================================*/
/* Index: PozycjaRezerwacji2_FK                                 */
/*==============================================================*/
create index PozycjaRezerwacji2_FK on PozycjaRezerwacji (
IdPokoju ASC,
IdRezerwacji ASC
);

/*==============================================================*/
/* Index: PozycjaRezerwacji3_FK                                 */
/*==============================================================*/
create index PozycjaRezerwacji3_FK on PozycjaRezerwacji (
IdUslugi ASC
);

/*==============================================================*/
/* Table: Rezerwacja                                            */
/*==============================================================*/
create table Rezerwacja 
(
   IdPokoju             integer                        not null,
   IdRezerwacji         integer                        not null,
   PESEL                char(11)                       not null,
   DataRezerwacji       date                           null,
   DataOd               date                           null,
   DataDo               date                           null,
   constraint PK_REZERWACJA primary key (IdPokoju, IdRezerwacji)
);

comment on table Rezerwacja is 
'Rezerwacja to encja, w której znajduj¹ siê informacje o rezerwacjach danego hotelu.';

comment on column Rezerwacja.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column Rezerwacja.IdRezerwacji is 
'IdRezerwacji to klucz g³ówny encji Rezerwacja.';

comment on column Rezerwacja.PESEL is 
'PESEL to atrybut informuj¹cy o PESELU danej osoby.';

comment on column Rezerwacja.DataRezerwacji is 
'DataRezerwacji to data kiedy rezerwacja zosta³a z³o¿ona.';

comment on column Rezerwacja.DataOd is 
'DataOd to data rozpoczêcia rezerwacji z³o¿onej przez kliena.';

comment on column Rezerwacja.DataDo is 
'DataDo to planowe zakoñczenie pobytu w hotelu przez klienta.';

comment on primary key on Rezerwacja is 
'KluczRezerwacji to klucz g³ówny encji Rezerwacja.';

/*==============================================================*/
/* Index: RezerwacjaKlienta_FK                                  */
/*==============================================================*/
create index RezerwacjaKlienta_FK on Rezerwacja (
PESEL ASC
);

/*==============================================================*/
/* Index: RezerwacjaPokoju_FK                                   */
/*==============================================================*/
create index RezerwacjaPokoju_FK on Rezerwacja (
IdPokoju ASC
);

/*==============================================================*/
/* Table: RezerwacjaKlienta                                     */
/*==============================================================*/
create table RezerwacjaKlienta 
(
   PESEL                char(11)                       not null,
   IdPokoju             integer                        not null,
   IdRezerwacji         integer                        not null,
   constraint PK_REZERWACJAKLIENTA primary key clustered (IdPokoju, PESEL, IdRezerwacji)
);

comment on table RezerwacjaKlienta is 
'Rezerwacja klienta to intersekcja, w której zbierane s¹ dane o klientach i ich rezerwacjach.';

comment on column RezerwacjaKlienta.PESEL is 
'PESEL to atrybut informuj¹cy o PESELU danej osoby.';

comment on column RezerwacjaKlienta.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column RezerwacjaKlienta.IdRezerwacji is 
'IdRezerwacji to klucz g³ówny encji Rezerwacja.';

/*==============================================================*/
/* Index: RezerwacjaKlienta_PK                                  */
/*==============================================================*/
create unique clustered index RezerwacjaKlienta_PK on RezerwacjaKlienta (
IdPokoju ASC,
PESEL ASC,
IdRezerwacji ASC
);

/*==============================================================*/
/* Index: RezerwacjaKlienta2_FK                                 */
/*==============================================================*/
create index RezerwacjaKlienta2_FK on RezerwacjaKlienta (
PESEL ASC
);

/*==============================================================*/
/* Index: RezerwacjaKlienta3_FK                                 */
/*==============================================================*/
create index RezerwacjaKlienta3_FK on RezerwacjaKlienta (
IdPokoju ASC,
IdRezerwacji ASC
);

/*==============================================================*/
/* Table: RodzajPokoju                                          */
/*==============================================================*/
create table RodzajPokoju 
(
   IdRodzajPokoju       integer                        not null,
   Cena                 integer                        null,
   LiczbaLozek          integer                        null,
   IluOsobowy           integer                        null,
   constraint PK_RODZAJPOKOJU primary key (IdRodzajPokoju)
);

comment on table RodzajPokoju is 
'RodzajPokoju to encja zawieraj¹ca informacje o rodzaju danego pokoju.';

comment on column RodzajPokoju.IdRodzajPokoju is 
'IdRodzajPokoju to atrybut bêd¹cy kluczem g³ównym encji RodzajPokoju.';

comment on column RodzajPokoju.Cena is 
'Cena to atrybut zawieraj¹cy informacje o cenie danego rodzaju pokoju.';

comment on column RodzajPokoju.LiczbaLozek is 
'LiczbaLozek to atrybut podaj¹cy iloœæ ³ó¿ek w danym rodzaju pokoju.';

comment on column RodzajPokoju.IluOsobowy is 
'IluOsobowy to atrybut mówi¹cy ile osób mo¿e spaæ w danym rodzaju pokoju.';

comment on primary key on RodzajPokoju is 
'KluczRodzajuPokoju to klucz g³ówny encji RodzajPokoju.';

/*==============================================================*/
/* Index: RodzajPokoju_PK                                       */
/*==============================================================*/
create unique index RodzajPokoju_PK on RodzajPokoju (
IdRodzajPokoju ASC
);

/*==============================================================*/
/* Table: Usluga                                                */
/*==============================================================*/
create table Usluga 
(
   IdUslugi             integer                        not null,
   SPA                  smallint                       null,
   Restauracja          smallint                       null,
   Basen                smallint                       null,
   Silownia             smallint                       null,
   Sauna                smallint                       null,
   constraint PK_USLUGA primary key (IdUslugi)
);

comment on table Usluga is 
'Usluga jest to encja informuj¹ca o us³ugach oferowanych przez dany hotel.';

comment on column Usluga.IdUslugi is 
'UdUslugi to klucz g³ówny encji Usluga.';

comment on column Usluga.SPA is 
'SPA to atrybut informuj¹cy czy w danym hotelu jest SPA(1-jest, 0-nie ma).';

comment on column Usluga.Restauracja is 
'Restauracja to atrybut informuj¹cy czy w danym hotelu jest restauracja(1-jest, 0-nie ma).';

comment on column Usluga.Basen is 
'Basen to atrybut informuj¹cy czy w danym hotelu jest basen(1-jest, 0-nie ma).';

comment on column Usluga.Silownia is 
'Silownia to atrybut informuj¹cy czy w danym hotelu jest si³ownia(1-jest, 0-nie ma).';

comment on column Usluga.Sauna is 
'Sauna to atrybut informuj¹cy czy w danym hotelu jest sauna(1-jest, 0-nie ma).';

comment on primary key on Usluga is 
'KluczUslugi jest kluczem g³ównym encjiUsluga.';

/*==============================================================*/
/* Index: Usluga_PK                                             */
/*==============================================================*/
create unique index Usluga_PK on Usluga (
IdUslugi ASC
);

/*==============================================================*/
/* Table: UslugaHotelowa                                        */
/*==============================================================*/
create table UslugaHotelowa 
(
   NazwaHotelu          char(40)                       not null,
   IdUslugi             integer                        not null,
   constraint PK_USLUGAHOTELOWA primary key (NazwaHotelu, IdUslugi)
);

comment on table UslugaHotelowa is 
'Powi¹zanie, w którym hotel mo¿e mieæ wiele us³ug i us³ugi mog¹ wystêpowaæ w wielu hotelach.';

comment on column UslugaHotelowa.NazwaHotelu is 
'NazwaHotelu to atrybut informuj¹cy o nazwie danego hotelu.';

comment on column UslugaHotelowa.IdUslugi is 
'UdUslugi to klucz g³ówny encji Usluga.';

/*==============================================================*/
/* Index: UslugaHotelowa_FK                                     */
/*==============================================================*/
create index UslugaHotelowa_FK on UslugaHotelowa (
NazwaHotelu ASC
);

/*==============================================================*/
/* Index: UslugaHotelowa2_FK                                    */
/*==============================================================*/
create index UslugaHotelowa2_FK on UslugaHotelowa (
IdUslugi ASC
);

/*==============================================================*/
/* Table: Wyposazenie                                           */
/*==============================================================*/
create table Wyposazenie 
(
   IdWyposazenia        integer                        not null,
   TV                   smallint                       null,
   Balkon               smallint                       null,
   Lazienka             smallint                       null,
   Barek                smallint                       null,
   constraint PK_WYPOSAZENIE primary key (IdWyposazenia)
);

comment on table Wyposazenie is 
'Wyposazenie jest to encja, w której s¹ informacje o wyposa¿eniu pokoju.';

comment on column Wyposazenie.IdWyposazenia is 
'IdWyposazenia to klucz g³ówny encji Wyposazenie.';

comment on column Wyposazenie.TV is 
'TV to atrybut mówi¹cy czy w pokoju jest telewizor(1-jest, 0-nie ma).';

comment on column Wyposazenie.Balkon is 
'Balkon to atrybut mówi¹cy czy w pokoju jest balkon(1-jest, 0-nie ma).';

comment on column Wyposazenie.Lazienka is 
'Lazienka to atrybut mówi¹cy czy w pokoju znajduje siê ³azienka(1-jest, 0-nie ma).';

comment on column Wyposazenie.Barek is 
'Barek to atrybut mówi¹cy czy w pokoju znajduje siê barek(1-jest, 0-nie ma).';

comment on primary key on Wyposazenie is 
'KluczWyposazenia jest kluczem g³ównym encji Wyposazenie.';

/*==============================================================*/
/* Index: Wyposazenie_PK                                        */
/*==============================================================*/
create unique index Wyposazenie_PK on Wyposazenie (
IdWyposazenia ASC
);

/*==============================================================*/
/* Table: WyposazeniePokoju                                     */
/*==============================================================*/
create table WyposazeniePokoju 
(
   IdPokoju             integer                        not null,
   IdWyposazenia        integer                        not null,
   constraint PK_WYPOSAZENIEPOKOJU primary key (IdPokoju, IdWyposazenia)
);

comment on table WyposazeniePokoju is 
'Powi¹zanie, w którym pokój mo¿e mieæ wiele wyposa¿eñ i wyposa¿enie mo¿e byæ w wielu pokojach.';

comment on column WyposazeniePokoju.IdPokoju is 
'IdNrPokoju to atrybut zawieraj¹cy informacje o Id danego pokoju.';

comment on column WyposazeniePokoju.IdWyposazenia is 
'IdWyposazenia to klucz g³ówny encji Wyposazenie.';

/*==============================================================*/
/* Index: WyposazeniePokoju_FK                                  */
/*==============================================================*/
create index WyposazeniePokoju_FK on WyposazeniePokoju (
IdPokoju ASC
);

/*==============================================================*/
/* Index: WyposazeniePokoju2_FK                                 */
/*==============================================================*/
create index WyposazeniePokoju2_FK on WyposazeniePokoju (
IdWyposazenia ASC
);

alter table DyzuryPersonelu
   add constraint FK_DYZURYPE_DYZURYPER_PERSONEL foreign key (PESEL)
      references Personel (PESEL)
      on update restrict
      on delete restrict;

alter table DyzuryPersonelu
   add constraint FK_DYZURYPE_DYZURYPER_POKOJ foreign key (IdPokoju)
      references Pokoj (IdPokoju)
      on update restrict
      on delete restrict;

alter table Personel
   add constraint FK_PERSONEL_PERSONELH_HOTEL foreign key (NazwaHotelu)
      references Hotel (NazwaHotelu)
      on update restrict
      on delete restrict;

comment on foreign key Personel.FK_PERSONEL_PERSONELH_HOTEL is 
'Powi¹zanie, w którym hotel ma wielu pracowników.';

alter table Pokoj
   add constraint FK_POKOJ_POKOJHOTE_HOTEL foreign key (NazwaHotelu)
      references Hotel (NazwaHotelu)
      on update restrict
      on delete restrict;

comment on foreign key Pokoj.FK_POKOJ_POKOJHOTE_HOTEL is 
'Jest to powi¹zanie pomiêdzy hotelem a pokojem, gdzie jeden hotel musi mieæ co najmniej jeden pokój. ';

alter table Pokoj
   add constraint FK_POKOJ_TYPPOKOJU_RODZAJPO foreign key (IdRodzajPokoju)
      references RodzajPokoju (IdRodzajPokoju)
      on update restrict
      on delete restrict;

comment on foreign key Pokoj.FK_POKOJ_TYPPOKOJU_RODZAJPO is 
'Powi¹zanie pomiêdzy Pokoj a RodzajPokoju, gdzie pokoje mog¹ mieæ rózne rodzaje.';

alter table PozycjaRezerwacji
   add constraint FK_POZYCJAR_POZYCJARE_HOTEL foreign key (NazwaHotelu)
      references Hotel (NazwaHotelu)
      on update restrict
      on delete restrict;

alter table PozycjaRezerwacji
   add constraint FK_POZYCJAR_POZYCJARE_REZERWAC foreign key (IdPokoju, IdRezerwacji)
      references Rezerwacja (IdPokoju, IdRezerwacji)
      on update restrict
      on delete restrict;

alter table PozycjaRezerwacji
   add constraint FK_POZYCJAR_POZYCJARE_USLUGA foreign key (IdUslugi)
      references Usluga (IdUslugi)
      on update restrict
      on delete restrict;

alter table Rezerwacja
   add constraint FK_REZERWAC_REZERWACJ_KLIENT foreign key (PESEL)
      references Klient (PESEL)
      on update restrict
      on delete restrict;

comment on foreign key Rezerwacja.FK_REZERWAC_REZERWACJ_KLIENT is 
'Powi¹zanie, gdzie klient mo¿e mieæ wiele rezerwacji.';

alter table Rezerwacja
   add constraint FK_REZERWAC_REZERWACJ_POKOJ foreign key (IdPokoju)
      references Pokoj (IdPokoju)
      on update restrict
      on delete restrict;

comment on foreign key Rezerwacja.FK_REZERWAC_REZERWACJ_POKOJ is 
'Powi¹zanie, w którym rezerwacja ma wiele pokoi, a pokój ma tylko jedn¹ rezerwacjê.';

alter table RezerwacjaKlienta
   add constraint FK_REZERWAC_REZERWACJ_KLIENT foreign key (PESEL)
      references Klient (PESEL)
      on update restrict
      on delete restrict;

alter table RezerwacjaKlienta
   add constraint FK_REZERWAC_REZERWACJ_REZERWAC foreign key (IdPokoju, IdRezerwacji)
      references Rezerwacja (IdPokoju, IdRezerwacji)
      on update restrict
      on delete restrict;

alter table UslugaHotelowa
   add constraint FK_USLUGAHO_USLUGAHOT_HOTEL foreign key (NazwaHotelu)
      references Hotel (NazwaHotelu)
      on update restrict
      on delete restrict;

comment on foreign key UslugaHotelowa.FK_USLUGAHO_USLUGAHOT_HOTEL is 
'Powi¹zanie, w którym hotel mo¿e mieæ wiele us³ug i us³ugi mog¹ wystêpowaæ w wielu hotelach.';

alter table UslugaHotelowa
   add constraint FK_USLUGAHO_USLUGAHOT_USLUGA foreign key (IdUslugi)
      references Usluga (IdUslugi)
      on update restrict
      on delete restrict;

comment on foreign key UslugaHotelowa.FK_USLUGAHO_USLUGAHOT_USLUGA is 
'Powi¹zanie, w którym hotel mo¿e mieæ wiele us³ug i us³ugi mog¹ wystêpowaæ w wielu hotelach.';

alter table WyposazeniePokoju
   add constraint FK_WYPOSAZE_WYPOSAZEN_POKOJ foreign key (IdPokoju)
      references Pokoj (IdPokoju)
      on update restrict
      on delete restrict;

comment on foreign key WyposazeniePokoju.FK_WYPOSAZE_WYPOSAZEN_POKOJ is 
'Powi¹zanie, w którym pokój mo¿e mieæ wiele wyposa¿eñ i wyposa¿enie mo¿e byæ w wielu pokojach.';

alter table WyposazeniePokoju
   add constraint FK_WYPOSAZE_WYPOSAZEN_WYPOSAZE foreign key (IdWyposazenia)
      references Wyposazenie (IdWyposazenia)
      on update restrict
      on delete restrict;

comment on foreign key WyposazeniePokoju.FK_WYPOSAZE_WYPOSAZEN_WYPOSAZE is 
'Powi¹zanie, w którym pokój mo¿e mieæ wiele wyposa¿eñ i wyposa¿enie mo¿e byæ w wielu pokojach.';

