prompt PL/SQL Developer import file
prompt Created on Sunday, 26 May 2024 by renan
set feedback off
set define off
prompt Creating BRANCH...
create table BRANCH
(
  branchid      NUMBER(5) not null,
  branchaddress VARCHAR2(30) not null,
  branchmanager VARCHAR2(30) not null
);
alter table BRANCH
  add primary key (BRANCHID)
  ;

prompt Creating ACOUNT...
create table ACOUNT
(
  accountid     NUMBER(5) not null,
  balance       INTEGER not null,
  accountnumber INTEGER not null,
  branchid      NUMBER(5) not null
)
;
alter table ACOUNT
  add primary key (ACCOUNTID)
  ;
alter table ACOUNT
  add foreign key (BRANCHID)
  references BRANCH (BRANCHID);

prompt Creating ACTIONS...
create table ACTIONS
(
  actionid   NUMBER(5) not null,
  actionname VARCHAR2(30) not null,
  actionsum  INTEGER not null,
  actiondate DATE not null
)
;
alter table ACTIONS
  add primary key (ACTIONID)
  ;

prompt Creating CLIENT...
create table CLIENT
(
  clientid       NUMBER(5) not null,
  clientname     VARCHAR2(30) not null,
  clientaddress  VARCHAR2(30) not null,
  clientlastname VARCHAR2(30) not null
)
;
alter table CLIENT
  add primary key (CLIENTID)
  ;

prompt Creating ACTIVITY...
create table ACTIVITY
(
  activityid NUMBER(5) not null,
  clientid   NUMBER(5) not null,
  actionid   NUMBER(5) not null,
  accountid  NUMBER(5) not null,
  workerid   INTEGER not null
)
;
alter table ACTIVITY
  add primary key (ACTIVITYID)
  ;
alter table ACTIVITY
  add foreign key (CLIENTID)
  references CLIENT (CLIENTID);
alter table ACTIVITY
  add foreign key (ACTIONID)
  references ACTIONS (ACTIONID);
alter table ACTIVITY
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);

prompt Creating LOAN...
create table LOAN
(
  loanid      NUMBER(5) not null,
  numofpaymet NUMBER(5) not null,
  loansum     INTEGER not null
)
;
alter table LOAN
  add primary key (LOANID)
  ;

prompt Creating LOANTOACCOUNT...
create table LOANTOACCOUNT
(
  loandate      DATE not null,
  returnedornot NUMBER(5) not null,
  loanid        NUMBER(5) not null,
  accountid     NUMBER(5) not null
)
;
alter table LOANTOACCOUNT
  add primary key (LOANID, ACCOUNTID)
 ;
alter table LOANTOACCOUNT
  add foreign key (LOANID)
  references LOAN (LOANID);
alter table LOANTOACCOUNT
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);

prompt Creating WORKER...
create table WORKER
(
  workerid        INTEGER not null,
  workername      VARCHAR2(30) not null,
  workerbirthdate DATE,
  workerrole      VARCHAR2(30) not null
)
;
alter table WORKER
  add primary key (WORKERID)
  ;

prompt Disabling triggers for BRANCH...
alter table BRANCH disable all triggers;
prompt Disabling triggers for ACOUNT...
alter table ACOUNT disable all triggers;
prompt Disabling triggers for ACTIONS...
alter table ACTIONS disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for ACTIVITY...
alter table ACTIVITY disable all triggers;
prompt Disabling triggers for LOAN...
alter table LOAN disable all triggers;
prompt Disabling triggers for LOANTOACCOUNT...
alter table LOANTOACCOUNT disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling foreign key constraints for ACOUNT...
alter table ACOUNT disable constraint SYS_C007110;
prompt Disabling foreign key constraints for ACTIVITY...
alter table ACTIVITY disable constraint SYS_C007122;
alter table ACTIVITY disable constraint SYS_C007123;
alter table ACTIVITY disable constraint SYS_C007124;
prompt Disabling foreign key constraints for LOANTOACCOUNT...
alter table LOANTOACCOUNT disable constraint SYS_C007135;
alter table LOANTOACCOUNT disable constraint SYS_C007136;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting LOANTOACCOUNT...
delete from LOANTOACCOUNT;
commit;
prompt Deleting LOAN...
delete from LOAN;
commit;
prompt Deleting ACTIVITY...
delete from ACTIVITY;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting ACTIONS...
delete from ACTIONS;
commit;
prompt Deleting ACOUNT...
delete from ACOUNT;
commit;
prompt Deleting BRANCH...
delete from BRANCH;
commit;
prompt Loading BRANCH...
insert into BRANCH (branchid, branchaddress, branchmanager)
values (1, 'GalgalHamazalot 60,Hod Hashron', 'Michal');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (2, 'RabiAkiva 10,Bnei Brak', 'Michal');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (3, 'RabiAkiva 2,Bnei Brak', 'Michal');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (4, '93 Ellicott City Ave', 'Gavin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (5, '78 Kretschmann Road', 'Jimmie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (6, '27 Lin Street', 'Darren');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (7, '26 Roundtree Drive', 'Rosie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (8, '13rd Street', 'Gailard');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (9, '5 Holy Drive', 'Merrilee');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (10, '716 Hohenfels Drive', 'Frank');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (11, '22nd Street', 'Carol');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (12, '54 Crystal Road', 'Fats');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (13, '25 Murphy Street', 'Stellan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (14, '20 Berkoff Drive', 'Malcolm');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (15, '609 Arnold', 'Simon');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (16, '55 Winnipeg Street', 'Joaquim');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (17, '72 Moffat Drive', 'Hugh');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (18, '17 Pfeiffer Ave', 'Val');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (19, '36 Daniel Street', 'Vincent');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (20, '53 Monterey', 'Sammy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (21, '72 Redondo beach Road', 'Gordie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (22, '8 Tanon Drive', 'Kathleen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (23, '22 Meryl Street', 'Pablo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (24, '125 Hopper Drive', 'Harry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (25, '31st Street', 'Clarence');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (26, '88 Thewlis Street', 'Fisher');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (27, '38 Cleese Road', 'Goldie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (28, '789 Lorraine Street', 'Tom');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (29, '34 Applegate Street', 'Saul');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (30, '71 Rua eteno Drive', 'Lou');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (31, '71 Lummen', 'Diamond');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (32, '92 Magstadt Street', 'Adam');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (33, '43 Bratt Street', 'Jarvis');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (34, '92 Shelton Blvd', 'Fisher');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (35, '64 Juliet Street', 'Orlando');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (36, '960 Gaza Street', 'Dennis');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (37, '84 Hector Road', 'Danny');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (38, '97 Posey Road', 'Julianne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (39, '1 Eindhoven Road', 'Connie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (40, '52 Rourke Road', 'Rowan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (41, '77 Cassidy Drive', 'Willie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (42, '72 Columbus Drive', 'Bette');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (43, '69 Phoebe Road', 'Vern');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (44, '74 Reed Street', 'Lennie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (45, '100 Lea Ave', 'Kenneth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (46, '54 Adler Drive', 'Maura');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (47, '6 Leachman Street', 'Jean-Claude');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (48, '69 Northbrook Road', 'Cameron');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (49, '81 Uma Road', 'Benjamin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (50, '75 Waits Street', 'Ving');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (51, '91 Morse Road', 'Vin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (52, '22nd Street', 'Jackson');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (53, '744 Garza Street', 'Hookah');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (54, '52 Harary Road', 'Frances');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (55, '18 Latin Drive', 'Debra');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (56, '103 Dafoe Street', 'Andrew');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (57, '49 Ike Street', 'Ashton');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (58, '85 Pitt Ave', 'Sonny');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (59, '862 Granada Hills Blvd', 'Kazem');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (60, '920 Jeanne Street', 'Javon');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (61, '55 Hutch Blvd', 'Julianna');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (62, '762 Ulsteinvik Road', 'Emma');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (63, '27 Stiller', 'Rhona');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (64, '7 Redgrave Drive', 'Teena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (65, '24 Al Road', 'Glen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (66, '37 Tambor Road', 'Shelby');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (67, '87 Thörishaus Drive', 'Angelina');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (68, '6 LaPaglia Street', 'Mindy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (69, '339 Cube Blvd', 'Toshiro');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (70, '64 Münster Road', 'Bernie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (71, '65 Perry Road', 'Tom');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (72, '87 Oshkosh Blvd', 'Gino');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (73, '52 Orlando Drive', 'Chazz');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (74, '100 Crowe Street', 'Joseph');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (75, '48 Silverdale Drive', 'Vondie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (76, '8 Woodland Hills Drive', 'Saffron');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (77, '17 Julie Street', 'Rik');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (78, '173 Glen Drive', 'Jet');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (79, '45 Burrows Blvd', 'Isaiah');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (80, '70 Thewlis Ave', 'Katrin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (81, '98 Luis Blvd', 'Thin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (82, '34 Rifkin Road', 'Ving');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (83, '18 Ted Road', 'Joey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (84, '75 Libertyville Road', 'Mitchell');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (85, '84 Ann Road', 'Clay');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (86, '7 Sellers Drive', 'Emmylou');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (87, '21st Street', 'Peabo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (88, '3 Collie Street', 'Wes');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (89, '86 Wainwright Road', 'Joaquim');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (90, '911 Hopper Road', 'Burton');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (91, '423 Saffron Street', 'Jean-Luc');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (92, '57 Hobson Street', 'Elle');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (93, '89 Bacharach Street', 'Fred');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (94, '75 Osmond Road', 'Val');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (95, '93rd Street', 'Mac');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (96, '65 Debbie Road', 'Renee');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (97, '27 Dean Blvd', 'Owen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (98, '289 Quinones Road', 'Hugh');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (99, '951 Domino Street', 'Emerson');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (100, '78 Goodman Street', 'Annette');
commit;
prompt 100 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager)
values (101, '72nd Street', 'Jane');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (102, '8 Rochester Drive', 'Armin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (103, '81st Street', 'Roddy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (104, '51 Warrington Blvd', 'Gran');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (105, '22 Cagle Road', 'Joey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (106, '72 Ice Ave', 'Ethan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (107, '56 Van Shelton Blvd', 'Hope');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (108, '22nd Street', 'Linda');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (109, '71st Street', 'Wesley');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (110, '412 Lexington Ave', 'Petula');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (111, '55 Thurman Road', 'Bobby');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (112, '33rd Street', 'Kid');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (113, '83 Sinatra Drive', 'Taryn');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (114, '63 Whittier Road', 'Gates');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (115, '91st Street', 'Jarvis');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (116, '69 Helen Road', 'Ahmad');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (117, '35 Nielsen Road', 'Vanessa');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (118, '51 Chubby Street', 'Trick');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (119, '83rd Street', 'Noah');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (120, '438 Herzlia Blvd', 'Night');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (121, '25 Scottsdale Drive', 'Jody');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (122, '695 Bernard Drive', 'Nikka');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (123, '1 Kitty', 'Cate');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (124, '7 Rhea Street', 'Teri');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (125, '62nd Street', 'Sara');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (126, '71 Hawn Drive', 'Joshua');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (127, '74 Eiksmarka Road', 'Jackie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (128, '28 Hilton Road', 'Pete');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (129, '71st Street', 'Josh');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (130, '269 Laws', 'Anthony');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (131, '2 Research Triangle Drive', 'Ali');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (132, '32nd Street', 'Clint');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (133, '87 MacPherson', 'Ashton');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (134, '557 Latin', 'Sophie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (135, '67 Kirsten Drive', 'Tom');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (136, '83 Keith Road', 'Helen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (137, '58 Christine Road', 'Bill');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (138, '95 Colon Drive', 'Joseph');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (139, '21st Street', 'Rupert');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (140, '55 Jonatha Road', 'Susan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (141, '352 Tommy Street', 'Penelope');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (142, '120 Whitley Road', 'Jack');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (143, '259 Saint Ouen Road', 'Treat');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (144, '65 Judge Drive', 'Doug');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (145, '71st Street', 'Marlon');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (146, '39 Jann Road', 'Natascha');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (147, '96 Lizzy Road', 'Wendy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (148, '67 Herzogenrath Road', 'Trini');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (149, '52nd Street', 'Kathy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (150, '490 Ned Street', 'Merillee');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (151, '11 Emilio Blvd', 'Rosanne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (152, '85 Oslo Ave', 'Pelvic');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (153, '526 Lindsey Drive', 'Gwyneth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (154, '2 Turner Drive', 'Warren');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (155, '959 Livermore Road', 'Toni');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (156, '72 Runcorn Road', 'Ashton');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (157, '80 Sugar Land Ave', 'Bob');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (158, '98 Reese Road', 'Mili');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (159, '35 Metcalf', 'Geena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (160, '56 Dennis Drive', 'Terence');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (161, '93rd Street', 'Miles');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (162, '64 Oldham Street', 'Wally');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (163, '82 Lathrop Drive', 'Max');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (164, '91 Lummen Road', 'Fiona');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (165, '68 Newcastle upon Tyne Road', 'Carole');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (166, '50 Debby Street', 'Allan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (167, '53 Stanford Ave', 'Ani');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (168, '26 Lou Street', 'Embeth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (169, '19 Oldman Drive', 'Arturo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (170, '59 Sorocaba Drive', 'Liev');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (171, '59 Sellers Road', 'Gin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (172, '71st Street', 'Andre');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (173, '71 Joey Drive', 'Lindsay');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (174, '50 Howard', 'Rhys');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (175, '35 Nanaimo Street', 'Gwyneth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (176, '19 Begley Ave', 'Jennifer');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (177, '80 Merchant Street', 'Fisher');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (178, '81 Giovanni Road', 'Ritchie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (179, '15 Lineback Drive', 'Brooke');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (180, '29 Ian Drive', 'Johnny');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (181, '48 Buscemi Blvd', 'Greg');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (182, '95 Hookah Ave', 'Alessandro');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (183, '565 Deejay Road', 'Sharon');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (184, '91 Embeth Road', 'Pamela');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (185, '586 Eiksmarka Street', 'Viggo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (186, '1 Domino Road', 'Rickie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (187, '54 Lucien Ave', 'Adrien');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (188, '343 Petach-Tikva Road', 'Buffy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (189, '229 Liv Road', 'Desmond');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (190, '35 Alannah Ave', 'Connie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (191, '19 Bolzano Street', 'Samantha');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (192, '957 Hall Drive', 'Kim');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (193, '63 Mos Street', 'Teena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (194, '76 Schaumburg Road', 'Olga');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (195, '24 Benoit Street', 'Jody');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (196, '57 East sussex Blvd', 'Oded');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (197, '3 Fort gordon Street', 'Chely');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (198, '55 Davison Blvd', 'Alannah');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (199, '72 James Road', 'Dylan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (200, '92 Osaka Road', 'Rik');
commit;
prompt 200 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager)
values (201, '361 Meredith Road', 'Kid');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (202, '6 Sutherland Street', 'Stevie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (203, '11 McBride Road', 'Gran');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (204, '63 Oak park Drive', 'Rebeka');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (205, '75 Tilda Road', 'Lila');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (206, '67 Fishburne Drive', 'Carolyn');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (207, '1 Bern Street', 'Reese');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (208, '487 Colton Blvd', 'Sona');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (209, '82nd Street', 'Roberta');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (210, '59 Preston Ave', 'Vivica');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (211, '259 Los Angeles Drive', 'Jude');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (212, '27 Roy Parnell Ave', 'Geggy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (213, '58 Farrow Road', 'Julie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (214, '32 Hampton Drive', 'Jackson');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (215, '89 Milwaukee Road', 'Fiona');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (216, '85 Agoncillo Drive', 'Stockard');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (217, '11 Oszajca Road', 'Emerson');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (218, '29 Ebersberg Street', 'Gates');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (219, '866 Davidson Road', 'Samuel');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (220, '52nd Street', 'Fairuza');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (221, '55 Coyote Drive', 'Gabrielle');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (222, '47 Suwon-city Blvd', 'George');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (223, '72nd Street', 'Stephanie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (224, '85 Ulm Drive', 'Diane');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (225, '100 Chambery Street', 'Mary-Louise');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (226, '68 Balmoral Road', 'Jeroen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (227, '40 McLachlan', 'Rosco');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (228, '67 MacDonald Road', 'Jena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (229, '175 Rydell Ave', 'Bo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (230, '10 Lyngby', 'Andrae');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (231, '81 Patton Road', 'Lizzy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (232, '622 Waite Drive', 'Talvin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (233, '40 Lahr Road', 'Rip');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (234, '99 Burlington Street', 'Corey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (235, '712 Julianna Road', 'Jonny');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (236, '47 Debary Street', 'Mena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (237, '98 Verwood Road', 'Armin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (238, '100 Yucca', 'Olympia');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (239, '974 Hermitage Road', 'Sal');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (240, '80 Forest Street', 'Alex');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (241, '2 Ramis Ave', 'Ethan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (242, '322 Lara Road', 'Nils');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (243, '22 Garofalo Drive', 'Joanna');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (244, '11 Anjelica Blvd', 'Veruca');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (245, '508 Valencia Blvd', 'Michelle');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (246, '5 Yaphet Road', 'Sona');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (247, '23 Maidenhead Road', 'Nastassja');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (248, '52nd Street', 'Geggy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (249, '44 Bryson Ave', 'Sandra');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (250, '68 North Wales Ave', 'Earl');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (251, '50 Hyderabad Drive', 'Lionel');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (252, '557 Cochran Road', 'Roy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (253, '31st Street', 'Lou');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (254, '71 Ferrell Street', 'Peabo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (255, '20 Thorton Drive', 'Freda');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (256, '1 Arturo Street', 'Meredith');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (257, '54 Jay Drive', 'Meredith');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (258, '43rd Street', 'Rueben');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (259, '19 von Sydow Blvd', 'Milla');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (260, '99 Breda Street', 'Judd');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (261, '22 Stellenbosch Street', 'Patty');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (262, '40 Radney Road', 'Henry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (263, '49 Mitchell Road', 'Beth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (264, '55 Huston Drive', 'Deborah');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (265, '47 Daejeon Road', 'Ahmad');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (266, '34 Marsden Road', 'Angie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (267, '33 Goslar Drive', 'Fairuza');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (268, '33rd Street', 'Nils');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (269, '81st Street', 'Teena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (270, '559 Abbotsford Street', 'Swoosie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (271, '30 Juazeiro Road', 'Dorry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (272, '347 Colton Road', 'Famke');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (273, '95 Rivers Street', 'Bradley');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (274, '40 Hagerty Road', 'Desmond');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (275, '27 Elizabeth Road', 'Louise');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (276, '48 Willis Blvd', 'Lesley');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (277, '44 Gummersbach Ave', 'Dan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (278, '50 Mason Street', 'Lou');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (279, '71 Juliet Road', 'Juliana');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (280, '70 Gough Street', 'Avril');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (281, '75 David Street', 'Gavin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (282, '881 Cattrall', 'Dennis');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (283, '91 Oak park Street', 'Heather');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (284, '18 Colton Blvd', 'Owen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (285, '52nd Street', 'Edie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (286, '59 Allison Blvd', 'Ronnie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (287, '73rd Street', 'Breckin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (288, '37 Richard Blvd', 'Todd');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (289, '60 Warwick Drive', 'Wade');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (290, '82nd Street', 'Adrien');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (291, '91 Guamo', 'Red');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (292, '94 Mazar Street', 'Pierce');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (293, '99 Belgrad', 'Emmylou');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (294, '85 Mclean Road', 'Teri');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (295, '1 Loreena Drive', 'Patti');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (296, '27 Short Road', 'Mena');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (297, '207 Naestved Road', 'Alessandro');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (298, '37 Kirk Drive', 'Janeane');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (299, '75 Will', 'Jennifer');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (300, '35 Angelina Blvd', 'Deborah');
commit;
prompt 300 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager)
values (301, '53 Trevino Drive', 'Ani');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (302, '26 Brenda Road', 'Wade');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (303, '47 Edwardstown Ave', 'Aaron');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (304, '17 Sheena Street', 'Delroy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (305, '65 Beatty Drive', 'Aimee');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (306, '43 DiBiasio Ave', 'Maura');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (307, '48 Williamson Drive', 'Walter');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (308, '58 Unger Road', 'Mary Beth');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (309, '10 North bethesda Street', 'Martha');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (310, '16 Lemmon Blvd', 'Jeff');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (311, '62 Clea Road', 'Samuel');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (312, '18 Brendan Street', 'Zooey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (313, '3 Irving Ave', 'Lennie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (314, '4 Battle Creek Street', 'Fionnula');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (315, '64 Kitty Ave', 'Praga');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (316, '52nd Street', 'Louise');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (317, '36 Rifkin Road', 'Wally');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (318, '60 Rickles Street', 'Jeanne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (319, '129 Suwon Road', 'Alex');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (320, '92nd Street', 'Madeline');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (321, '12 Doucette Street', 'Spike');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (322, '167 Loeb Street', 'Roberta');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (323, '95 Gallagher Ave', 'Cary');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (324, '4 Bryson', 'Talvin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (325, '50 Geoffrey Street', 'Lila');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (326, '94 Roanoke', 'Celia');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (327, '23 Gough Ave', 'Guy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (328, '93 Rawlins Road', 'Rory');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (329, '43 Idol Road', 'Adam');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (330, '71st Street', 'Chet');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (331, '12 Wells Street', 'Ritchie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (332, '31st Street', 'Owen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (333, '76 Mogliano Veneto Road', 'Anthony');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (334, '92 Yankovic Blvd', 'Demi');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (335, '88 Maserada sul Piave Drive', 'Johnnie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (336, '32 Crosby Street', 'Jeff');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (337, '80 Wincott Blvd', 'Juice');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (338, '20 Powers', 'Mark');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (339, '79 Lathrop Street', 'Mindy');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (340, '87 Lorenz Road', 'Joe');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (341, '5 O''Neal Blvd', 'Arturo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (342, '87 Lübeck Ave', 'Lisa');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (343, '9 Bruneck Drive', 'Jeanne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (344, '448 Scorsese Blvd', 'Anna');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (345, '22 Randal Street', 'Arturo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (346, '18 Ipswich Street', 'Colm');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (347, '57 Ticotin Street', 'Don');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (348, '8 Collective Road', 'Stevie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (349, '701 Pat Blvd', 'Devon');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (350, '49 Jackman Road', 'Larry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (351, '89 Aiken Drive', 'Merillee');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (352, '79 Tennison Ave', 'Cate');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (353, '49 Diffie Drive', 'Allison');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (354, '70 Pullman Blvd', 'Robin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (355, '64 Robbie Road', 'Gabriel');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (356, '31st Street', 'Claude');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (357, '63 Mount Laurel Street', 'Julianne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (358, '48 Plummer Blvd', 'Thin');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (359, '32 Hohenfels Blvd', 'Sheryl');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (360, '68 Hagerty Street', 'Maureen');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (361, '89 Morton Street', 'Phoebe');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (362, '4 Hikaru Road', 'Trey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (363, '30 Gill Blvd', 'Ty');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (364, '3 Bollensen Street', 'Suzanne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (365, '48 Farris Street', 'Lindsey');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (366, '33rd Street', 'Azucar');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (367, '1 Shand Street', 'Angelina');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (368, '3 Macht', 'Rosie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (369, '76 Sarandon Blvd', 'Angelina');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (370, '619 Toshiro Road', 'Rosario');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (371, '443 Diaz Street', 'Glenn');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (372, '7 Hampton Road', 'Tim');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (373, '71 Utada Ave', 'Terry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (374, '8 Myers Street', 'Drew');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (375, '937 Trejo Road', 'Christopher');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (376, '8 Laurie Road', 'Nils');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (377, '868 Smyrna', 'Greg');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (378, '34 Armin Road', 'Maria');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (379, '44 Espoo Blvd', 'Linda');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (380, '83 Cooper Blvd', 'Howard');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (381, '8 Hazel Blvd', 'Candice');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (382, '77 Napolitano Road', 'Bo');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (383, '19 Redmond Street', 'Aidan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (384, '75 Sevenfold Road', 'Dorry');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (385, '60 Melvin Drive', 'Giovanni');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (386, '79 Val Ave', 'Kylie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (387, '14 Carl', 'CeCe');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (388, '82nd Street', 'Juice');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (389, '30 Costello Drive', 'Nelly');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (390, '27 Merchant Street', 'Carrie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (391, '82 Neville Street', 'Aidan');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (392, '779 De Niro', 'Peter');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (393, '93 Melrose park', 'Murray');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (394, '212 Carlsbad', 'Elle');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (395, '44 Herndon Road', 'Raymond');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (396, '21st Street', 'Jake');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (397, '50 Pottendorf Drive', 'Heather');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (398, '82 Austin Blvd', 'Edie');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (399, '702 Oak park Blvd', 'Chaka');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (400, '41st Street', 'Ali');
commit;
prompt 400 records committed...
insert into BRANCH (branchid, branchaddress, branchmanager)
values (401, '22nd Street', 'Rosanne');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (402, '72 Phil Road', 'Tea');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (403, '769 Kejae City Ave', 'Rachel');
commit;
prompt 403 records loaded
prompt Loading ACOUNT...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (1, 200, 123456, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (2, 0, 654321, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (3, 1234, 615243, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (4, 1000, 162534, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (5, 188153, 306095, 311);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (6, 134741, 985257, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (7, 216506, 608984, 240);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (8, 939953, 931011, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (9, 757839, 374006, 197);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (10, 118550, 382494, 125);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (11, 556454, 351816, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (12, 829808, 752672, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (13, 884641, 343468, 167);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (14, 391783, 802167, 187);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (15, 40194, 381045, 263);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (16, 747455, 208159, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (17, 220723, 473138, 62);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (18, 679954, 724540, 371);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (19, 394782, 575178, 200);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (20, 554855, 896628, 140);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (21, 289124, 533802, 135);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (22, 872353, 565701, 131);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (23, 721662, 251006, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (24, 706118, 771370, 89);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (25, 752930, 508105, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (26, 501110, 839601, 133);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (27, 567295, 562634, 128);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (28, 512217, 787254, 250);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (29, 191462, 314636, 129);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (30, 701710, 686604, 100);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (31, 174430, 513505, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (32, 988704, 671706, 153);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (33, 752434, 773892, 266);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (34, 670567, 438844, 45);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (35, 867185, 770461, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (36, 427056, 652031, 396);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (37, 258215, 317715, 292);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (38, 885305, 417720, 321);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (39, 773021, 893929, 383);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (40, 80290, 996904, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (41, 594320, 168737, 85);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (42, 603351, 983828, 52);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (43, 334774, 123278, 197);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (44, 603449, 454823, 174);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (45, 458249, 341413, 37);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (46, 404477, 984650, 23);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (47, 315843, 381414, 47);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (48, 139601, 297355, 18);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (49, 796802, 541200, 271);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (50, 792916, 970301, 135);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (51, 251660, 487677, 233);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (52, 191973, 199977, 100);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (53, 510002, 463433, 129);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (54, 124662, 672670, 136);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (55, 550588, 493103, 194);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (56, 672836, 318327, 86);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (57, 249736, 518486, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (58, 375603, 268234, 353);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (59, 697349, 177108, 206);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (60, 769779, 742678, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (61, 391253, 634750, 169);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (62, 516092, 769895, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (63, 262117, 269660, 310);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (64, 519990, 538447, 25);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (65, 505637, 416016, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (66, 507588, 918114, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (67, 668403, 788009, 44);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (68, 233167, 605549, 155);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (69, 911383, 554808, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (70, 186998, 766691, 309);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (71, 922851, 102020, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (72, 153691, 414419, 296);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (73, 133195, 228242, 127);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (74, 554334, 783477, 156);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (75, 760076, 367191, 319);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (76, 2675, 501499, 117);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (77, 346143, 727963, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (78, 229317, 811341, 158);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (79, 905663, 889403, 148);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (80, 290527, 332012, 243);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (81, 133288, 600723, 35);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (82, 92551, 759705, 5);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (83, 410457, 810472, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (84, 540644, 262833, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (85, 134919, 201179, 29);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (86, 376892, 621959, 242);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (87, 259268, 328567, 217);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (88, 814866, 363276, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (89, 417503, 483443, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (90, 724642, 339060, 280);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (91, 707112, 692554, 290);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (92, 181305, 776594, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (93, 640499, 882977, 196);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (94, 976177, 254651, 142);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (95, 46116, 734321, 74);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (96, 15193, 430024, 372);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (97, 349143, 465380, 259);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (98, 705659, 431974, 70);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (99, 756221, 528163, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (100, 273354, 126171, 50);
commit;
prompt 100 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (101, 971337, 443625, 352);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (102, 769435, 927934, 254);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (103, 242779, 491276, 377);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (104, 132936, 973559, 65);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (105, 346754, 990328, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (106, 382756, 844587, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (107, 614219, 664427, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (108, 635030, 139149, 312);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (109, 866317, 796586, 10);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (110, 490449, 503396, 131);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (111, 202842, 636861, 194);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (112, 223790, 530647, 170);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (113, 550129, 853968, 259);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (114, 447145, 512540, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (115, 781940, 804512, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (116, 321693, 841409, 110);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (117, 642024, 661212, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (118, 272720, 722612, 184);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (119, 682298, 475573, 80);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (120, 331550, 115748, 357);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (121, 548832, 482187, 198);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (122, 998543, 491008, 118);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (123, 261256, 262500, 328);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (124, 705905, 817480, 232);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (125, 202505, 106692, 141);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (126, 870173, 100309, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (127, 427430, 224491, 337);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (128, 974438, 909488, 288);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (129, 173210, 990648, 218);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (130, 422129, 700995, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (131, 174216, 749529, 399);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (132, 870003, 777144, 206);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (133, 111536, 877245, 394);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (134, 690354, 373775, 33);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (135, 325214, 790030, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (136, 943927, 653388, 9);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (137, 347911, 825611, 166);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (138, 77997, 331869, 320);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (139, 944689, 891169, 182);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (140, 311182, 428282, 163);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (141, 727388, 698564, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (142, 640143, 408531, 166);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (143, 116196, 675949, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (144, 416076, 450842, 272);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (145, 7894, 786004, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (146, 803110, 100154, 377);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (147, 42500, 476059, 43);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (148, 959070, 355980, 208);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (149, 400091, 465516, 386);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (150, 783948, 960239, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (151, 669895, 822610, 389);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (152, 375354, 374341, 347);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (153, 76952, 326742, 393);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (154, 225749, 964567, 255);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (155, 290079, 935787, 122);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (156, 505808, 807878, 117);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (157, 731202, 911083, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (158, 814413, 492867, 326);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (159, 822684, 277489, 159);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (160, 350968, 978950, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (161, 508723, 443298, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (162, 892472, 197306, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (163, 731595, 256026, 221);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (164, 48626, 985773, 175);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (165, 896070, 456558, 193);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (166, 335621, 953105, 8);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (167, 778186, 696926, 15);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (168, 465691, 822034, 221);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (169, 390207, 537522, 27);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (170, 207561, 111594, 147);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (171, 64595, 318914, 130);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (172, 44925, 643471, 311);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (173, 28599, 542992, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (174, 958795, 101028, 368);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (175, 70162, 779139, 34);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (176, 797195, 789239, 343);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (177, 107780, 964715, 105);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (178, 184981, 645461, 385);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (179, 634154, 576688, 367);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (180, 579850, 390885, 384);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (181, 668519, 443889, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (182, 210501, 997009, 132);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (183, 87906, 428480, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (184, 51868, 826713, 68);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (185, 575715, 461945, 170);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (186, 12828, 101791, 51);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (187, 989505, 556568, 133);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (188, 946372, 704391, 382);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (189, 271145, 459150, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (190, 253356, 844886, 52);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (191, 164128, 250943, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (192, 551157, 779583, 299);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (193, 527189, 157619, 308);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (194, 430286, 444603, 89);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (195, 3184, 396885, 121);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (196, 537863, 543429, 144);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (197, 779650, 890268, 402);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (198, 419224, 591374, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (199, 225352, 880922, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (200, 530384, 836687, 318);
commit;
prompt 200 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (201, 867807, 662304, 173);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (202, 917079, 951596, 88);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (203, 552675, 314471, 120);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (204, 53179, 973351, 222);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (205, 259820, 396777, 348);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (206, 554924, 181726, 318);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (207, 4804, 339217, 73);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (208, 750080, 681544, 314);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (209, 91609, 340797, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (210, 695420, 922937, 317);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (211, 764543, 803287, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (212, 14233, 294525, 239);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (213, 597334, 933941, 326);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (214, 180432, 171655, 16);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (215, 817800, 222295, 323);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (216, 419809, 949585, 214);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (217, 759599, 165444, 381);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (218, 544473, 646296, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (219, 821079, 864307, 276);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (220, 596077, 477687, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (221, 257517, 371707, 216);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (222, 459584, 695491, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (223, 899640, 922795, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (224, 434503, 691627, 51);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (225, 40743, 750713, 72);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (226, 427296, 618141, 93);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (227, 329439, 566649, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (228, 769475, 605544, 132);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (229, 107611, 694892, 168);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (230, 983278, 490596, 385);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (231, 305997, 281288, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (232, 923283, 743600, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (233, 315499, 569011, 46);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (234, 930304, 821273, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (235, 253288, 739962, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (236, 755988, 720620, 199);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (237, 301543, 284637, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (238, 365177, 478033, 285);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (239, 375810, 169282, 149);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (240, 110791, 402525, 244);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (241, 841828, 747757, 333);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (242, 515213, 958617, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (243, 406934, 698055, 360);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (244, 795546, 779363, 7);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (245, 227184, 881094, 308);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (246, 649918, 199473, 300);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (247, 756671, 303483, 336);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (248, 491017, 908741, 198);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (249, 483705, 247701, 69);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (250, 583499, 743260, 203);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (251, 511976, 293783, 323);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (252, 226530, 112495, 3);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (253, 516121, 427378, 92);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (254, 533805, 610366, 112);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (255, 992719, 891301, 209);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (256, 313626, 434378, 297);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (257, 502143, 322495, 222);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (258, 353350, 244739, 378);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (259, 816440, 905174, 230);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (260, 878350, 991612, 390);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (261, 115918, 594758, 356);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (262, 398021, 629349, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (263, 675026, 607607, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (264, 382791, 378086, 312);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (265, 408702, 259512, 104);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (266, 549117, 291584, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (267, 276419, 852820, 258);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (268, 776519, 102038, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (269, 424886, 189105, 204);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (270, 154325, 943914, 15);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (271, 154493, 702744, 73);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (272, 168513, 466013, 328);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (273, 881507, 601917, 152);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (274, 903271, 230104, 366);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (275, 300219, 548505, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (276, 160236, 321925, 157);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (277, 489344, 538584, 280);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (278, 903261, 672321, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (279, 817240, 841782, 363);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (280, 230457, 659028, 172);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (281, 743763, 351990, 97);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (282, 470850, 239424, 193);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (283, 54993, 275085, 300);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (284, 812463, 507605, 230);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (285, 263388, 362603, 148);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (286, 404853, 381760, 139);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (287, 922492, 175025, 68);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (288, 954276, 866200, 388);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (289, 4773, 755692, 186);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (290, 756421, 102779, 118);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (291, 335888, 497629, 13);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (292, 702500, 185190, 191);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (293, 931157, 822008, 329);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (294, 361819, 662771, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (295, 2970, 939773, 211);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (296, 600437, 264524, 309);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (297, 963453, 368486, 208);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (298, 653523, 735052, 70);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (299, 997679, 205793, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (300, 941068, 248428, 105);
commit;
prompt 300 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (301, 291592, 950524, 136);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (302, 515263, 759900, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (303, 827794, 193326, 16);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (304, 665557, 724900, 84);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (305, 374341, 302410, 360);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (306, 196629, 366558, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (307, 948914, 487460, 386);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (308, 47881, 562800, 179);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (309, 205713, 567456, 159);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (310, 552886, 858618, 307);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (311, 927852, 277243, 187);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (312, 556222, 844353, 216);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (313, 676124, 754398, 330);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (314, 125593, 683090, 322);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (315, 708555, 733618, 91);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (316, 531732, 775872, 157);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (317, 106375, 771631, 151);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (318, 829686, 828486, 28);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (319, 683709, 212849, 165);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (320, 575321, 384516, 214);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (321, 282643, 515843, 207);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (322, 262608, 422205, 79);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (323, 525115, 974494, 232);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (324, 783065, 733899, 252);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (325, 570538, 216594, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (326, 901160, 822564, 240);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (327, 975991, 427995, 247);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (328, 220873, 716354, 391);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (329, 936418, 363426, 20);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (330, 701652, 725760, 50);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (331, 58302, 446939, 14);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (332, 279052, 504676, 394);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (333, 954031, 667052, 269);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (334, 869011, 133082, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (335, 398272, 115064, 105);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (336, 797355, 371142, 374);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (337, 124653, 431183, 294);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (338, 810451, 648706, 361);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (339, 623161, 493059, 258);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (340, 101180, 906638, 203);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (341, 88816, 236572, 375);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (342, 539346, 603348, 160);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (343, 32474, 720230, 150);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (344, 339525, 997688, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (345, 557765, 563822, 30);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (346, 44921, 824126, 57);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (347, 996707, 990095, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (348, 765319, 944212, 97);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (349, 42762, 406526, 181);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (350, 393385, 195915, 134);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (351, 786747, 263963, 102);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (352, 848762, 325813, 196);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (353, 710385, 951300, 130);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (354, 576134, 884522, 202);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (355, 787074, 211564, 212);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (356, 364304, 249420, 315);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (357, 941901, 726282, 26);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (358, 370658, 116993, 262);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (359, 295865, 992792, 400);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (360, 841880, 936078, 235);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (361, 424886, 344638, 219);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (362, 729759, 539355, 245);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (363, 365151, 819631, 295);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (364, 23017, 229729, 260);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (365, 855193, 994657, 329);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (366, 464714, 297117, 298);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (367, 384120, 662306, 18);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (368, 212467, 635757, 176);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (369, 577390, 852992, 106);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (370, 238020, 708835, 154);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (371, 358726, 388750, 229);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (372, 665959, 322152, 185);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (373, 741803, 122603, 253);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (374, 131318, 328057, 270);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (375, 90703, 751420, 349);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (376, 404710, 441067, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (377, 806290, 421975, 281);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (378, 304151, 213958, 257);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (379, 709123, 660546, 344);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (380, 97329, 153604, 393);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (381, 460856, 677162, 218);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (382, 509160, 455984, 286);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (383, 257606, 107873, 241);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (384, 899719, 465642, 86);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (385, 303259, 893229, 210);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (386, 479349, 622800, 9);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (387, 290343, 429943, 140);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (388, 393609, 407497, 353);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (389, 843705, 206653, 215);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (390, 453054, 830883, 63);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (391, 680004, 124996, 342);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (392, 14358, 815261, 251);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (393, 666773, 145239, 78);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (394, 352222, 353047, 95);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (395, 90709, 862551, 119);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (396, 608632, 596596, 161);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (397, 828699, 847121, 354);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (398, 379644, 812220, 191);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (399, 819149, 749713, 199);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (400, 12579, 288826, 211);
commit;
prompt 400 records committed...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (401, 818122, 715409, 355);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (402, 50748, 530794, 239);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (403, 957002, 743297, 11);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (404, 791167, 942120, 317);
commit;
prompt 404 records loaded
prompt Loading ACTIONS...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (1, 'deposit', 50, to_date('11-01-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (2, 'deposit', 100, to_date('12-01-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (3, 'deposit', 20, to_date('06-07-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (4, 'deposit', 340, to_date('22-05-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (5, 'Transferring Funds', 460493, to_date('06-06-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (6, 'deposit', 111597, to_date('24-06-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (7, 'deposit', 992488, to_date('08-05-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (8, 'Withdrawing Funds', 292502, to_date('29-06-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (9, 'Transferring Funds', 254961, to_date('14-03-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (10, 'deposit', 565084, to_date('11-08-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (11, 'deposit', 304770, to_date('06-02-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (12, 'Withdrawing Funds', 875012, to_date('04-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (13, 'deposit', 322980, to_date('05-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (14, 'Withdrawing Funds', 84672, to_date('01-04-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (15, 'Withdrawing Funds', 440477, to_date('29-03-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (16, 'deposit', 907857, to_date('29-05-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (17, 'deposit', 227439, to_date('25-10-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (18, 'Withdrawing Funds', 965692, to_date('21-09-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (19, 'Withdrawing Funds', 736974, to_date('06-01-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (20, 'Transferring Funds', 680685, to_date('11-04-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (21, 'deposit', 776344, to_date('14-07-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (22, 'Transferring Funds', 506943, to_date('27-02-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (23, 'deposit', 368160, to_date('15-06-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (24, 'Transferring Funds', 247518, to_date('26-08-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (25, 'deposit', 225465, to_date('17-11-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (26, 'Transferring Funds', 754414, to_date('04-08-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (27, 'Transferring Funds', 57083, to_date('22-01-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (28, 'deposit', 452641, to_date('10-08-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (29, 'Withdrawing Funds', 708007, to_date('04-05-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (30, 'Withdrawing Funds', 688258, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (31, 'Withdrawing Funds', 86601, to_date('24-05-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (32, 'deposit', 188120, to_date('22-06-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (33, 'Transferring Funds', 595649, to_date('02-01-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (34, 'deposit', 742156, to_date('15-02-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (35, 'Transferring Funds', 935888, to_date('26-10-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (36, 'Withdrawing Funds', 898044, to_date('26-06-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (37, 'Withdrawing Funds', 742674, to_date('29-12-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (38, 'deposit', 796643, to_date('24-01-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (39, 'Withdrawing Funds', 121221, to_date('09-05-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (40, 'Transferring Funds', 595959, to_date('12-06-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (41, 'deposit', 817519, to_date('08-10-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (42, 'deposit', 36599, to_date('30-06-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (43, 'Withdrawing Funds', 68462, to_date('31-05-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (44, 'deposit', 910002, to_date('05-03-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (45, 'Withdrawing Funds', 174121, to_date('17-12-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (46, 'Withdrawing Funds', 313447, to_date('15-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (47, 'deposit', 96665, to_date('08-11-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (48, 'Transferring Funds', 922616, to_date('12-04-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (49, 'deposit', 966336, to_date('16-01-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (50, 'Transferring Funds', 903288, to_date('09-01-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (51, 'Transferring Funds', 839551, to_date('27-08-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (52, 'Withdrawing Funds', 819357, to_date('19-07-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (53, 'Withdrawing Funds', 459164, to_date('08-01-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (54, 'Withdrawing Funds', 800791, to_date('29-04-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (55, 'Withdrawing Funds', 683977, to_date('10-02-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (56, 'Transferring Funds', 613143, to_date('25-01-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (57, 'Withdrawing Funds', 738537, to_date('07-12-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (58, 'Transferring Funds', 939848, to_date('22-12-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (59, 'Transferring Funds', 52743, to_date('19-05-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (60, 'Withdrawing Funds', 459234, to_date('06-10-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (61, 'deposit', 274544, to_date('28-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (62, 'Withdrawing Funds', 981883, to_date('04-02-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (63, 'Withdrawing Funds', 610507, to_date('02-10-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (64, 'Transferring Funds', 326704, to_date('30-12-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (65, 'Withdrawing Funds', 39593, to_date('27-06-1977', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (66, 'deposit', 561940, to_date('18-04-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (67, 'Transferring Funds', 720854, to_date('29-12-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (68, 'Transferring Funds', 41951, to_date('17-06-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (69, 'Withdrawing Funds', 135840, to_date('04-03-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (70, 'Withdrawing Funds', 133433, to_date('29-05-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (71, 'Transferring Funds', 731983, to_date('29-08-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (72, 'deposit', 969829, to_date('19-06-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (73, 'Transferring Funds', 134342, to_date('09-01-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (74, 'deposit', 802199, to_date('22-04-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (75, 'Withdrawing Funds', 919992, to_date('02-03-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (76, 'Withdrawing Funds', 848436, to_date('09-05-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (77, 'Transferring Funds', 579198, to_date('14-12-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (78, 'Transferring Funds', 790597, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (79, 'Transferring Funds', 167461, to_date('22-01-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (80, 'Transferring Funds', 542264, to_date('27-08-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (81, 'Transferring Funds', 360047, to_date('13-03-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (82, 'deposit', 421705, to_date('19-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (83, 'deposit', 705232, to_date('03-10-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (84, 'Withdrawing Funds', 730407, to_date('01-04-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (85, 'deposit', 905535, to_date('15-10-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (86, 'Transferring Funds', 764948, to_date('23-10-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (87, 'Transferring Funds', 496385, to_date('27-09-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (88, 'Withdrawing Funds', 794859, to_date('17-07-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (89, 'Transferring Funds', 401669, to_date('16-09-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (90, 'Transferring Funds', 333592, to_date('06-02-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (91, 'Withdrawing Funds', 89234, to_date('21-11-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (92, 'deposit', 424506, to_date('20-07-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (93, 'Withdrawing Funds', 487114, to_date('14-05-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (94, 'Transferring Funds', 474190, to_date('28-10-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (95, 'deposit', 18639, to_date('07-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (96, 'deposit', 700580, to_date('01-05-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (97, 'Transferring Funds', 129769, to_date('04-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (98, 'Transferring Funds', 339539, to_date('22-07-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (99, 'deposit', 83203, to_date('31-03-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (100, 'Transferring Funds', 679404, to_date('23-02-2013', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (101, 'Withdrawing Funds', 636595, to_date('09-06-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (102, 'Transferring Funds', 584858, to_date('21-09-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (103, 'deposit', 76497, to_date('31-10-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (104, 'Withdrawing Funds', 737509, to_date('06-05-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (105, 'deposit', 876, to_date('11-02-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (106, 'Transferring Funds', 178544, to_date('17-12-1975', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (107, 'Withdrawing Funds', 800501, to_date('11-07-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (108, 'deposit', 195344, to_date('11-10-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (109, 'Transferring Funds', 38895, to_date('12-07-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (110, 'deposit', 967444, to_date('22-01-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (111, 'Withdrawing Funds', 439618, to_date('01-08-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (112, 'deposit', 984639, to_date('02-05-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (113, 'deposit', 20432, to_date('09-12-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (114, 'Transferring Funds', 888184, to_date('07-06-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (115, 'Withdrawing Funds', 622700, to_date('03-02-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (116, 'deposit', 375872, to_date('23-10-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (117, 'Withdrawing Funds', 745041, to_date('02-05-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (118, 'Withdrawing Funds', 963961, to_date('29-09-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (119, 'Transferring Funds', 752240, to_date('09-02-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (120, 'Transferring Funds', 30131, to_date('30-03-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (121, 'Withdrawing Funds', 268154, to_date('02-04-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (122, 'Transferring Funds', 478663, to_date('13-03-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (123, 'Withdrawing Funds', 427897, to_date('02-11-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (124, 'deposit', 892497, to_date('17-06-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (125, 'Withdrawing Funds', 729172, to_date('12-10-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (126, 'Transferring Funds', 967948, to_date('17-07-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (127, 'Transferring Funds', 42968, to_date('16-05-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (128, 'deposit', 691735, to_date('24-05-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (129, 'deposit', 985923, to_date('12-02-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (130, 'Withdrawing Funds', 918786, to_date('03-11-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (131, 'Withdrawing Funds', 881854, to_date('08-03-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (132, 'Transferring Funds', 61635, to_date('21-06-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (133, 'deposit', 7378, to_date('20-10-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (134, 'Withdrawing Funds', 317146, to_date('23-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (135, 'Withdrawing Funds', 296869, to_date('09-05-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (136, 'Transferring Funds', 550457, to_date('14-02-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (137, 'deposit', 228286, to_date('24-06-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (138, 'Transferring Funds', 435175, to_date('28-06-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (139, 'deposit', 791601, to_date('27-04-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (140, 'Withdrawing Funds', 33802, to_date('13-03-1972', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (141, 'Transferring Funds', 319361, to_date('13-10-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (142, 'Transferring Funds', 498422, to_date('16-08-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (143, 'Withdrawing Funds', 90545, to_date('01-08-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (144, 'Transferring Funds', 295856, to_date('06-11-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (145, 'Transferring Funds', 75047, to_date('21-09-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (146, 'deposit', 123269, to_date('01-12-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (147, 'Withdrawing Funds', 521280, to_date('08-08-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (148, 'Withdrawing Funds', 795863, to_date('25-02-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (149, 'Transferring Funds', 372805, to_date('10-09-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (150, 'Withdrawing Funds', 665567, to_date('16-08-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (151, 'Transferring Funds', 289121, to_date('29-11-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (152, 'Withdrawing Funds', 884386, to_date('28-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (153, 'deposit', 406958, to_date('28-11-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (154, 'deposit', 871299, to_date('07-08-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (155, 'deposit', 470738, to_date('19-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (156, 'Withdrawing Funds', 985443, to_date('22-12-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (157, 'Withdrawing Funds', 649782, to_date('08-12-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (158, 'Transferring Funds', 469236, to_date('11-10-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (159, 'deposit', 806169, to_date('09-06-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (160, 'deposit', 510242, to_date('30-10-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (161, 'Withdrawing Funds', 243546, to_date('02-09-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (162, 'Withdrawing Funds', 596760, to_date('15-09-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (163, 'Withdrawing Funds', 616563, to_date('28-07-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (164, 'Transferring Funds', 517756, to_date('04-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (165, 'deposit', 776021, to_date('31-10-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (166, 'deposit', 199516, to_date('06-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (167, 'deposit', 425984, to_date('17-08-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (168, 'deposit', 388288, to_date('25-01-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (169, 'Withdrawing Funds', 643364, to_date('10-11-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (170, 'deposit', 794911, to_date('13-01-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (171, 'Withdrawing Funds', 115620, to_date('21-01-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (172, 'Transferring Funds', 25082, to_date('29-04-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (173, 'Transferring Funds', 452505, to_date('05-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (174, 'deposit', 241034, to_date('13-04-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (175, 'Transferring Funds', 688158, to_date('17-08-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (176, 'Transferring Funds', 349969, to_date('17-06-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (177, 'Transferring Funds', 167098, to_date('20-10-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (178, 'Transferring Funds', 400406, to_date('10-11-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (179, 'Withdrawing Funds', 970889, to_date('23-05-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (180, 'Withdrawing Funds', 108758, to_date('06-09-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (181, 'Withdrawing Funds', 949536, to_date('14-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (182, 'Transferring Funds', 840544, to_date('19-04-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (183, 'deposit', 835093, to_date('07-10-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (184, 'Withdrawing Funds', 251451, to_date('01-03-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (185, 'Transferring Funds', 902670, to_date('22-04-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (186, 'deposit', 960870, to_date('02-10-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (187, 'Withdrawing Funds', 760332, to_date('21-05-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (188, 'Withdrawing Funds', 403675, to_date('20-07-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (189, 'Withdrawing Funds', 163621, to_date('25-09-1972', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (190, 'deposit', 187102, to_date('26-11-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (191, 'Transferring Funds', 821620, to_date('29-03-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (192, 'Transferring Funds', 194308, to_date('09-01-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (193, 'Transferring Funds', 53534, to_date('27-04-1972', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (194, 'Withdrawing Funds', 123547, to_date('23-04-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (195, 'Transferring Funds', 427532, to_date('14-05-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (196, 'deposit', 455192, to_date('26-02-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (197, 'deposit', 236234, to_date('20-08-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (198, 'Withdrawing Funds', 804329, to_date('13-11-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (199, 'Transferring Funds', 387307, to_date('24-12-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (200, 'Transferring Funds', 558726, to_date('06-09-1982', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (201, 'deposit', 88572, to_date('18-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (202, 'Transferring Funds', 433693, to_date('03-11-1975', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (203, 'deposit', 135408, to_date('29-11-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (204, 'deposit', 408552, to_date('15-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (205, 'Transferring Funds', 735796, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (206, 'Withdrawing Funds', 255945, to_date('05-08-1975', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (207, 'Transferring Funds', 191176, to_date('17-09-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (208, 'Withdrawing Funds', 849263, to_date('02-03-1972', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (209, 'Transferring Funds', 455392, to_date('24-03-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (210, 'Withdrawing Funds', 446342, to_date('21-12-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (211, 'Withdrawing Funds', 182187, to_date('30-09-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (212, 'deposit', 510860, to_date('13-04-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (213, 'deposit', 401728, to_date('28-09-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (214, 'Transferring Funds', 162906, to_date('23-12-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (215, 'Withdrawing Funds', 9048, to_date('19-03-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (216, 'Withdrawing Funds', 353021, to_date('21-11-1977', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (217, 'Transferring Funds', 855557, to_date('22-05-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (218, 'Withdrawing Funds', 149871, to_date('16-03-1972', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (219, 'Withdrawing Funds', 979924, to_date('03-11-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (220, 'deposit', 425573, to_date('23-08-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (221, 'deposit', 450929, to_date('20-02-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (222, 'deposit', 533756, to_date('01-03-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (223, 'deposit', 993207, to_date('28-09-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (224, 'deposit', 610223, to_date('01-02-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (225, 'Transferring Funds', 82529, to_date('05-10-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (226, 'deposit', 702335, to_date('02-06-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (227, 'deposit', 95656, to_date('05-09-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (228, 'Withdrawing Funds', 359393, to_date('17-10-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (229, 'Withdrawing Funds', 447120, to_date('12-11-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (230, 'deposit', 407182, to_date('05-04-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (231, 'deposit', 994886, to_date('31-08-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (232, 'deposit', 697653, to_date('13-09-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (233, 'Transferring Funds', 421853, to_date('11-02-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (234, 'deposit', 480495, to_date('07-04-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (235, 'Withdrawing Funds', 354527, to_date('25-09-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (236, 'deposit', 1774, to_date('10-07-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (237, 'Withdrawing Funds', 732366, to_date('09-03-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (238, 'deposit', 806938, to_date('24-12-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (239, 'Withdrawing Funds', 948726, to_date('04-04-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (240, 'deposit', 324206, to_date('15-09-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (241, 'Withdrawing Funds', 614383, to_date('02-11-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (242, 'Transferring Funds', 440880, to_date('29-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (243, 'Withdrawing Funds', 6280, to_date('13-02-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (244, 'Transferring Funds', 276792, to_date('30-04-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (245, 'Withdrawing Funds', 421313, to_date('31-03-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (246, 'Withdrawing Funds', 9661, to_date('27-03-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (247, 'Withdrawing Funds', 320263, to_date('16-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (248, 'deposit', 739043, to_date('08-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (249, 'Transferring Funds', 381455, to_date('23-05-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (250, 'Withdrawing Funds', 793776, to_date('18-08-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (251, 'Withdrawing Funds', 953374, to_date('10-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (252, 'deposit', 907712, to_date('03-09-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (253, 'Transferring Funds', 957656, to_date('25-02-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (254, 'deposit', 124624, to_date('26-08-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (255, 'Withdrawing Funds', 615521, to_date('27-04-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (256, 'Withdrawing Funds', 452509, to_date('16-11-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (257, 'Withdrawing Funds', 512774, to_date('27-06-2002', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (258, 'deposit', 989562, to_date('29-05-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (259, 'Transferring Funds', 42424, to_date('18-10-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (260, 'Withdrawing Funds', 793930, to_date('15-08-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (261, 'Transferring Funds', 233567, to_date('23-09-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (262, 'Transferring Funds', 986615, to_date('09-01-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (263, 'deposit', 953495, to_date('06-11-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (264, 'Transferring Funds', 769061, to_date('07-02-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (265, 'deposit', 516919, to_date('15-12-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (266, 'Transferring Funds', 17516, to_date('12-10-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (267, 'Transferring Funds', 417160, to_date('15-01-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (268, 'Transferring Funds', 200311, to_date('12-12-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (269, 'Withdrawing Funds', 270960, to_date('21-12-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (270, 'Withdrawing Funds', 361005, to_date('19-09-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (271, 'Transferring Funds', 700787, to_date('04-02-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (272, 'Transferring Funds', 133251, to_date('19-07-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (273, 'Transferring Funds', 834124, to_date('13-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (274, 'Withdrawing Funds', 16970, to_date('09-08-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (275, 'deposit', 934964, to_date('19-02-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (276, 'Transferring Funds', 759146, to_date('05-09-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (277, 'deposit', 465961, to_date('09-03-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (278, 'deposit', 461005, to_date('01-01-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (279, 'Withdrawing Funds', 168839, to_date('21-08-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (280, 'Transferring Funds', 287625, to_date('26-05-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (281, 'deposit', 611780, to_date('01-11-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (282, 'Withdrawing Funds', 201434, to_date('14-10-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (283, 'deposit', 645161, to_date('14-10-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (284, 'deposit', 284861, to_date('23-01-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (285, 'deposit', 395414, to_date('28-10-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (286, 'Transferring Funds', 778096, to_date('29-04-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (287, 'Withdrawing Funds', 373708, to_date('08-10-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (288, 'deposit', 243724, to_date('21-12-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (289, 'Transferring Funds', 42208, to_date('15-10-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (290, 'Withdrawing Funds', 94769, to_date('08-04-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (291, 'deposit', 329966, to_date('11-03-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (292, 'deposit', 400593, to_date('26-12-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (293, 'Transferring Funds', 186000, to_date('21-12-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (294, 'Withdrawing Funds', 224505, to_date('09-07-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (295, 'deposit', 858442, to_date('16-08-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (296, 'deposit', 65098, to_date('02-02-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (297, 'Transferring Funds', 263057, to_date('28-09-2013', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (298, 'Withdrawing Funds', 79983, to_date('16-12-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (299, 'Transferring Funds', 108109, to_date('10-01-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (300, 'Withdrawing Funds', 977917, to_date('22-10-1983', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (301, 'Withdrawing Funds', 445884, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (302, 'Transferring Funds', 588110, to_date('10-12-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (303, 'Transferring Funds', 577797, to_date('29-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (304, 'Transferring Funds', 463035, to_date('21-11-1975', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (305, 'Transferring Funds', 820319, to_date('30-12-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (306, 'Transferring Funds', 260619, to_date('07-08-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (307, 'Withdrawing Funds', 100827, to_date('05-08-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (308, 'Transferring Funds', 388787, to_date('02-09-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (309, 'Withdrawing Funds', 758927, to_date('05-05-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (310, 'Withdrawing Funds', 300324, to_date('26-07-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (311, 'deposit', 845363, to_date('19-04-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (312, 'deposit', 204884, to_date('04-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (313, 'deposit', 693668, to_date('19-07-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (314, 'Transferring Funds', 634574, to_date('24-07-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (315, 'Withdrawing Funds', 160384, to_date('27-02-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (316, 'Transferring Funds', 569739, to_date('19-03-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (317, 'Transferring Funds', 741278, to_date('02-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (318, 'Withdrawing Funds', 515878, to_date('02-01-1975', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (319, 'deposit', 343572, to_date('24-04-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (320, 'Transferring Funds', 334557, to_date('13-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (321, 'Transferring Funds', 884223, to_date('02-10-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (322, 'Transferring Funds', 580451, to_date('03-08-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (323, 'Withdrawing Funds', 661055, to_date('28-06-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (324, 'Transferring Funds', 899148, to_date('20-09-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (325, 'Withdrawing Funds', 660480, to_date('23-11-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (326, 'Withdrawing Funds', 505623, to_date('20-06-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (327, 'deposit', 195715, to_date('04-01-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (328, 'deposit', 205924, to_date('07-02-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (329, 'deposit', 565131, to_date('11-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (330, 'Transferring Funds', 656299, to_date('26-06-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (331, 'deposit', 352743, to_date('22-07-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (332, 'deposit', 886545, to_date('29-09-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (333, 'Withdrawing Funds', 617154, to_date('23-05-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (334, 'Withdrawing Funds', 361475, to_date('25-08-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (335, 'Withdrawing Funds', 100898, to_date('16-02-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (336, 'deposit', 328376, to_date('02-09-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (337, 'deposit', 794271, to_date('20-03-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (338, 'Transferring Funds', 711035, to_date('17-09-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (339, 'deposit', 276803, to_date('18-06-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (340, 'Withdrawing Funds', 674551, to_date('18-02-2017', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (341, 'Withdrawing Funds', 289152, to_date('10-01-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (342, 'deposit', 14043, to_date('29-07-1997', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (343, 'deposit', 531199, to_date('02-12-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (344, 'deposit', 25145, to_date('01-10-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (345, 'Withdrawing Funds', 789831, to_date('27-08-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (346, 'deposit', 308250, to_date('11-12-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (347, 'deposit', 744708, to_date('05-07-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (348, 'Transferring Funds', 353356, to_date('02-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (349, 'Transferring Funds', 238131, to_date('30-07-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (350, 'deposit', 562639, to_date('13-05-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (351, 'deposit', 991519, to_date('06-08-1994', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (352, 'Transferring Funds', 903835, to_date('10-02-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (353, 'Withdrawing Funds', 768057, to_date('08-04-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (354, 'Transferring Funds', 462454, to_date('02-08-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (355, 'deposit', 379107, to_date('30-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (356, 'deposit', 87674, to_date('21-02-1978', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (357, 'deposit', 778754, to_date('04-05-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (358, 'deposit', 918025, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (359, 'deposit', 341833, to_date('09-12-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (360, 'Withdrawing Funds', 139955, to_date('26-10-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (361, 'Withdrawing Funds', 343725, to_date('05-05-1989', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (362, 'deposit', 688045, to_date('27-02-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (363, 'deposit', 217147, to_date('02-03-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (364, 'Transferring Funds', 56193, to_date('21-05-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (365, 'deposit', 410400, to_date('26-10-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (366, 'Withdrawing Funds', 757343, to_date('12-09-1981', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (367, 'Transferring Funds', 181788, to_date('08-02-1974', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (368, 'Withdrawing Funds', 572130, to_date('25-07-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (369, 'deposit', 492930, to_date('23-12-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (370, 'Transferring Funds', 360576, to_date('12-09-1970', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (371, 'Withdrawing Funds', 876618, to_date('19-11-1971', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (372, 'Withdrawing Funds', 203544, to_date('17-05-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (373, 'Withdrawing Funds', 811066, to_date('10-02-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (374, 'Withdrawing Funds', 791679, to_date('14-01-1976', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (375, 'Withdrawing Funds', 298193, to_date('25-08-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (376, 'deposit', 610792, to_date('29-05-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (377, 'deposit', 78654, to_date('29-07-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (378, 'Transferring Funds', 390495, to_date('14-01-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (379, 'Transferring Funds', 784564, to_date('18-06-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (380, 'Transferring Funds', 804724, to_date('20-04-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (381, 'Withdrawing Funds', 394324, to_date('30-12-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (382, 'deposit', 346265, to_date('09-12-1982', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (383, 'Withdrawing Funds', 174710, to_date('07-09-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (384, 'Withdrawing Funds', 958562, to_date('29-12-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (385, 'deposit', 938400, to_date('06-01-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (386, 'Transferring Funds', 209626, to_date('24-01-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (387, 'deposit', 468084, to_date('10-03-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (388, 'deposit', 842130, to_date('21-01-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (389, 'Transferring Funds', 428157, to_date('12-09-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (390, 'deposit', 252910, to_date('23-05-2004', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (391, 'Transferring Funds', 564044, to_date('08-04-1995', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (392, 'Withdrawing Funds', 143667, to_date('23-02-2008', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (393, 'deposit', 534951, to_date('01-07-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (394, 'Withdrawing Funds', 69880, to_date('18-11-2014', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (395, 'Transferring Funds', 907927, to_date('23-01-2015', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (396, 'deposit', 194906, to_date('04-05-1979', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (397, 'deposit', 716812, to_date('28-04-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (398, 'Transferring Funds', 55216, to_date('20-10-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (399, 'Withdrawing Funds', 122870, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (400, 'deposit', 865331, to_date('21-12-2011', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (401, 'Transferring Funds', 168848, to_date('09-02-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (402, 'Withdrawing Funds', 654607, to_date('06-12-1973', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (403, 'Transferring Funds', 954640, to_date('04-03-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (404, 'Withdrawing Funds', 640845, to_date('10-03-1978', 'dd-mm-yyyy'));
commit;
prompt 404 records loaded
prompt Loading CLIENT...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (1, 'Renana', 'GalgalHamazalot 61,Hod Hashron', 'Shubi');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (2, 'Reut', 'RabiAkiva 11,Bnei Brak', 'Agam');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (3, 'Tehila', 'GalgalHamazalot 61,Hod Hashron', 'Shubi');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (5, 'William', '9 Tustin Street', 'O''Hara');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (6, 'Judd', '36 Overstreet Road', 'Alda');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (7, 'Carol', '906 Juliet', 'Haysbert');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (8, 'Anita', '87 McDonnell Street', 'Tolkan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (9, 'Trick', '35 Edgar Drive', 'Shalhoub');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (10, 'Brian', '797 Delbert Road', 'Pride');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (11, 'Bernard', '48 Edenbridge Street', 'Quinones');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (12, 'Mel', '67 Sarah Street', 'Yorn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (13, 'Sarah', '79 Rockland Street', 'Hatfield');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (14, 'Gil', '4 O''Connor Blvd', 'Almond');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (15, 'Campbell', '52nd Street', 'Harrison');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (16, 'Michelle', '55 McGinley Ave', 'Williamson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (17, 'Henry', '23 Minogue Blvd', 'Aglukark');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (18, 'Domingo', '87 Ciudad del Este Ave', 'Berkoff');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (19, 'Kevin', '26 Clinton', 'Heslov');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (20, 'Kid', '49 Vin Road', 'McCoy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (21, 'Mary', '68 Greene Street', 'Kirshner');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (22, 'Jeffrey', '31 Ving Drive', 'Wilder');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (23, 'Bridget', '90 Foster', 'Loggins');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (24, 'Bette', '50 Short Road', 'Van Shelton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (25, 'Mika', '87 Rundgren Street', 'Griggs');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (26, 'Neneh', '309 Gracie Road', 'Houston');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (27, 'Mike', '88 Gordie Road', 'de Lancie');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (28, 'Jason', '41st Street', 'Emmerich');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (29, 'Gailard', '12 Ryan Drive', 'Randal');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (30, 'Norm', '88 Peine Drive', 'Jeter');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (31, 'Juliana', '31 Hunter Road', 'Saucedo');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (32, 'Goran', '67 Taoyuan Road', 'O''Neal');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (33, 'Miriam', '19 Desmond Drive', 'Krumholtz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (34, 'Rachael', '11 Wahlberg Road', 'Napolitano');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (35, 'Albertina', '13 Ricky Street', 'Crouch');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (36, 'Lili', '36 Zeta-Jones Road', 'Darren');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (37, 'Freddy', '87 Arnold Road', 'Kimball');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (38, 'Marie', '706 McBride Road', 'Noseworthy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (39, 'Lara', '685 Nicosia Blvd', 'Harry');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (40, 'Randy', '30 Saul Road', 'Li');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (41, 'Giancarlo', '827 Quentin Drive', 'Brando');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (42, 'Ryan', '19 Sinise Street', 'Sutherland');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (43, 'Kasey', '33 Willis Road', 'Raybon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (44, 'Saul', '17 Puckett Road', 'Peniston');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (45, 'Laurence', '68 Winterthur Drive', 'Bugnon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (46, 'Kasey', '39 Shearer Road', 'Lauper');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (47, 'Nikki', '21st Street', 'Manning');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (48, 'Cesar', '81 Huntington Beach Drive', 'Ramirez');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (49, 'Timothy', '84 Scaggs Blvd', 'Jackman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (50, 'Rob', '13rd Street', 'Ellis');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (51, 'Graham', '71 Nick Road', 'Keith');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (52, 'Isaiah', '20 Milsap Drive', 'Vinton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (53, 'Beth', '80 Iglesias Blvd', 'Coolidge');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (54, 'Rory', '31 Bronx Drive', 'Chinlund');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (55, 'Sheena', '85 Molina Road', 'Morton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (56, 'Leslie', '63 Keith Blvd', 'Lemmon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (57, 'Benicio', '386 Tom Street', 'Cleese');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (58, 'Jake', '32 Dunaway Road', 'Kleinenberg');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (59, 'Bryan', '32 Benicio Street', 'Hamilton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (60, 'Sharon', '26 Gennevilliers Blvd', 'Sepulveda');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (61, 'Davey', '7 Orlando Road', 'Davison');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (62, 'Brendan', '58 Davy Street', 'Clayton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (63, 'Ani', '135 Joaquin Drive', 'DeGraw');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (64, 'Freddy', '98 Phillips Ave', 'Durning');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (65, 'Ali', '100 Maxwell Road', 'Levine');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (66, 'Courtney', '970 Landau Street', 'Nunn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (67, 'Bobby', '45 Brooke', 'Brosnan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (68, 'Sigourney', '51st Street', 'Donelly');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (69, 'Liv', '45 Gavin', 'Nakai');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (70, 'Collin', '98 Van Helden Street', 'Johansen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (71, 'Clea', '12 Nugent Drive', 'Lawrence');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (72, 'Jesus', '547 Madonna Road', 'Carrack');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (73, 'Regina', '11 Mitchell Road', 'Maguire');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (74, 'Marianne', '671 Buenos Aires Road', 'Bonham');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (75, 'Juliette', '60 Mira Street', 'Boothe');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (76, 'Miles', '2 Ryan Blvd', 'Law');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (77, 'Ashton', '60 Cary Street', 'McDowall');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (78, 'Beverley', '282 Pollak Street', 'Neil');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (79, 'Horace', '34 Robby Road', 'Field');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (80, 'Franz', '752 Feliciano Ave', 'Rockwell');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (81, 'Arnold', '33 Rossellini Street', 'Delta');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (82, 'Joaquim', '44 Frances Drive', 'Fehr');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (83, 'Ving', '70 Cage', 'Cumming');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (84, 'Brad', '406 Holly Road', 'Madonna');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (85, 'Brittany', '62 Reubens Ave', 'Tomei');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (86, 'Stephen', '83 Paul Road', 'Collins');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (87, 'Dianne', '624 Natascha Drive', 'Vassar');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (88, 'Christina', '87 Gavin Blvd', 'Margolyes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (89, 'Annie', '50 Murdock Street', 'Noseworthy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (90, 'Yolanda', '93rd Street', 'Danger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (91, 'Saffron', '72 Archer Street', 'De Almeida');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (92, 'Lari', '51 Sammy Drive', 'Neville');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (93, 'Leon', '30 Pasadena Blvd', 'Mac');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (94, 'William', '62 Phillippe Road', 'Stoltz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (95, 'Stephanie', '44 Lynn Street', 'DeVito');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (96, 'Harrison', '39 Valentin Street', 'Eldard');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (97, 'Mia', '289 Metcalf', 'Colman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (98, 'Molly', '79 Tah Blvd', 'Posener');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (99, 'Lindsey', '555 Myers Ave', 'Stiers');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (100, 'Jodie', '52nd Street', 'Tomei');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (101, 'Jeanne', '43rd Street', 'Holeman');
commit;
prompt 100 records committed...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (102, 'Denny', '26 Trejo Street', 'Alexander');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (103, 'Caroline', '22nd Street', 'Kutcher');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (104, 'Allison', '12nd Street', 'O''Neill');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (105, 'Selma', '59 Harris Ave', 'Pride');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (106, 'Allison', '70 Rains Road', 'Berry');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (107, 'Taryn', '64 Atkinson', 'Snow');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (108, 'Ann', '68 Edward Road', 'Channing');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (109, 'Irene', '16 Houma Ave', 'Stigers');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (110, 'Jean-Claude', '17 Barbara Drive', 'Mantegna');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (111, 'Annie', '12 Copenhagen Road', 'Llewelyn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (112, 'Lance', '93 Ribeirao preto Street', 'Giraldo');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (113, 'Freda', '3 Padova Road', 'Furay');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (114, 'Judd', '94 Chicago Drive', 'Head');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (115, 'Jet', '81 Mykelti', 'Jonze');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (116, 'Tori', '73 Noseworthy Street', 'Young');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (117, 'Lara', '84 Newton Street', 'Law');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (118, 'Tracy', '95 Summer Street', 'Phifer');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (119, 'Andre', '721 Lewin Ave', 'Culkin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (120, 'Rosie', '14 Sandoval Road', 'Fraser');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (121, 'Warren', '50 Cole Road', 'Suchet');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (122, 'Domingo', '93 Harsum Drive', 'Myles');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (123, 'Willem', '40 Lineback Road', 'Vassar');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (124, 'Gladys', '865 Braugher Road', 'Elwes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (125, 'Herbie', '52nd Street', 'Aiken');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (126, 'Dan', '32nd Street', 'Van Shelton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (127, 'Gladys', '66 Laws Road', 'Simpson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (128, 'Gin', '33 McKennitt Road', 'McClinton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (129, 'Cole', '782 Burns Road', 'Cook');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (130, 'Hazel', '73 Graham Street', 'Torino');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (131, 'Scarlett', '31 Wakeling Ave', 'Jordan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (132, 'Donal', '321 Matt Drive', 'Carnes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (133, 'Garland', '68 Peter Drive', 'O''Keefe');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (134, 'Alessandro', '488 Carnes Road', 'Penders');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (135, 'Howard', '95 Pierce Street', 'Silverman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (136, 'Frankie', '63rd Street', 'Rauhofer');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (137, 'Fats', '878 Sartain Street', 'Rucker');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (138, 'Cheech', '92 Shalhoub Street', 'Howard');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (139, 'Ozzy', '52nd Street', 'Penders');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (140, 'Andrew', '579 Franz Road', 'Viterelli');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (141, 'Leelee', '283 Crudup', 'Kidman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (142, 'Brothers', '87 Marlon Street', 'Wilder');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (143, 'Queen', '12nd Street', 'Jordan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (144, 'Patty', '113 Curtis-Hall', 'Emmerich');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (145, 'Famke', '165 Thurman Street', 'Bridges');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (146, 'Belinda', '38 Hudson', 'Watson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (147, 'Eric', '19 Bean Road', 'Weber');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (148, 'Mae', '55 Cusack Road', 'Lang');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (149, 'Rodney', '79 Wayans Ave', 'Hawn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (150, 'Roscoe', '13rd Street', 'Chaykin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (151, 'Mary', '93 Bekescsaba', 'Copeland');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (152, 'Goran', '83rd Street', 'Lillard');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (153, 'Tracy', '10 Miriam Road', 'Slater');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (154, 'Charles', '26 Lancaster Ave', 'Child');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (155, 'Nancy', '593 Weiland Road', 'Akins');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (156, 'Alana', '52nd Street', 'Nelligan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (157, 'Lydia', '41st Street', 'Hayek');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (158, 'Alfie', '67 Earl Ave', 'Lerner');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (159, 'Paul', '5 Don Road', 'Jones');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (160, 'Jason', '10 Lublin Street', 'Tyler');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (161, 'Colin', '86 Cape town Drive', 'DiBiasio');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (162, 'Morgan', '70 Sheena Road', 'Wiest');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (163, 'Temuera', '66 Apple Road', 'Assante');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (164, 'Rupert', '43 Vejle Street', 'Cooper');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (165, 'Benjamin', '84 DiFranco Road', 'Flatts');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (166, 'Ray', '52nd Street', 'Boone');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (167, 'Ernie', '53 Vaughn Blvd', 'Reid');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (168, 'Darren', '801 Andre Drive', 'Alexander');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (169, 'Hex', '42 Heston Blvd', 'Condition');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (170, 'Hilton', '71st Street', 'Drive');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (171, 'Gran', '94 Lawrence Blvd', 'Venora');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (172, 'Rod', '82 Joshua Road', 'Guzman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (173, 'Barry', '57 Burns Ave', 'Tilly');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (174, 'Larenz', '80 Johor Bahru Blvd', 'Harary');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (175, 'Vertical', '838 Rio Ave', 'Diehl');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (176, 'Eileen', '728 Wariner Street', 'Buckingham');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (177, 'Shannyn', '77 Singletary Blvd', 'Allen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (178, 'Timothy', '73 Rizzo Ave', 'Wong');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (179, 'Giovanni', '487 Tinsley Drive', 'Cruz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (180, 'Temuera', '55 McCain Street', 'Pastore');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (181, 'Lara', '253 Merle Drive', 'Paquin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (182, 'Geraldine', '52nd Street', 'Smurfit');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (183, 'Jay', '3 Rueil-Malmaison', 'Myers');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (184, 'Fisher', '671 Prague Street', 'Kramer');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (185, 'Miguel', '12nd Street', 'Whitford');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (186, 'Angela', '29 Nils Road', 'Webb');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (187, 'Greg', '204 Tsettos Drive', 'Chaplin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (188, 'James', '39 Williams Road', 'Streep');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (189, 'Art', '11 Ferrell Road', 'Khan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (190, 'Annie', '78 Connery Ave', 'Daniels');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (191, 'Howie', '17 Boucherville Ave', 'Roundtree');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (192, 'Shannyn', '80 Sarasota', 'Bentley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (193, 'Maceo', '41 Chemnitz Street', 'Mueller-Stahl');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (194, 'Giancarlo', '13 Armin Ave', 'Spall');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (195, 'Tal', '77 Santiago Street', 'Schiavelli');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (196, 'Ryan', '94 Cash Ave', 'Conley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (197, 'Robert', '26 Gaby Street', 'Secada');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (198, 'Curt', '254 Debbie Road', 'Garr');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (199, 'Embeth', '18 Cyndi', 'Brolin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (200, 'Kenny', '50 Elisabeth Road', 'Keen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (201, 'Jeremy', '39 Joanna Drive', 'Kattan');
commit;
prompt 200 records committed...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (202, 'Shannon', '70 Gilliam Street', 'Dillon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (203, 'Campbell', '68 Leigh Drive', 'Gooding');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (204, 'Maggie', '652 Altamonte Springs Drive', 'Bradford');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (205, 'Karen', '3 Lloyd Drive', 'Sisto');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (206, 'Juan', '63 Luongo Road', 'Lorenz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (207, 'Candice', '5 Hannover Street', 'Burton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (208, 'Natasha', '38 Tobey Drive', 'Pearce');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (209, 'Elvis', '94 McDiarmid', 'Lucien');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (210, 'Jimmy', '47 Diesel Ave', 'Ojeda');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (211, 'Andrea', '53 Isaiah', 'Basinger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (212, 'Willie', '57 Louise Street', 'Stallone');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (213, 'Gina', '83 Luedenscheid Road', 'Duchovny');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (214, 'Trace', '87 North Yorkshire Drive', 'Tinsley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (215, 'Ralph', '32nd Street', 'Macy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (216, 'Orlando', '76 Burmester Street', 'Unger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (217, 'Taryn', '71 Lexington Street', 'Broderick');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (218, 'Cameron', '21 Duschel Road', 'Gleeson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (219, 'Carrie', '99 Bandy Street', 'Santana');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (220, 'Taye', '23rd Street', 'Sledge');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (221, 'Mac', '197 Harper Road', 'Ramirez');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (222, 'Penelope', '89 Casselberry Street', 'McCann');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (223, 'Candice', '70 Woodward Road', 'Greenwood');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (224, 'Jennifer', '1 Arnold Street', 'Kadison');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (225, 'Phil', '40 Kingsley Street', 'Rucker');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (226, 'Talvin', '32 Biggs Road', 'Weisz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (227, 'Jeffrey', '33 Giancarlo Street', 'Tate');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (228, 'Collin', '13 Dean Road', 'Kirkwood');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (229, 'Mark', '59 Whitman', 'Houston');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (230, 'Trick', '926 Corey Drive', 'Weiland');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (231, 'Mitchell', '40 Bob Street', 'Shawn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (232, 'Deborah', '74 Bandy Drive', 'Melvin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (233, 'Janice', '89 Li Street', 'Steagall');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (234, 'Jim', '15 Shenzhen Blvd', 'Frost');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (235, 'Kimberly', '71 Flack Road', 'Tate');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (236, 'Robbie', '715 Chung Street', 'Witt');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (237, 'Ivan', '34 San Francisco Road', 'Schreiber');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (238, 'Machine', '67 Chris Street', 'Wincott');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (239, 'Hilary', '72 Debary', 'Strathairn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (240, 'Vern', '82 Percy Drive', 'Unger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (241, 'Dylan', '561 Emmett Road', 'Moffat');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (242, 'Laura', '38 Oded Street', 'Balaban');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (243, 'Natacha', '62nd Street', 'Steenburgen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (244, 'Jena', '35 Sal Road', 'Kelly');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (245, 'Taylor', '90 Carrington Road', 'Harnes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (246, 'Wayman', '616 Nigel Drive', 'Schiavelli');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (247, 'Fred', '58 Rucker', 'Cromwell');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (248, 'Joy', '72nd Street', 'Connelly');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (249, 'Famke', '88 Québec Street', 'Minogue');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (250, 'Roy', '85 Coughlan', 'Andrews');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (251, 'Solomon', '46 Cox Drive', 'Reeve');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (252, 'Alicia', '92nd Street', 'Sawa');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (253, 'Joshua', '13 Micky', 'Thornton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (254, 'Geena', '72 Roger Road', 'Branch');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (255, 'Gran', '20 Davis Street', 'Springfield');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (256, 'Kurtwood', '40 Monk Road', 'Galecki');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (257, 'Lea', '84 Pat Drive', 'Arden');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (258, 'Natalie', '65 La Plata Road', 'Cartlidge');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (259, 'Bill', '7 Randy Drive', 'Melvin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (260, 'Morris', '4 Alfred Street', 'Myers');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (261, 'Kyra', '5 Curtis Ave', 'Remar');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (262, 'Brendan', '285 Rockwell Road', 'Cartlidge');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (263, 'Vivica', '20 Lake Forest Drive', 'Roy Parnell');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (264, 'Denise', '153 Brickell Street', 'Perry');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (265, 'Ramsey', '11 Mechelen Road', 'Rifkin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (266, 'Roberta', '19 Gladys Road', 'Fierstein');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (267, 'Ralph', '3 Oxon Road', 'Oates');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (268, 'Ruth', '22 Avon Blvd', 'Houston');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (269, 'Sheryl', '78 Granada Hills Road', 'Hagerty');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (270, 'Winona', '87 Magstadt', 'Astin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (271, 'Willie', '79 Ned', 'Gellar');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (272, 'Lily', '4 Casey Drive', 'Sisto');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (273, 'Merillee', '31st Street', 'Bachman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (274, 'Taye', '31 Suzanne Drive', 'Nolte');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (275, 'Gwyneth', '72 Richter Road', 'Ali');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (276, 'Darren', '988 Jeter Drive', 'Russell');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (277, 'Goldie', '174 Woods Street', 'Sherman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (278, 'Harry', '9 Tisdale Drive', 'Tyler');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (279, 'Vincent', '93 Langella Street', 'Bachman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (280, 'Davey', '56 Charlize', 'Wahlberg');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (281, 'Swoosie', '854 Hopper Street', 'Hubbard');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (282, 'Daniel', '55 Kingsley Blvd', 'Dolenz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (283, 'Wendy', '8 Gavin Street', 'Hauser');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (284, 'Fats', '75 Sammy Drive', 'Kelly');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (285, 'Selma', '70 Stiers Street', 'Wine');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (286, 'Nastassja', '325 Steven Blvd', 'McElhone');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (287, 'Kylie', '10 Stiller Street', 'Cox');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (288, 'Robin', '81 Colon Street', 'Tinsley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (289, 'Clarence', '21 Thomas Street', 'McGregor');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (290, 'Maceo', '17 Rosco Road', 'Richter');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (291, 'Elizabeth', '21 Deborah Road', 'Skerritt');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (292, 'George', '541 Wiedlin Street', 'Mraz');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (293, 'Kimberly', '68 Zwolle Street', 'Quatro');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (294, 'Davy', '4 Kilmer Street', 'Vanian');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (295, 'Nile', '74 Donal', 'Voight');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (296, 'Charles', '79 Stanley Blvd', 'Beck');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (297, 'Maxine', '824 LaMond Street', 'Thurman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (298, 'Rich', '31st Street', 'DiBiasio');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (299, 'Sandra', '29 Duluth Blvd', 'Jackman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (300, 'Miranda', '4 Pryce Blvd', 'Richards');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (301, 'Hal', '100 Vertical Street', 'Keith');
commit;
prompt 300 records committed...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (302, 'LeVar', '57 Carlisle Drive', 'Jeter');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (303, 'Carol', '38 Noseworthy Drive', 'Barkin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (304, 'Delbert', '15 Danes Ave', 'Pearce');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (305, 'Miko', '21 Ravensburg Street', 'Rain');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (306, 'Simon', '51 Rio', 'O''Hara');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (307, 'Gavin', '12 Gray Road', 'LaSalle');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (308, 'Belinda', '53 Francis Street', 'Neville');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (309, 'Gin', '38 Lemmon Drive', 'Tinsley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (310, 'Emma', '260 Waldbronn Road', 'Danger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (311, 'Linda', '87 Ravensburg Street', 'Hatchet');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (312, 'Rich', '26 McGill Street', 'Sainte-Marie');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (313, 'Guy', '7 Lightfoot Road', 'Creek');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (314, 'Veruca', '19 Peachtree City Road', 'Piven');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (315, 'Fiona', '71st Street', 'Elwes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (316, 'Jake', '325 Redgrave Street', 'Holland');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (317, 'Dom', '73 Angie Road', 'Kleinenberg');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (318, 'Rachael', '58 Treviso Road', 'Waite');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (319, 'Dean', '999 Hatchet Road', 'Gibson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (320, 'Pam', '90 Ashland Road', 'Berkley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (321, 'Jonny Lee', '569 Darmstadt Road', 'Van Shelton');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (322, 'Rick', '16 Buffalo', 'Hunt');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (323, 'Maceo', '8 Eugene Road', 'Benet');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (324, 'Ron', '94 Thame', 'Redford');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (325, 'Courtney', '81 Lübeck Drive', 'Owen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (326, 'Vendetta', '41st Street', 'Edmunds');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (327, 'Brittany', '39 Duluth Street', 'Rhodes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (328, 'Nik', '67 Kansas City Street', 'Deschanel');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (329, 'Matthew', '72 Brampton Road', 'Brolin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (330, 'Tony', '92 Kahn Road', 'Cockburn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (331, 'Teena', '58 Jamal Street', 'Branch');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (332, 'Mandy', '98 Delta Road', 'Bancroft');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (333, 'Simon', '87 Tomei Street', 'Jackman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (334, 'Mac', '50 Graham Road', 'Geldof');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (335, 'Natacha', '84 Badalucco Road', 'Shandling');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (336, 'Ernest', '1 Paderborn Road', 'Sheen');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (337, 'Kitty', '62nd Street', 'Fariq');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (338, 'Derrick', '496 Pétion-ville Road', 'Dunaway');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (339, 'Bret', '97 Elijah Drive', 'Bragg');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (340, 'Rosanne', '94 Reid Street', 'Chaplin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (341, 'Delbert', '52nd Street', 'de Lancie');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (342, 'Lin', '88 St Jean de Soudain Road', 'Day');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (343, 'Ritchie', '648 McKellen Road', 'Richter');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (344, 'Delroy', '54 Reno Street', 'Purefoy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (345, 'Dick', '519 Arthur Road', 'Channing');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (346, 'Kieran', '49 Goodall Street', 'Chestnut');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (347, 'Gwyneth', '432 Joely', 'Santana');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (348, 'Geoff', '823 Geggy Road', 'Sorvino');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (349, 'Lara', '932 Suzi Street', 'Merchant');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (350, 'Dianne', '39 Eder Street', 'Bachman');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (351, 'Elijah', '37 Cerritos Street', 'James');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (352, 'Jake', '481 Perlman Road', 'Holiday');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (353, 'Kyra', '8 D''Onofrio Ave', 'Pitney');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (354, 'Chazz', '67 Boulder Road', 'Bratt');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (355, 'David', '23 Lunch Blvd', 'Heron');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (356, 'Franco', '42 Omaha Road', 'Matthau');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (357, 'Dwight', '77 Albert Road', 'Farrell');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (358, 'Jose', '93 Birmensdorf Road', 'Nelson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (359, 'Earl', '8 Kay Road', 'Bosco');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (360, 'Austin', '902 Harriet Blvd', 'O''Hara');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (361, 'Phoebe', '905 Parish', 'Arquette');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (362, 'Jimmie', '393 Carter Drive', 'Flanagan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (363, 'Hazel', '14 Moreno Street', 'Stiers');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (364, 'Jennifer', '87 Sigourney Drive', 'MacDonald');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (365, 'Manu', '1 Ankara Street', 'Franklin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (366, 'Dylan', '33rd Street', 'Darren');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (367, 'Penelope', '13 Zooey Blvd', 'Pigott-Smith');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (368, 'Jake', '86 Nigel Road', 'Parsons');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (369, 'Breckin', '44 Garcia Drive', 'Shatner');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (370, 'Mac', '81 Rodney Street', 'Close');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (371, 'Percy', '248 Pleasure Street', 'Johansson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (372, 'Thelma', '3 Duke Street', 'Thompson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (373, 'Neve', '93 Leverkusen Ave', 'Liu');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (374, 'Christopher', '282 Elche Road', 'Mirren');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (375, 'Kimberly', '55 Dafoe Road', 'Kennedy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (376, 'Kimberly', '172 Waldorf Street', 'Boyle');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (377, 'Vendetta', '86 Gettysburg', 'Bradford');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (378, 'Mint', '21 Kelly Street', 'Redford');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (379, 'Mia', '46 Franklin Road', 'Kirkwood');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (380, 'Leonardo', '83 Shatner Drive', 'Chaykin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (381, 'Eugene', '75 McGowan Road', 'Gill');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (382, 'Burt', '349 Piven Street', 'Soul');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (383, 'Michael', '36 Susan', 'Jolie');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (384, 'Danny', '288 Ramsey Road', 'Idle');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (385, 'Hector', '19 Turku Road', 'Sevenfold');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (386, 'Cathy', '83 Epps Road', 'Rapaport');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (387, 'Jennifer', '95 Ingram Blvd', 'Spector');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (388, 'Petula', '362 McGoohan Road', 'Fishburne');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (389, 'Joey', '18 Kramer Ave', 'Stanley');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (390, 'Nanci', '89 Stevens Ave', 'Berry');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (391, 'Vondie', '358 Saffron Drive', 'Broza');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (392, 'Nigel', '14 Alfie Drive', 'Richardson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (393, 'Alan', '19 Ali', 'Tanon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (394, 'Julianne', '439 Payton Road', 'O''Connor');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (395, 'Courtney', '68 Cuenca Street', 'Hughes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (396, 'Clay', '98 Pitt Street', 'Brown');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (397, 'Vienna', '21 Armatrading Road', 'Reno');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (398, 'Melba', '493 Stiers Street', 'Nelson');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (399, 'Lindsay', '63 Hoffman Street', 'Pryce');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (400, 'Betty', '66 Donald Ave', 'Duvall');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (401, 'Humberto', '658 Lari Street', 'O''Sullivan');
commit;
prompt 400 records committed...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (402, 'Lenny', '53 Bale Street', 'Neill');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (403, 'Wes', '73 Mitra Ave', 'Carlisle');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (404, 'Zooey', '53 Dunn loring Road', 'Knight');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (405, 'Roger', '682 Dreyfuss Road', 'Church');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (406, 'Dianne', '87 Beck Street', 'Spears');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (407, 'Christopher', '74 Allison Blvd', 'Pryce');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (408, 'Vince', '40 Pusan-city', 'Kweller');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (409, 'Loreena', '46 Charles Blvd', 'Osbourne');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (410, 'Brenda', '41 Rosario', 'McCoy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (411, 'Sam', '60 Kenneth Drive', 'Scaggs');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (412, 'Judi', '11 Grand-mere Blvd', 'Scaggs');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (413, 'Cheech', '44 Dutton Ave', 'Washington');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (414, 'Tea', '340 Foley', 'Flanagan');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (415, 'Leon', '40 Charlize Street', 'Santa Rosa');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (416, 'Nicky', '880 Joli Street', 'Kotto');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (417, 'Mos', '66 Tippe Road', 'Callow');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (418, 'Micky', '32 Victor', 'Torn');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (419, 'Lance', '44 Sam Drive', 'Lofgren');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (420, 'Albert', '18 Bates Street', 'Rifkin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (421, 'Bobby', '26 Wakayama Drive', 'Randal');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (422, 'James', '43 Diamond Road', 'Harary');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (423, 'Jack', '59 Exeter Ave', 'Stone');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (424, 'Joy', '884 Massagno Ave', 'Pitney');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (425, 'Miki', '19 Kapanka Drive', 'Gore');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (426, 'Talvin', '55 Esposito Ave', 'Van Helden');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (427, 'Marisa', '32 McIntosh', 'Marin');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (428, 'Jena', '531 Harris Road', 'Neuwirth');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (429, 'Suzanne', '55 Arnold Street', 'Ali');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (430, 'Morris', '392 Dwight Street', 'Christie');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (431, 'Trace', '88 Kanata Street', 'Cassidy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (432, 'Boz', '82 Mapo-gu Road', 'Bosco');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (433, 'Buddy', '38 St Leonards', 'Smith');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (434, 'Ewan', '238 Sandoval Road', 'Lunch');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (435, 'Austin', '64 Kristin Street', 'Griffiths');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (436, 'Rich', '18 Mann Street', 'Rourke');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (437, 'Denise', '16 Fonda Blvd', 'McCabe');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (438, 'Louise', '75 Gabriel Road', 'Macy');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (439, 'Quentin', '86 Dzundza', 'Tankard');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (440, 'Denzel', '32 Weisberg Road', 'DiFranco');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (441, 'Davey', '41 Hobson Road', 'Waits');
commit;
prompt 440 records loaded
prompt Loading ACTIVITY...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (1, 389, 190, 2, 203);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (2, 91, 158, 1, 12);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (3, 415, 162, 2, 233);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (4, 178, 298, 4, 395);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (5, 417, 290, 4, 309);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (6, 251, 312, 2, 20);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (7, 11, 151, 1, 339);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (8, 31, 336, 4, 382);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (9, 350, 110, 3, 389);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (10, 25, 119, 2, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (11, 190, 65, 2, 185);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (12, 119, 204, 3, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (13, 320, 376, 2, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (14, 382, 390, 4, 393);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (15, 94, 94, 1, 342);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (16, 146, 346, 4, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (17, 150, 162, 3, 130);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (18, 190, 358, 2, 57);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (19, 327, 283, 3, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (20, 115, 171, 4, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (21, 232, 354, 3, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (22, 143, 386, 2, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (23, 292, 5, 4, 169);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (24, 306, 351, 1, 160);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (25, 181, 293, 2, 199);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (26, 100, 215, 2, 274);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (27, 362, 256, 3, 344);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (28, 369, 277, 4, 401);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (29, 130, 74, 2, 108);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (30, 373, 60, 2, 320);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (31, 91, 299, 3, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (32, 170, 346, 1, 123);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (33, 259, 15, 2, 30);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (34, 380, 72, 3, 353);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (35, 389, 364, 1, 242);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (36, 213, 230, 1, 48);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (37, 330, 126, 1, 110);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (38, 377, 215, 4, 374);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (39, 413, 310, 3, 375);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (40, 283, 358, 1, 85);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (41, 98, 388, 1, 156);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (42, 116, 140, 3, 221);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (43, 179, 309, 2, 86);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (44, 305, 175, 2, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (45, 164, 221, 4, 120);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (46, 129, 269, 2, 47);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (47, 96, 313, 4, 86);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (48, 315, 40, 3, 188);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (49, 189, 382, 2, 176);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (50, 386, 56, 4, 395);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (51, 58, 333, 2, 131);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (52, 431, 286, 3, 347);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (53, 182, 3, 2, 387);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (54, 266, 279, 3, 251);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (55, 297, 312, 3, 307);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (56, 386, 290, 1, 148);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (57, 38, 109, 2, 381);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (58, 292, 94, 3, 358);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (59, 32, 404, 2, 306);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (60, 382, 365, 1, 231);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (61, 388, 255, 4, 231);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (62, 337, 131, 1, 55);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (63, 88, 39, 4, 302);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (64, 180, 17, 2, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (65, 370, 16, 3, 131);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (66, 43, 357, 3, 185);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (67, 221, 220, 3, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (68, 397, 246, 1, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (69, 246, 77, 2, 65);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (70, 112, 348, 1, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (71, 418, 167, 2, 226);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (72, 271, 183, 2, 32);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (73, 48, 78, 4, 287);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (74, 77, 377, 4, 130);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (75, 423, 15, 4, 378);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (76, 281, 199, 2, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (77, 436, 115, 2, 183);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (78, 33, 73, 4, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (79, 154, 289, 3, 317);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (80, 357, 163, 2, 105);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (81, 28, 199, 2, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (82, 176, 318, 1, 229);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (83, 113, 156, 2, 143);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (84, 289, 122, 3, 290);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (85, 213, 137, 2, 354);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (86, 327, 294, 3, 246);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (87, 40, 131, 1, 87);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (88, 144, 175, 4, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (89, 286, 212, 2, 198);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (90, 351, 179, 2, 296);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (91, 203, 334, 2, 183);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (92, 238, 347, 4, 158);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (93, 53, 248, 1, 225);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (94, 126, 218, 1, 113);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (95, 55, 360, 1, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (96, 226, 60, 3, 339);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (97, 253, 289, 3, 262);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (98, 399, 190, 2, 328);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (99, 402, 372, 3, 29);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (100, 395, 26, 3, 164);
commit;
prompt 100 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (101, 325, 76, 2, 134);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (102, 112, 90, 3, 113);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (103, 297, 159, 3, 354);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (104, 321, 98, 2, 130);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (105, 139, 124, 2, 135);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (106, 344, 5, 2, 99);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (107, 94, 228, 1, 107);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (108, 155, 363, 2, 3);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (109, 415, 393, 4, 299);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (110, 313, 389, 4, 13);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (111, 99, 56, 2, 284);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (112, 158, 197, 2, 100);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (113, 49, 153, 3, 73);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (114, 436, 323, 2, 379);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (115, 103, 393, 2, 115);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (116, 235, 169, 4, 160);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (117, 49, 287, 4, 8);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (118, 101, 213, 2, 166);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (119, 233, 306, 1, 377);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (120, 348, 294, 2, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (121, 426, 336, 4, 217);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (122, 275, 53, 2, 97);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (123, 47, 282, 2, 236);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (124, 44, 308, 4, 293);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (125, 168, 391, 3, 48);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (126, 399, 104, 4, 300);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (127, 266, 86, 4, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (128, 193, 358, 4, 35);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (129, 289, 161, 4, 180);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (130, 123, 362, 1, 386);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (131, 103, 249, 1, 332);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (132, 316, 59, 1, 39);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (133, 288, 57, 2, 275);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (134, 155, 30, 4, 328);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (135, 322, 323, 3, 12);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (136, 320, 392, 4, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (137, 314, 258, 1, 264);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (138, 33, 221, 2, 138);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (139, 124, 375, 3, 348);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (140, 31, 346, 1, 233);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (141, 265, 183, 3, 21);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (142, 303, 193, 2, 344);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (143, 203, 52, 4, 49);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (144, 44, 23, 3, 82);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (145, 195, 380, 2, 248);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (146, 283, 52, 2, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (147, 79, 69, 1, 309);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (148, 377, 108, 2, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (149, 291, 386, 1, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (150, 245, 221, 2, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (151, 268, 62, 3, 24);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (152, 3, 126, 3, 120);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (153, 401, 211, 4, 194);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (154, 59, 103, 4, 174);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (155, 55, 82, 2, 324);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (156, 348, 335, 2, 342);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (157, 13, 214, 2, 64);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (158, 51, 378, 2, 19);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (159, 111, 59, 2, 190);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (160, 410, 391, 2, 279);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (161, 420, 172, 1, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (162, 92, 49, 1, 370);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (163, 257, 86, 4, 179);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (164, 265, 26, 1, 210);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (165, 298, 358, 3, 42);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (166, 15, 355, 4, 381);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (167, 324, 287, 1, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (168, 155, 138, 4, 9);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (169, 75, 211, 1, 27);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (170, 22, 202, 2, 256);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (171, 123, 290, 1, 146);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (172, 18, 235, 1, 27);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (173, 147, 225, 4, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (174, 220, 76, 1, 111);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (175, 297, 313, 2, 74);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (176, 342, 334, 2, 362);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (177, 406, 208, 3, 249);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (178, 154, 300, 4, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (179, 93, 228, 4, 177);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (180, 380, 25, 4, 125);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (181, 219, 368, 1, 241);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (182, 96, 102, 4, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (183, 415, 243, 1, 302);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (184, 319, 362, 3, 348);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (185, 152, 377, 2, 290);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (186, 141, 314, 2, 133);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (187, 279, 374, 2, 304);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (188, 374, 107, 1, 10);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (189, 191, 55, 4, 232);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (190, 179, 16, 1, 291);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (191, 302, 314, 2, 116);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (192, 322, 41, 3, 169);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (193, 147, 53, 1, 19);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (194, 303, 45, 1, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (195, 34, 121, 4, 236);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (196, 349, 13, 4, 383);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (197, 75, 105, 3, 204);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (198, 351, 39, 4, 78);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (199, 135, 87, 2, 178);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (200, 152, 28, 2, 11);
commit;
prompt 200 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (201, 242, 119, 3, 396);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (202, 307, 335, 3, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (203, 145, 210, 2, 171);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (204, 221, 114, 2, 306);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (205, 221, 50, 4, 145);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (206, 282, 222, 2, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (207, 213, 66, 3, 18);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (208, 59, 204, 1, 41);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (209, 185, 177, 4, 237);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (210, 45, 241, 3, 390);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (211, 196, 300, 1, 388);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (212, 352, 3, 1, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (213, 436, 166, 2, 332);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (214, 310, 40, 1, 378);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (215, 68, 76, 1, 57);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (216, 299, 79, 3, 405);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (217, 61, 162, 4, 262);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (218, 78, 265, 4, 388);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (219, 331, 182, 2, 33);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (220, 231, 115, 2, 219);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (221, 423, 252, 1, 107);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (222, 119, 11, 2, 114);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (223, 230, 77, 1, 394);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (224, 255, 404, 2, 18);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (225, 292, 344, 3, 264);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (226, 313, 333, 3, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (227, 366, 187, 4, 362);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (228, 235, 106, 3, 263);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (229, 222, 39, 1, 315);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (230, 58, 77, 2, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (231, 27, 162, 4, 402);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (232, 197, 349, 3, 202);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (233, 318, 118, 4, 315);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (234, 3, 201, 2, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (235, 239, 371, 2, 279);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (236, 307, 69, 2, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (237, 211, 400, 2, 60);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (238, 265, 11, 4, 12);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (239, 222, 152, 3, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (240, 401, 324, 3, 240);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (241, 352, 17, 4, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (242, 392, 265, 2, 278);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (243, 441, 116, 1, 393);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (244, 398, 129, 3, 318);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (245, 223, 118, 3, 351);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (246, 225, 223, 3, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (247, 377, 402, 1, 158);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (248, 271, 370, 2, 201);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (249, 69, 105, 2, 271);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (250, 305, 345, 4, 138);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (251, 261, 149, 4, 180);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (252, 24, 39, 2, 269);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (253, 430, 333, 1, 51);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (254, 88, 145, 2, 104);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (255, 168, 192, 4, 275);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (256, 97, 152, 1, 139);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (257, 357, 374, 1, 130);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (258, 117, 89, 3, 370);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (259, 426, 116, 2, 8);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (260, 28, 388, 2, 366);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (261, 20, 94, 2, 333);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (262, 233, 250, 3, 63);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (263, 271, 143, 4, 395);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (264, 177, 177, 2, 86);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (265, 243, 342, 1, 353);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (266, 430, 188, 4, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (267, 18, 202, 1, 328);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (268, 383, 185, 4, 332);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (269, 277, 399, 1, 226);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (270, 385, 33, 3, 165);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (271, 156, 202, 1, 300);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (272, 375, 175, 2, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (273, 410, 269, 1, 10);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (274, 312, 356, 1, 125);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (275, 438, 318, 4, 51);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (276, 185, 84, 2, 270);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (277, 182, 159, 2, 257);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (278, 55, 29, 2, 384);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (279, 293, 46, 3, 260);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (280, 122, 311, 2, 49);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (281, 118, 342, 1, 74);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (282, 379, 134, 2, 203);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (283, 122, 105, 1, 197);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (284, 299, 368, 3, 270);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (285, 375, 234, 2, 24);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (286, 303, 201, 2, 69);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (287, 386, 289, 2, 223);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (288, 175, 378, 2, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (289, 283, 277, 2, 184);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (290, 152, 105, 1, 149);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (291, 264, 145, 3, 249);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (292, 277, 138, 1, 398);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (293, 71, 204, 3, 219);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (294, 213, 341, 1, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (295, 258, 64, 1, 217);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (296, 419, 202, 2, 381);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (297, 400, 122, 1, 264);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (298, 261, 280, 3, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (299, 414, 343, 3, 176);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (300, 115, 143, 1, 300);
commit;
prompt 300 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (301, 141, 386, 1, 198);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (302, 419, 69, 3, 196);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (303, 287, 253, 2, 355);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (304, 307, 42, 4, 214);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (305, 300, 261, 4, 117);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (306, 242, 93, 3, 344);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (307, 239, 334, 1, 29);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (308, 261, 357, 4, 5);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (309, 35, 220, 4, 10);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (310, 19, 48, 4, 254);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (311, 89, 252, 3, 20);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (312, 177, 189, 1, 262);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (313, 149, 202, 2, 236);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (314, 297, 20, 1, 188);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (315, 405, 288, 1, 347);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (316, 285, 380, 4, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (317, 419, 291, 3, 390);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (318, 100, 365, 1, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (319, 277, 402, 4, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (320, 374, 160, 3, 22);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (321, 12, 189, 1, 183);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (322, 416, 367, 3, 305);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (323, 371, 106, 1, 131);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (324, 206, 248, 4, 65);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (325, 95, 302, 1, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (326, 214, 132, 4, 362);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (327, 260, 363, 4, 334);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (328, 370, 308, 3, 186);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (329, 290, 398, 4, 211);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (330, 375, 58, 3, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (331, 157, 224, 4, 85);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (332, 50, 29, 4, 386);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (333, 404, 294, 2, 340);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (334, 143, 306, 1, 318);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (335, 5, 337, 4, 162);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (336, 84, 213, 4, 210);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (337, 403, 128, 1, 48);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (338, 178, 269, 3, 135);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (339, 336, 401, 3, 184);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (340, 291, 226, 4, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (341, 382, 238, 1, 377);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (342, 332, 61, 2, 317);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (343, 36, 250, 1, 306);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (344, 324, 292, 2, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (345, 103, 223, 4, 109);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (346, 55, 392, 1, 102);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (347, 281, 128, 3, 81);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (348, 86, 161, 3, 166);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (349, 282, 34, 3, 297);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (350, 135, 15, 2, 365);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (351, 111, 162, 4, 156);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (352, 141, 187, 2, 5);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (353, 365, 247, 4, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (354, 24, 50, 4, 38);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (355, 360, 237, 2, 322);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (356, 363, 401, 3, 286);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (357, 256, 323, 1, 234);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (358, 13, 213, 1, 247);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (359, 109, 269, 3, 400);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (360, 355, 379, 2, 217);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (361, 295, 97, 3, 355);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (362, 328, 313, 3, 327);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (363, 179, 80, 2, 318);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (364, 295, 332, 2, 295);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (365, 349, 58, 1, 205);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (366, 214, 123, 3, 336);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (367, 24, 86, 1, 187);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (368, 33, 168, 3, 360);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (369, 221, 6, 4, 367);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (370, 117, 60, 4, 319);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (371, 340, 352, 3, 375);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (372, 382, 178, 3, 71);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (373, 66, 144, 1, 103);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (374, 331, 256, 1, 380);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (375, 405, 72, 1, 370);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (376, 9, 99, 2, 201);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (377, 363, 138, 2, 260);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (378, 91, 21, 4, 360);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (379, 243, 263, 3, 69);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (380, 250, 199, 1, 282);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (381, 128, 205, 4, 109);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (382, 186, 146, 3, 310);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (383, 161, 9, 3, 262);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (384, 242, 343, 3, 299);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (385, 403, 181, 3, 255);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (386, 293, 350, 1, 168);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (387, 283, 370, 3, 275);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (388, 415, 276, 3, 364);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (389, 273, 199, 2, 283);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (390, 267, 366, 3, 238);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (391, 77, 218, 3, 71);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (392, 261, 297, 3, 384);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (393, 356, 161, 1, 47);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (394, 115, 222, 2, 51);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (395, 93, 150, 3, 328);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (396, 75, 328, 4, 139);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (397, 136, 14, 3, 157);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (398, 409, 109, 1, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (399, 173, 342, 2, 85);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (400, 40, 194, 4, 167);
commit;
prompt 400 records loaded
prompt Loading LOAN...
insert into LOAN (loanid, numofpaymet, loansum)
values (1, 6, 130712);
insert into LOAN (loanid, numofpaymet, loansum)
values (2, 8, 108788);
insert into LOAN (loanid, numofpaymet, loansum)
values (3, 5, 816539);
insert into LOAN (loanid, numofpaymet, loansum)
values (4, 12, 25098);
insert into LOAN (loanid, numofpaymet, loansum)
values (5, 10, 335247);
insert into LOAN (loanid, numofpaymet, loansum)
values (6, 3, 727511);
insert into LOAN (loanid, numofpaymet, loansum)
values (7, 9, 439305);
insert into LOAN (loanid, numofpaymet, loansum)
values (8, 8, 484944);
insert into LOAN (loanid, numofpaymet, loansum)
values (9, 3, 99943);
insert into LOAN (loanid, numofpaymet, loansum)
values (10, 11, 814048);
insert into LOAN (loanid, numofpaymet, loansum)
values (11, 9, 849398);
insert into LOAN (loanid, numofpaymet, loansum)
values (12, 11, 550016);
insert into LOAN (loanid, numofpaymet, loansum)
values (13, 9, 783928);
insert into LOAN (loanid, numofpaymet, loansum)
values (14, 3, 142518);
insert into LOAN (loanid, numofpaymet, loansum)
values (15, 10, 438728);
insert into LOAN (loanid, numofpaymet, loansum)
values (16, 11, 52266);
insert into LOAN (loanid, numofpaymet, loansum)
values (17, 1, 39648);
insert into LOAN (loanid, numofpaymet, loansum)
values (18, 6, 350472);
insert into LOAN (loanid, numofpaymet, loansum)
values (19, 7, 853338);
insert into LOAN (loanid, numofpaymet, loansum)
values (20, 7, 881222);
insert into LOAN (loanid, numofpaymet, loansum)
values (21, 6, 630224);
insert into LOAN (loanid, numofpaymet, loansum)
values (22, 3, 597531);
insert into LOAN (loanid, numofpaymet, loansum)
values (23, 4, 357458);
insert into LOAN (loanid, numofpaymet, loansum)
values (24, 6, 925590);
insert into LOAN (loanid, numofpaymet, loansum)
values (25, 2, 827721);
insert into LOAN (loanid, numofpaymet, loansum)
values (26, 1, 279470);
insert into LOAN (loanid, numofpaymet, loansum)
values (27, 7, 746517);
insert into LOAN (loanid, numofpaymet, loansum)
values (28, 4, 65310);
insert into LOAN (loanid, numofpaymet, loansum)
values (29, 4, 358377);
insert into LOAN (loanid, numofpaymet, loansum)
values (30, 6, 805736);
insert into LOAN (loanid, numofpaymet, loansum)
values (31, 2, 836074);
insert into LOAN (loanid, numofpaymet, loansum)
values (32, 6, 232042);
insert into LOAN (loanid, numofpaymet, loansum)
values (33, 9, 915766);
insert into LOAN (loanid, numofpaymet, loansum)
values (34, 4, 446398);
insert into LOAN (loanid, numofpaymet, loansum)
values (35, 1, 502701);
insert into LOAN (loanid, numofpaymet, loansum)
values (36, 5, 537085);
insert into LOAN (loanid, numofpaymet, loansum)
values (37, 10, 242878);
insert into LOAN (loanid, numofpaymet, loansum)
values (38, 3, 230545);
insert into LOAN (loanid, numofpaymet, loansum)
values (39, 3, 291793);
insert into LOAN (loanid, numofpaymet, loansum)
values (40, 3, 453743);
insert into LOAN (loanid, numofpaymet, loansum)
values (41, 1, 762172);
insert into LOAN (loanid, numofpaymet, loansum)
values (42, 11, 916116);
insert into LOAN (loanid, numofpaymet, loansum)
values (43, 4, 588326);
insert into LOAN (loanid, numofpaymet, loansum)
values (44, 12, 65122);
insert into LOAN (loanid, numofpaymet, loansum)
values (45, 12, 785529);
insert into LOAN (loanid, numofpaymet, loansum)
values (46, 10, 22160);
insert into LOAN (loanid, numofpaymet, loansum)
values (47, 9, 350538);
insert into LOAN (loanid, numofpaymet, loansum)
values (48, 11, 374366);
insert into LOAN (loanid, numofpaymet, loansum)
values (49, 10, 272171);
insert into LOAN (loanid, numofpaymet, loansum)
values (50, 7, 911554);
insert into LOAN (loanid, numofpaymet, loansum)
values (51, 5, 401563);
insert into LOAN (loanid, numofpaymet, loansum)
values (52, 6, 680332);
insert into LOAN (loanid, numofpaymet, loansum)
values (53, 3, 155504);
insert into LOAN (loanid, numofpaymet, loansum)
values (54, 12, 957133);
insert into LOAN (loanid, numofpaymet, loansum)
values (55, 2, 289992);
insert into LOAN (loanid, numofpaymet, loansum)
values (56, 1, 11698);
insert into LOAN (loanid, numofpaymet, loansum)
values (57, 10, 233899);
insert into LOAN (loanid, numofpaymet, loansum)
values (58, 10, 749275);
insert into LOAN (loanid, numofpaymet, loansum)
values (59, 12, 707378);
insert into LOAN (loanid, numofpaymet, loansum)
values (60, 6, 621522);
insert into LOAN (loanid, numofpaymet, loansum)
values (61, 1, 620417);
insert into LOAN (loanid, numofpaymet, loansum)
values (62, 11, 378924);
insert into LOAN (loanid, numofpaymet, loansum)
values (63, 6, 473670);
insert into LOAN (loanid, numofpaymet, loansum)
values (64, 7, 555211);
insert into LOAN (loanid, numofpaymet, loansum)
values (65, 8, 757461);
insert into LOAN (loanid, numofpaymet, loansum)
values (66, 5, 778037);
insert into LOAN (loanid, numofpaymet, loansum)
values (67, 8, 78594);
insert into LOAN (loanid, numofpaymet, loansum)
values (68, 5, 266960);
insert into LOAN (loanid, numofpaymet, loansum)
values (69, 5, 991378);
insert into LOAN (loanid, numofpaymet, loansum)
values (70, 6, 127477);
insert into LOAN (loanid, numofpaymet, loansum)
values (71, 7, 789972);
insert into LOAN (loanid, numofpaymet, loansum)
values (72, 1, 307610);
insert into LOAN (loanid, numofpaymet, loansum)
values (73, 8, 712989);
insert into LOAN (loanid, numofpaymet, loansum)
values (74, 2, 317351);
insert into LOAN (loanid, numofpaymet, loansum)
values (75, 1, 327959);
insert into LOAN (loanid, numofpaymet, loansum)
values (76, 10, 73939);
insert into LOAN (loanid, numofpaymet, loansum)
values (77, 12, 57060);
insert into LOAN (loanid, numofpaymet, loansum)
values (78, 7, 482768);
insert into LOAN (loanid, numofpaymet, loansum)
values (79, 3, 90252);
insert into LOAN (loanid, numofpaymet, loansum)
values (80, 10, 616410);
insert into LOAN (loanid, numofpaymet, loansum)
values (81, 3, 165711);
insert into LOAN (loanid, numofpaymet, loansum)
values (82, 8, 592051);
insert into LOAN (loanid, numofpaymet, loansum)
values (83, 5, 951201);
insert into LOAN (loanid, numofpaymet, loansum)
values (84, 12, 516334);
insert into LOAN (loanid, numofpaymet, loansum)
values (85, 3, 17761);
insert into LOAN (loanid, numofpaymet, loansum)
values (86, 12, 102376);
insert into LOAN (loanid, numofpaymet, loansum)
values (87, 3, 621881);
insert into LOAN (loanid, numofpaymet, loansum)
values (88, 2, 816490);
insert into LOAN (loanid, numofpaymet, loansum)
values (89, 11, 813011);
insert into LOAN (loanid, numofpaymet, loansum)
values (90, 10, 673853);
insert into LOAN (loanid, numofpaymet, loansum)
values (91, 10, 563093);
insert into LOAN (loanid, numofpaymet, loansum)
values (92, 6, 24166);
insert into LOAN (loanid, numofpaymet, loansum)
values (93, 8, 928465);
insert into LOAN (loanid, numofpaymet, loansum)
values (94, 11, 954044);
insert into LOAN (loanid, numofpaymet, loansum)
values (95, 12, 473303);
insert into LOAN (loanid, numofpaymet, loansum)
values (96, 9, 165656);
insert into LOAN (loanid, numofpaymet, loansum)
values (97, 7, 427487);
insert into LOAN (loanid, numofpaymet, loansum)
values (98, 10, 415915);
insert into LOAN (loanid, numofpaymet, loansum)
values (99, 9, 331519);
insert into LOAN (loanid, numofpaymet, loansum)
values (100, 10, 915172);
commit;
prompt 100 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (101, 1, 136901);
insert into LOAN (loanid, numofpaymet, loansum)
values (102, 10, 261235);
insert into LOAN (loanid, numofpaymet, loansum)
values (103, 12, 5104);
insert into LOAN (loanid, numofpaymet, loansum)
values (104, 5, 779210);
insert into LOAN (loanid, numofpaymet, loansum)
values (105, 7, 287020);
insert into LOAN (loanid, numofpaymet, loansum)
values (106, 6, 390402);
insert into LOAN (loanid, numofpaymet, loansum)
values (107, 12, 418533);
insert into LOAN (loanid, numofpaymet, loansum)
values (108, 4, 341352);
insert into LOAN (loanid, numofpaymet, loansum)
values (109, 4, 712617);
insert into LOAN (loanid, numofpaymet, loansum)
values (110, 1, 430709);
insert into LOAN (loanid, numofpaymet, loansum)
values (111, 10, 289074);
insert into LOAN (loanid, numofpaymet, loansum)
values (112, 8, 574501);
insert into LOAN (loanid, numofpaymet, loansum)
values (113, 4, 616834);
insert into LOAN (loanid, numofpaymet, loansum)
values (114, 2, 827052);
insert into LOAN (loanid, numofpaymet, loansum)
values (115, 7, 417423);
insert into LOAN (loanid, numofpaymet, loansum)
values (116, 8, 216551);
insert into LOAN (loanid, numofpaymet, loansum)
values (117, 5, 895029);
insert into LOAN (loanid, numofpaymet, loansum)
values (118, 7, 998070);
insert into LOAN (loanid, numofpaymet, loansum)
values (119, 7, 548264);
insert into LOAN (loanid, numofpaymet, loansum)
values (120, 9, 201501);
insert into LOAN (loanid, numofpaymet, loansum)
values (121, 9, 27555);
insert into LOAN (loanid, numofpaymet, loansum)
values (122, 5, 551729);
insert into LOAN (loanid, numofpaymet, loansum)
values (123, 9, 788772);
insert into LOAN (loanid, numofpaymet, loansum)
values (124, 9, 161005);
insert into LOAN (loanid, numofpaymet, loansum)
values (125, 8, 524491);
insert into LOAN (loanid, numofpaymet, loansum)
values (126, 7, 563336);
insert into LOAN (loanid, numofpaymet, loansum)
values (127, 9, 592053);
insert into LOAN (loanid, numofpaymet, loansum)
values (128, 9, 982357);
insert into LOAN (loanid, numofpaymet, loansum)
values (129, 1, 947284);
insert into LOAN (loanid, numofpaymet, loansum)
values (130, 8, 919996);
insert into LOAN (loanid, numofpaymet, loansum)
values (131, 3, 300521);
insert into LOAN (loanid, numofpaymet, loansum)
values (132, 11, 435913);
insert into LOAN (loanid, numofpaymet, loansum)
values (133, 5, 480357);
insert into LOAN (loanid, numofpaymet, loansum)
values (134, 2, 724502);
insert into LOAN (loanid, numofpaymet, loansum)
values (135, 11, 254211);
insert into LOAN (loanid, numofpaymet, loansum)
values (136, 12, 852957);
insert into LOAN (loanid, numofpaymet, loansum)
values (137, 11, 68641);
insert into LOAN (loanid, numofpaymet, loansum)
values (138, 9, 759671);
insert into LOAN (loanid, numofpaymet, loansum)
values (139, 1, 461033);
insert into LOAN (loanid, numofpaymet, loansum)
values (140, 5, 881994);
insert into LOAN (loanid, numofpaymet, loansum)
values (141, 4, 121042);
insert into LOAN (loanid, numofpaymet, loansum)
values (142, 1, 21101);
insert into LOAN (loanid, numofpaymet, loansum)
values (143, 2, 828960);
insert into LOAN (loanid, numofpaymet, loansum)
values (144, 12, 294493);
insert into LOAN (loanid, numofpaymet, loansum)
values (145, 3, 773851);
insert into LOAN (loanid, numofpaymet, loansum)
values (146, 11, 304390);
insert into LOAN (loanid, numofpaymet, loansum)
values (147, 7, 961154);
insert into LOAN (loanid, numofpaymet, loansum)
values (148, 4, 857054);
insert into LOAN (loanid, numofpaymet, loansum)
values (149, 4, 718087);
insert into LOAN (loanid, numofpaymet, loansum)
values (150, 6, 864768);
insert into LOAN (loanid, numofpaymet, loansum)
values (151, 1, 513034);
insert into LOAN (loanid, numofpaymet, loansum)
values (152, 11, 273024);
insert into LOAN (loanid, numofpaymet, loansum)
values (153, 9, 584786);
insert into LOAN (loanid, numofpaymet, loansum)
values (154, 2, 132176);
insert into LOAN (loanid, numofpaymet, loansum)
values (155, 6, 111275);
insert into LOAN (loanid, numofpaymet, loansum)
values (156, 9, 172546);
insert into LOAN (loanid, numofpaymet, loansum)
values (157, 8, 898216);
insert into LOAN (loanid, numofpaymet, loansum)
values (158, 5, 485795);
insert into LOAN (loanid, numofpaymet, loansum)
values (159, 3, 836749);
insert into LOAN (loanid, numofpaymet, loansum)
values (160, 7, 179039);
insert into LOAN (loanid, numofpaymet, loansum)
values (161, 1, 591038);
insert into LOAN (loanid, numofpaymet, loansum)
values (162, 3, 103990);
insert into LOAN (loanid, numofpaymet, loansum)
values (163, 1, 273398);
insert into LOAN (loanid, numofpaymet, loansum)
values (164, 2, 30132);
insert into LOAN (loanid, numofpaymet, loansum)
values (165, 8, 77401);
insert into LOAN (loanid, numofpaymet, loansum)
values (166, 9, 860708);
insert into LOAN (loanid, numofpaymet, loansum)
values (167, 1, 108056);
insert into LOAN (loanid, numofpaymet, loansum)
values (168, 6, 762016);
insert into LOAN (loanid, numofpaymet, loansum)
values (169, 8, 891980);
insert into LOAN (loanid, numofpaymet, loansum)
values (170, 1, 300303);
insert into LOAN (loanid, numofpaymet, loansum)
values (171, 10, 306193);
insert into LOAN (loanid, numofpaymet, loansum)
values (172, 5, 961249);
insert into LOAN (loanid, numofpaymet, loansum)
values (173, 2, 895934);
insert into LOAN (loanid, numofpaymet, loansum)
values (174, 8, 657814);
insert into LOAN (loanid, numofpaymet, loansum)
values (175, 5, 842611);
insert into LOAN (loanid, numofpaymet, loansum)
values (176, 5, 71986);
insert into LOAN (loanid, numofpaymet, loansum)
values (177, 7, 34826);
insert into LOAN (loanid, numofpaymet, loansum)
values (178, 9, 958657);
insert into LOAN (loanid, numofpaymet, loansum)
values (179, 11, 997066);
insert into LOAN (loanid, numofpaymet, loansum)
values (180, 1, 766664);
insert into LOAN (loanid, numofpaymet, loansum)
values (181, 6, 664470);
insert into LOAN (loanid, numofpaymet, loansum)
values (182, 6, 169775);
insert into LOAN (loanid, numofpaymet, loansum)
values (183, 2, 210833);
insert into LOAN (loanid, numofpaymet, loansum)
values (184, 4, 390099);
insert into LOAN (loanid, numofpaymet, loansum)
values (185, 11, 446700);
insert into LOAN (loanid, numofpaymet, loansum)
values (186, 9, 413220);
insert into LOAN (loanid, numofpaymet, loansum)
values (187, 11, 504214);
insert into LOAN (loanid, numofpaymet, loansum)
values (188, 6, 448047);
insert into LOAN (loanid, numofpaymet, loansum)
values (189, 9, 792108);
insert into LOAN (loanid, numofpaymet, loansum)
values (190, 1, 252164);
insert into LOAN (loanid, numofpaymet, loansum)
values (191, 1, 464970);
insert into LOAN (loanid, numofpaymet, loansum)
values (192, 6, 174182);
insert into LOAN (loanid, numofpaymet, loansum)
values (193, 8, 879689);
insert into LOAN (loanid, numofpaymet, loansum)
values (194, 3, 27360);
insert into LOAN (loanid, numofpaymet, loansum)
values (195, 8, 787700);
insert into LOAN (loanid, numofpaymet, loansum)
values (196, 2, 149525);
insert into LOAN (loanid, numofpaymet, loansum)
values (197, 12, 230443);
insert into LOAN (loanid, numofpaymet, loansum)
values (198, 2, 263032);
insert into LOAN (loanid, numofpaymet, loansum)
values (199, 6, 385157);
insert into LOAN (loanid, numofpaymet, loansum)
values (200, 1, 989304);
commit;
prompt 200 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (201, 5, 843910);
insert into LOAN (loanid, numofpaymet, loansum)
values (202, 12, 135202);
insert into LOAN (loanid, numofpaymet, loansum)
values (203, 10, 54500);
insert into LOAN (loanid, numofpaymet, loansum)
values (204, 9, 94248);
insert into LOAN (loanid, numofpaymet, loansum)
values (205, 6, 905633);
insert into LOAN (loanid, numofpaymet, loansum)
values (206, 3, 997464);
insert into LOAN (loanid, numofpaymet, loansum)
values (207, 10, 711484);
insert into LOAN (loanid, numofpaymet, loansum)
values (208, 10, 452335);
insert into LOAN (loanid, numofpaymet, loansum)
values (209, 11, 45574);
insert into LOAN (loanid, numofpaymet, loansum)
values (210, 1, 978186);
insert into LOAN (loanid, numofpaymet, loansum)
values (211, 7, 188580);
insert into LOAN (loanid, numofpaymet, loansum)
values (212, 2, 521952);
insert into LOAN (loanid, numofpaymet, loansum)
values (213, 9, 163458);
insert into LOAN (loanid, numofpaymet, loansum)
values (214, 9, 629149);
insert into LOAN (loanid, numofpaymet, loansum)
values (215, 5, 585053);
insert into LOAN (loanid, numofpaymet, loansum)
values (216, 6, 161516);
insert into LOAN (loanid, numofpaymet, loansum)
values (217, 1, 822052);
insert into LOAN (loanid, numofpaymet, loansum)
values (218, 5, 644635);
insert into LOAN (loanid, numofpaymet, loansum)
values (219, 4, 194948);
insert into LOAN (loanid, numofpaymet, loansum)
values (220, 1, 627518);
insert into LOAN (loanid, numofpaymet, loansum)
values (221, 12, 197388);
insert into LOAN (loanid, numofpaymet, loansum)
values (222, 8, 641938);
insert into LOAN (loanid, numofpaymet, loansum)
values (223, 2, 982045);
insert into LOAN (loanid, numofpaymet, loansum)
values (224, 2, 639013);
insert into LOAN (loanid, numofpaymet, loansum)
values (225, 1, 586924);
insert into LOAN (loanid, numofpaymet, loansum)
values (226, 6, 2319);
insert into LOAN (loanid, numofpaymet, loansum)
values (227, 6, 632722);
insert into LOAN (loanid, numofpaymet, loansum)
values (228, 12, 496539);
insert into LOAN (loanid, numofpaymet, loansum)
values (229, 10, 493638);
insert into LOAN (loanid, numofpaymet, loansum)
values (230, 3, 772407);
insert into LOAN (loanid, numofpaymet, loansum)
values (231, 4, 155780);
insert into LOAN (loanid, numofpaymet, loansum)
values (232, 2, 269484);
insert into LOAN (loanid, numofpaymet, loansum)
values (233, 8, 259057);
insert into LOAN (loanid, numofpaymet, loansum)
values (234, 2, 638015);
insert into LOAN (loanid, numofpaymet, loansum)
values (235, 11, 56189);
insert into LOAN (loanid, numofpaymet, loansum)
values (236, 2, 43879);
insert into LOAN (loanid, numofpaymet, loansum)
values (237, 1, 266236);
insert into LOAN (loanid, numofpaymet, loansum)
values (238, 4, 945421);
insert into LOAN (loanid, numofpaymet, loansum)
values (239, 10, 67780);
insert into LOAN (loanid, numofpaymet, loansum)
values (240, 4, 232641);
insert into LOAN (loanid, numofpaymet, loansum)
values (241, 5, 703659);
insert into LOAN (loanid, numofpaymet, loansum)
values (242, 3, 799064);
insert into LOAN (loanid, numofpaymet, loansum)
values (243, 9, 446872);
insert into LOAN (loanid, numofpaymet, loansum)
values (244, 2, 949240);
insert into LOAN (loanid, numofpaymet, loansum)
values (245, 5, 892086);
insert into LOAN (loanid, numofpaymet, loansum)
values (246, 9, 212694);
insert into LOAN (loanid, numofpaymet, loansum)
values (247, 8, 830834);
insert into LOAN (loanid, numofpaymet, loansum)
values (248, 6, 444814);
insert into LOAN (loanid, numofpaymet, loansum)
values (249, 8, 172340);
insert into LOAN (loanid, numofpaymet, loansum)
values (250, 4, 325945);
insert into LOAN (loanid, numofpaymet, loansum)
values (251, 4, 657589);
insert into LOAN (loanid, numofpaymet, loansum)
values (252, 11, 600717);
insert into LOAN (loanid, numofpaymet, loansum)
values (253, 11, 354025);
insert into LOAN (loanid, numofpaymet, loansum)
values (254, 3, 686357);
insert into LOAN (loanid, numofpaymet, loansum)
values (255, 8, 147053);
insert into LOAN (loanid, numofpaymet, loansum)
values (256, 3, 495508);
insert into LOAN (loanid, numofpaymet, loansum)
values (257, 1, 734184);
insert into LOAN (loanid, numofpaymet, loansum)
values (258, 1, 589828);
insert into LOAN (loanid, numofpaymet, loansum)
values (259, 5, 845514);
insert into LOAN (loanid, numofpaymet, loansum)
values (260, 8, 24368);
insert into LOAN (loanid, numofpaymet, loansum)
values (261, 1, 670893);
insert into LOAN (loanid, numofpaymet, loansum)
values (262, 10, 483511);
insert into LOAN (loanid, numofpaymet, loansum)
values (263, 12, 737942);
insert into LOAN (loanid, numofpaymet, loansum)
values (264, 2, 583972);
insert into LOAN (loanid, numofpaymet, loansum)
values (265, 5, 720800);
insert into LOAN (loanid, numofpaymet, loansum)
values (266, 6, 434141);
insert into LOAN (loanid, numofpaymet, loansum)
values (267, 2, 911246);
insert into LOAN (loanid, numofpaymet, loansum)
values (268, 9, 824775);
insert into LOAN (loanid, numofpaymet, loansum)
values (269, 12, 342588);
insert into LOAN (loanid, numofpaymet, loansum)
values (270, 10, 656801);
insert into LOAN (loanid, numofpaymet, loansum)
values (271, 4, 791457);
insert into LOAN (loanid, numofpaymet, loansum)
values (272, 6, 457758);
insert into LOAN (loanid, numofpaymet, loansum)
values (273, 2, 158391);
insert into LOAN (loanid, numofpaymet, loansum)
values (274, 1, 108130);
insert into LOAN (loanid, numofpaymet, loansum)
values (275, 11, 935864);
insert into LOAN (loanid, numofpaymet, loansum)
values (276, 12, 127598);
insert into LOAN (loanid, numofpaymet, loansum)
values (277, 8, 781134);
insert into LOAN (loanid, numofpaymet, loansum)
values (278, 1, 136966);
insert into LOAN (loanid, numofpaymet, loansum)
values (279, 11, 393068);
insert into LOAN (loanid, numofpaymet, loansum)
values (280, 7, 349283);
insert into LOAN (loanid, numofpaymet, loansum)
values (281, 2, 205817);
insert into LOAN (loanid, numofpaymet, loansum)
values (282, 1, 205425);
insert into LOAN (loanid, numofpaymet, loansum)
values (283, 6, 618994);
insert into LOAN (loanid, numofpaymet, loansum)
values (284, 6, 507154);
insert into LOAN (loanid, numofpaymet, loansum)
values (285, 3, 753740);
insert into LOAN (loanid, numofpaymet, loansum)
values (286, 5, 665415);
insert into LOAN (loanid, numofpaymet, loansum)
values (287, 11, 963824);
insert into LOAN (loanid, numofpaymet, loansum)
values (288, 10, 913396);
insert into LOAN (loanid, numofpaymet, loansum)
values (289, 5, 594655);
insert into LOAN (loanid, numofpaymet, loansum)
values (290, 4, 602598);
insert into LOAN (loanid, numofpaymet, loansum)
values (291, 5, 714873);
insert into LOAN (loanid, numofpaymet, loansum)
values (292, 10, 932962);
insert into LOAN (loanid, numofpaymet, loansum)
values (293, 7, 815867);
insert into LOAN (loanid, numofpaymet, loansum)
values (294, 4, 737778);
insert into LOAN (loanid, numofpaymet, loansum)
values (295, 3, 702410);
insert into LOAN (loanid, numofpaymet, loansum)
values (296, 2, 167932);
insert into LOAN (loanid, numofpaymet, loansum)
values (297, 10, 66261);
insert into LOAN (loanid, numofpaymet, loansum)
values (298, 1, 396730);
insert into LOAN (loanid, numofpaymet, loansum)
values (299, 12, 472404);
insert into LOAN (loanid, numofpaymet, loansum)
values (300, 8, 703317);
commit;
prompt 300 records committed...
insert into LOAN (loanid, numofpaymet, loansum)
values (301, 8, 751283);
insert into LOAN (loanid, numofpaymet, loansum)
values (302, 9, 536473);
insert into LOAN (loanid, numofpaymet, loansum)
values (303, 4, 17216);
insert into LOAN (loanid, numofpaymet, loansum)
values (304, 10, 424286);
insert into LOAN (loanid, numofpaymet, loansum)
values (305, 8, 804836);
insert into LOAN (loanid, numofpaymet, loansum)
values (306, 7, 839970);
insert into LOAN (loanid, numofpaymet, loansum)
values (307, 8, 70226);
insert into LOAN (loanid, numofpaymet, loansum)
values (308, 7, 381849);
insert into LOAN (loanid, numofpaymet, loansum)
values (309, 4, 9134);
insert into LOAN (loanid, numofpaymet, loansum)
values (310, 8, 869272);
insert into LOAN (loanid, numofpaymet, loansum)
values (311, 8, 964398);
insert into LOAN (loanid, numofpaymet, loansum)
values (312, 3, 232964);
insert into LOAN (loanid, numofpaymet, loansum)
values (313, 4, 882484);
insert into LOAN (loanid, numofpaymet, loansum)
values (314, 5, 282099);
insert into LOAN (loanid, numofpaymet, loansum)
values (315, 11, 54776);
insert into LOAN (loanid, numofpaymet, loansum)
values (316, 11, 736086);
insert into LOAN (loanid, numofpaymet, loansum)
values (317, 10, 139002);
insert into LOAN (loanid, numofpaymet, loansum)
values (318, 9, 109856);
insert into LOAN (loanid, numofpaymet, loansum)
values (319, 8, 691935);
insert into LOAN (loanid, numofpaymet, loansum)
values (320, 2, 315153);
insert into LOAN (loanid, numofpaymet, loansum)
values (321, 3, 690278);
insert into LOAN (loanid, numofpaymet, loansum)
values (322, 12, 102092);
insert into LOAN (loanid, numofpaymet, loansum)
values (323, 10, 778346);
insert into LOAN (loanid, numofpaymet, loansum)
values (324, 12, 677014);
insert into LOAN (loanid, numofpaymet, loansum)
values (325, 9, 232965);
insert into LOAN (loanid, numofpaymet, loansum)
values (326, 3, 129386);
insert into LOAN (loanid, numofpaymet, loansum)
values (327, 1, 867699);
insert into LOAN (loanid, numofpaymet, loansum)
values (328, 1, 503282);
insert into LOAN (loanid, numofpaymet, loansum)
values (329, 4, 378320);
insert into LOAN (loanid, numofpaymet, loansum)
values (330, 6, 649683);
insert into LOAN (loanid, numofpaymet, loansum)
values (331, 1, 838150);
insert into LOAN (loanid, numofpaymet, loansum)
values (332, 5, 193641);
insert into LOAN (loanid, numofpaymet, loansum)
values (333, 6, 359666);
insert into LOAN (loanid, numofpaymet, loansum)
values (334, 5, 240056);
insert into LOAN (loanid, numofpaymet, loansum)
values (335, 1, 124512);
insert into LOAN (loanid, numofpaymet, loansum)
values (336, 4, 677580);
insert into LOAN (loanid, numofpaymet, loansum)
values (337, 8, 292807);
insert into LOAN (loanid, numofpaymet, loansum)
values (338, 10, 183921);
insert into LOAN (loanid, numofpaymet, loansum)
values (339, 11, 510385);
insert into LOAN (loanid, numofpaymet, loansum)
values (340, 4, 290564);
insert into LOAN (loanid, numofpaymet, loansum)
values (341, 2, 3370);
insert into LOAN (loanid, numofpaymet, loansum)
values (342, 7, 129666);
insert into LOAN (loanid, numofpaymet, loansum)
values (343, 5, 491214);
insert into LOAN (loanid, numofpaymet, loansum)
values (344, 1, 703647);
insert into LOAN (loanid, numofpaymet, loansum)
values (345, 4, 414090);
insert into LOAN (loanid, numofpaymet, loansum)
values (346, 6, 804742);
insert into LOAN (loanid, numofpaymet, loansum)
values (347, 10, 189295);
insert into LOAN (loanid, numofpaymet, loansum)
values (348, 1, 927523);
insert into LOAN (loanid, numofpaymet, loansum)
values (349, 11, 499030);
insert into LOAN (loanid, numofpaymet, loansum)
values (350, 2, 798174);
insert into LOAN (loanid, numofpaymet, loansum)
values (351, 9, 836718);
insert into LOAN (loanid, numofpaymet, loansum)
values (352, 10, 370009);
insert into LOAN (loanid, numofpaymet, loansum)
values (353, 11, 793739);
insert into LOAN (loanid, numofpaymet, loansum)
values (354, 11, 398522);
insert into LOAN (loanid, numofpaymet, loansum)
values (355, 4, 824233);
insert into LOAN (loanid, numofpaymet, loansum)
values (356, 2, 956971);
insert into LOAN (loanid, numofpaymet, loansum)
values (357, 1, 474346);
insert into LOAN (loanid, numofpaymet, loansum)
values (358, 4, 499267);
insert into LOAN (loanid, numofpaymet, loansum)
values (359, 9, 304077);
insert into LOAN (loanid, numofpaymet, loansum)
values (360, 4, 324683);
insert into LOAN (loanid, numofpaymet, loansum)
values (361, 7, 992601);
insert into LOAN (loanid, numofpaymet, loansum)
values (362, 3, 567647);
insert into LOAN (loanid, numofpaymet, loansum)
values (363, 3, 360719);
insert into LOAN (loanid, numofpaymet, loansum)
values (364, 11, 59630);
insert into LOAN (loanid, numofpaymet, loansum)
values (365, 5, 282832);
insert into LOAN (loanid, numofpaymet, loansum)
values (366, 6, 671919);
insert into LOAN (loanid, numofpaymet, loansum)
values (367, 1, 745551);
insert into LOAN (loanid, numofpaymet, loansum)
values (368, 1, 14741);
insert into LOAN (loanid, numofpaymet, loansum)
values (369, 2, 517868);
insert into LOAN (loanid, numofpaymet, loansum)
values (370, 6, 574070);
insert into LOAN (loanid, numofpaymet, loansum)
values (371, 12, 171511);
insert into LOAN (loanid, numofpaymet, loansum)
values (372, 9, 680063);
insert into LOAN (loanid, numofpaymet, loansum)
values (373, 5, 442874);
insert into LOAN (loanid, numofpaymet, loansum)
values (374, 3, 882954);
insert into LOAN (loanid, numofpaymet, loansum)
values (375, 1, 166658);
insert into LOAN (loanid, numofpaymet, loansum)
values (376, 2, 620872);
insert into LOAN (loanid, numofpaymet, loansum)
values (377, 4, 259138);
insert into LOAN (loanid, numofpaymet, loansum)
values (378, 6, 273877);
insert into LOAN (loanid, numofpaymet, loansum)
values (379, 9, 498662);
insert into LOAN (loanid, numofpaymet, loansum)
values (380, 6, 971224);
insert into LOAN (loanid, numofpaymet, loansum)
values (381, 11, 76794);
insert into LOAN (loanid, numofpaymet, loansum)
values (382, 1, 762611);
insert into LOAN (loanid, numofpaymet, loansum)
values (383, 4, 156249);
insert into LOAN (loanid, numofpaymet, loansum)
values (384, 7, 998940);
insert into LOAN (loanid, numofpaymet, loansum)
values (385, 1, 927477);
insert into LOAN (loanid, numofpaymet, loansum)
values (386, 1, 54848);
insert into LOAN (loanid, numofpaymet, loansum)
values (387, 7, 890580);
insert into LOAN (loanid, numofpaymet, loansum)
values (388, 7, 726030);
insert into LOAN (loanid, numofpaymet, loansum)
values (389, 3, 344917);
insert into LOAN (loanid, numofpaymet, loansum)
values (390, 6, 941102);
insert into LOAN (loanid, numofpaymet, loansum)
values (391, 7, 329560);
insert into LOAN (loanid, numofpaymet, loansum)
values (392, 7, 614553);
insert into LOAN (loanid, numofpaymet, loansum)
values (393, 6, 495479);
insert into LOAN (loanid, numofpaymet, loansum)
values (394, 5, 774022);
insert into LOAN (loanid, numofpaymet, loansum)
values (395, 7, 639097);
insert into LOAN (loanid, numofpaymet, loansum)
values (396, 11, 315919);
insert into LOAN (loanid, numofpaymet, loansum)
values (397, 6, 886626);
insert into LOAN (loanid, numofpaymet, loansum)
values (398, 9, 988178);
insert into LOAN (loanid, numofpaymet, loansum)
values (399, 1, 763284);
insert into LOAN (loanid, numofpaymet, loansum)
values (400, 7, 479623);
commit;
prompt 400 records loaded
prompt Loading LOANTOACCOUNT...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-09-2001', 'dd-mm-yyyy'), 1, 176, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 0, 175, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1990', 'dd-mm-yyyy'), 0, 357, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-04-2022', 'dd-mm-yyyy'), 0, 1, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-10-2009', 'dd-mm-yyyy'), 0, 308, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-02-1983', 'dd-mm-yyyy'), 0, 149, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-05-2018', 'dd-mm-yyyy'), 0, 175, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-2003', 'dd-mm-yyyy'), 0, 15, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-09-2006', 'dd-mm-yyyy'), 1, 383, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-02-1992', 'dd-mm-yyyy'), 0, 369, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-08-1995', 'dd-mm-yyyy'), 1, 322, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-1976', 'dd-mm-yyyy'), 1, 1, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-1991', 'dd-mm-yyyy'), 0, 208, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-05-1988', 'dd-mm-yyyy'), 0, 184, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-03-2000', 'dd-mm-yyyy'), 1, 361, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-03-2013', 'dd-mm-yyyy'), 0, 173, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-07-1988', 'dd-mm-yyyy'), 1, 309, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-10-1992', 'dd-mm-yyyy'), 0, 116, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-03-2015', 'dd-mm-yyyy'), 0, 122, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-2000', 'dd-mm-yyyy'), 1, 203, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-1979', 'dd-mm-yyyy'), 0, 364, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-05-1976', 'dd-mm-yyyy'), 1, 32, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1979', 'dd-mm-yyyy'), 0, 275, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-2020', 'dd-mm-yyyy'), 0, 201, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-06-2011', 'dd-mm-yyyy'), 0, 178, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-12-2021', 'dd-mm-yyyy'), 1, 126, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-04-2005', 'dd-mm-yyyy'), 0, 106, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-02-2017', 'dd-mm-yyyy'), 0, 84, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-09-1971', 'dd-mm-yyyy'), 0, 262, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-07-1990', 'dd-mm-yyyy'), 0, 283, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-08-1988', 'dd-mm-yyyy'), 0, 94, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-2015', 'dd-mm-yyyy'), 1, 154, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-1970', 'dd-mm-yyyy'), 0, 5, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-03-2013', 'dd-mm-yyyy'), 1, 267, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-10-1991', 'dd-mm-yyyy'), 0, 81, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-07-2005', 'dd-mm-yyyy'), 1, 74, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-08-2007', 'dd-mm-yyyy'), 0, 248, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-07-1992', 'dd-mm-yyyy'), 1, 283, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-2019', 'dd-mm-yyyy'), 0, 252, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-06-1993', 'dd-mm-yyyy'), 1, 242, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-2022', 'dd-mm-yyyy'), 1, 263, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-1983', 'dd-mm-yyyy'), 0, 362, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-03-2015', 'dd-mm-yyyy'), 0, 108, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-02-2000', 'dd-mm-yyyy'), 1, 363, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 0, 324, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-1972', 'dd-mm-yyyy'), 1, 133, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-2023', 'dd-mm-yyyy'), 0, 240, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-2001', 'dd-mm-yyyy'), 0, 29, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-06-1979', 'dd-mm-yyyy'), 1, 193, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2020', 'dd-mm-yyyy'), 0, 106, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-04-1981', 'dd-mm-yyyy'), 0, 93, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-11-1975', 'dd-mm-yyyy'), 0, 146, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-2003', 'dd-mm-yyyy'), 0, 291, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-12-2021', 'dd-mm-yyyy'), 0, 204, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1980', 'dd-mm-yyyy'), 0, 39, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-1981', 'dd-mm-yyyy'), 0, 249, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-11-2018', 'dd-mm-yyyy'), 1, 295, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-2022', 'dd-mm-yyyy'), 0, 249, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-05-1985', 'dd-mm-yyyy'), 0, 165, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-06-1978', 'dd-mm-yyyy'), 1, 228, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-2023', 'dd-mm-yyyy'), 1, 372, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-1979', 'dd-mm-yyyy'), 1, 150, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-03-1973', 'dd-mm-yyyy'), 0, 2, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-05-1984', 'dd-mm-yyyy'), 0, 360, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-01-1996', 'dd-mm-yyyy'), 1, 168, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-07-1994', 'dd-mm-yyyy'), 1, 35, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-2000', 'dd-mm-yyyy'), 1, 341, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-10-1996', 'dd-mm-yyyy'), 1, 346, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-10-1994', 'dd-mm-yyyy'), 0, 326, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-1996', 'dd-mm-yyyy'), 1, 396, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-2007', 'dd-mm-yyyy'), 0, 242, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-2006', 'dd-mm-yyyy'), 1, 38, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-03-1984', 'dd-mm-yyyy'), 1, 150, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-09-1991', 'dd-mm-yyyy'), 0, 118, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-01-2017', 'dd-mm-yyyy'), 0, 309, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-12-1971', 'dd-mm-yyyy'), 0, 141, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-07-1974', 'dd-mm-yyyy'), 1, 59, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-1971', 'dd-mm-yyyy'), 0, 169, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-08-2012', 'dd-mm-yyyy'), 1, 123, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-06-2024', 'dd-mm-yyyy'), 1, 134, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-11-1990', 'dd-mm-yyyy'), 0, 339, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-11-2015', 'dd-mm-yyyy'), 1, 181, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-12-1990', 'dd-mm-yyyy'), 0, 17, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-01-1971', 'dd-mm-yyyy'), 1, 40, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-05-2014', 'dd-mm-yyyy'), 1, 116, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-10-2014', 'dd-mm-yyyy'), 1, 216, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-03-2013', 'dd-mm-yyyy'), 1, 54, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-05-2005', 'dd-mm-yyyy'), 1, 208, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-03-1979', 'dd-mm-yyyy'), 1, 333, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-05-1989', 'dd-mm-yyyy'), 1, 282, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-08-1988', 'dd-mm-yyyy'), 1, 325, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-03-2021', 'dd-mm-yyyy'), 1, 103, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-12-1981', 'dd-mm-yyyy'), 1, 390, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-12-1980', 'dd-mm-yyyy'), 0, 57, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-06-1995', 'dd-mm-yyyy'), 0, 262, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-12-2005', 'dd-mm-yyyy'), 1, 369, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-06-2024', 'dd-mm-yyyy'), 1, 101, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-08-1980', 'dd-mm-yyyy'), 1, 392, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-04-1977', 'dd-mm-yyyy'), 0, 319, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-06-1991', 'dd-mm-yyyy'), 1, 220, 3);
commit;
prompt 100 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-10-1991', 'dd-mm-yyyy'), 0, 288, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-07-2022', 'dd-mm-yyyy'), 0, 37, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-05-1986', 'dd-mm-yyyy'), 0, 133, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-11-2024', 'dd-mm-yyyy'), 0, 190, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-1991', 'dd-mm-yyyy'), 0, 215, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-09-1987', 'dd-mm-yyyy'), 1, 301, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-09-2014', 'dd-mm-yyyy'), 1, 193, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-1979', 'dd-mm-yyyy'), 1, 290, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-07-2017', 'dd-mm-yyyy'), 0, 247, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-05-1987', 'dd-mm-yyyy'), 0, 2, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-08-1971', 'dd-mm-yyyy'), 0, 355, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-08-2015', 'dd-mm-yyyy'), 0, 65, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-04-2008', 'dd-mm-yyyy'), 0, 386, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-05-2018', 'dd-mm-yyyy'), 0, 132, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-01-1982', 'dd-mm-yyyy'), 1, 261, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-11-1973', 'dd-mm-yyyy'), 1, 51, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-04-1997', 'dd-mm-yyyy'), 1, 335, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-02-1974', 'dd-mm-yyyy'), 0, 201, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-05-2022', 'dd-mm-yyyy'), 0, 47, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-09-2024', 'dd-mm-yyyy'), 1, 377, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-06-1983', 'dd-mm-yyyy'), 0, 119, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1987', 'dd-mm-yyyy'), 0, 109, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-10-1996', 'dd-mm-yyyy'), 1, 69, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-02-1988', 'dd-mm-yyyy'), 0, 351, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-2004', 'dd-mm-yyyy'), 1, 353, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-11-1981', 'dd-mm-yyyy'), 1, 178, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-2017', 'dd-mm-yyyy'), 0, 384, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-1978', 'dd-mm-yyyy'), 1, 126, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-12-2015', 'dd-mm-yyyy'), 1, 90, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-04-1986', 'dd-mm-yyyy'), 0, 296, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-04-2015', 'dd-mm-yyyy'), 0, 28, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2015', 'dd-mm-yyyy'), 0, 205, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-03-2019', 'dd-mm-yyyy'), 1, 189, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-05-1983', 'dd-mm-yyyy'), 0, 89, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-08-2012', 'dd-mm-yyyy'), 1, 92, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-05-1993', 'dd-mm-yyyy'), 0, 309, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-1997', 'dd-mm-yyyy'), 0, 99, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-04-1985', 'dd-mm-yyyy'), 0, 177, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-1974', 'dd-mm-yyyy'), 1, 76, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-04-2009', 'dd-mm-yyyy'), 0, 355, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-10-1999', 'dd-mm-yyyy'), 1, 152, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-02-1982', 'dd-mm-yyyy'), 1, 321, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-12-2002', 'dd-mm-yyyy'), 1, 51, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-02-1992', 'dd-mm-yyyy'), 0, 53, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-2013', 'dd-mm-yyyy'), 1, 147, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-2017', 'dd-mm-yyyy'), 0, 393, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-11-2003', 'dd-mm-yyyy'), 0, 97, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-04-1997', 'dd-mm-yyyy'), 0, 274, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-2018', 'dd-mm-yyyy'), 0, 266, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-10-1985', 'dd-mm-yyyy'), 1, 249, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-06-1974', 'dd-mm-yyyy'), 1, 136, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-05-1996', 'dd-mm-yyyy'), 1, 250, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-01-1973', 'dd-mm-yyyy'), 1, 289, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-11-1980', 'dd-mm-yyyy'), 0, 381, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-09-1981', 'dd-mm-yyyy'), 0, 332, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-2015', 'dd-mm-yyyy'), 1, 363, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-07-1982', 'dd-mm-yyyy'), 1, 205, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-05-2003', 'dd-mm-yyyy'), 1, 150, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-02-2009', 'dd-mm-yyyy'), 1, 75, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2013', 'dd-mm-yyyy'), 1, 112, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2019', 'dd-mm-yyyy'), 0, 360, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-11-2009', 'dd-mm-yyyy'), 1, 354, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-04-1974', 'dd-mm-yyyy'), 0, 251, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 1, 258, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-02-2021', 'dd-mm-yyyy'), 1, 74, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-2001', 'dd-mm-yyyy'), 1, 252, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-08-1976', 'dd-mm-yyyy'), 1, 270, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-1981', 'dd-mm-yyyy'), 0, 202, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-06-2014', 'dd-mm-yyyy'), 0, 195, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-01-2007', 'dd-mm-yyyy'), 1, 28, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-10-1985', 'dd-mm-yyyy'), 1, 358, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1982', 'dd-mm-yyyy'), 1, 151, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-06-2006', 'dd-mm-yyyy'), 0, 72, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1973', 'dd-mm-yyyy'), 1, 158, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-05-2003', 'dd-mm-yyyy'), 1, 135, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-2014', 'dd-mm-yyyy'), 0, 98, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-12-1978', 'dd-mm-yyyy'), 0, 136, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-2004', 'dd-mm-yyyy'), 1, 385, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-01-1998', 'dd-mm-yyyy'), 1, 398, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-11-2008', 'dd-mm-yyyy'), 1, 338, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-2012', 'dd-mm-yyyy'), 0, 336, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-1977', 'dd-mm-yyyy'), 0, 181, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2012', 'dd-mm-yyyy'), 0, 7, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-07-1977', 'dd-mm-yyyy'), 0, 317, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-07-2011', 'dd-mm-yyyy'), 1, 311, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-06-1977', 'dd-mm-yyyy'), 1, 389, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-01-2005', 'dd-mm-yyyy'), 1, 19, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-12-2010', 'dd-mm-yyyy'), 0, 174, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-03-1987', 'dd-mm-yyyy'), 0, 6, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-10-2008', 'dd-mm-yyyy'), 0, 166, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-10-1977', 'dd-mm-yyyy'), 0, 399, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-12-2020', 'dd-mm-yyyy'), 0, 161, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-1983', 'dd-mm-yyyy'), 0, 215, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1998', 'dd-mm-yyyy'), 1, 233, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-03-2005', 'dd-mm-yyyy'), 1, 355, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-04-1996', 'dd-mm-yyyy'), 0, 57, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-12-2001', 'dd-mm-yyyy'), 0, 134, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1981', 'dd-mm-yyyy'), 1, 330, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-10-2024', 'dd-mm-yyyy'), 1, 372, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-02-1977', 'dd-mm-yyyy'), 1, 387, 1);
commit;
prompt 200 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-06-1995', 'dd-mm-yyyy'), 1, 173, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-01-2005', 'dd-mm-yyyy'), 0, 137, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1970', 'dd-mm-yyyy'), 1, 165, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-10-2001', 'dd-mm-yyyy'), 1, 329, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-06-1981', 'dd-mm-yyyy'), 0, 66, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-06-2022', 'dd-mm-yyyy'), 1, 327, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-09-2018', 'dd-mm-yyyy'), 1, 199, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-01-1981', 'dd-mm-yyyy'), 1, 80, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-04-1987', 'dd-mm-yyyy'), 0, 70, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-03-2002', 'dd-mm-yyyy'), 1, 60, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-10-1996', 'dd-mm-yyyy'), 1, 131, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-03-1991', 'dd-mm-yyyy'), 0, 325, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-1982', 'dd-mm-yyyy'), 0, 218, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-12-2013', 'dd-mm-yyyy'), 0, 362, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-11-1990', 'dd-mm-yyyy'), 1, 202, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-01-2020', 'dd-mm-yyyy'), 1, 359, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-10-1972', 'dd-mm-yyyy'), 0, 71, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-02-2009', 'dd-mm-yyyy'), 0, 293, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-02-2021', 'dd-mm-yyyy'), 1, 235, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-04-1981', 'dd-mm-yyyy'), 1, 51, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-11-2005', 'dd-mm-yyyy'), 0, 56, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-08-2000', 'dd-mm-yyyy'), 0, 172, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-04-1983', 'dd-mm-yyyy'), 0, 204, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-01-2005', 'dd-mm-yyyy'), 0, 156, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-01-1975', 'dd-mm-yyyy'), 1, 12, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-08-2011', 'dd-mm-yyyy'), 0, 194, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-09-1976', 'dd-mm-yyyy'), 0, 303, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-02-1984', 'dd-mm-yyyy'), 1, 8, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-09-2017', 'dd-mm-yyyy'), 1, 67, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-02-2003', 'dd-mm-yyyy'), 1, 18, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-12-2024', 'dd-mm-yyyy'), 0, 124, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-02-2006', 'dd-mm-yyyy'), 0, 78, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-09-1997', 'dd-mm-yyyy'), 1, 255, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-01-1985', 'dd-mm-yyyy'), 0, 196, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-02-2000', 'dd-mm-yyyy'), 0, 341, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-2022', 'dd-mm-yyyy'), 0, 276, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-02-1993', 'dd-mm-yyyy'), 0, 113, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-06-2000', 'dd-mm-yyyy'), 0, 83, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-01-1999', 'dd-mm-yyyy'), 0, 336, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-04-1974', 'dd-mm-yyyy'), 0, 244, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-04-1995', 'dd-mm-yyyy'), 0, 210, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-11-1997', 'dd-mm-yyyy'), 0, 257, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1975', 'dd-mm-yyyy'), 0, 206, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-02-2011', 'dd-mm-yyyy'), 1, 140, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1982', 'dd-mm-yyyy'), 1, 195, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-08-2009', 'dd-mm-yyyy'), 1, 130, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-03-1982', 'dd-mm-yyyy'), 0, 192, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-09-2003', 'dd-mm-yyyy'), 1, 114, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-12-2012', 'dd-mm-yyyy'), 1, 311, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2022', 'dd-mm-yyyy'), 0, 271, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-05-1996', 'dd-mm-yyyy'), 1, 58, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1993', 'dd-mm-yyyy'), 1, 28, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-10-1970', 'dd-mm-yyyy'), 1, 134, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-2008', 'dd-mm-yyyy'), 0, 328, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-12-2003', 'dd-mm-yyyy'), 1, 49, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-07-2011', 'dd-mm-yyyy'), 1, 79, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-10-2010', 'dd-mm-yyyy'), 1, 185, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-1995', 'dd-mm-yyyy'), 0, 16, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-08-2014', 'dd-mm-yyyy'), 0, 68, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-1973', 'dd-mm-yyyy'), 1, 396, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-02-2010', 'dd-mm-yyyy'), 0, 119, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-1984', 'dd-mm-yyyy'), 1, 182, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-10-1983', 'dd-mm-yyyy'), 0, 65, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('27-04-2021', 'dd-mm-yyyy'), 0, 82, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-10-2011', 'dd-mm-yyyy'), 1, 270, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-06-1993', 'dd-mm-yyyy'), 0, 91, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2004', 'dd-mm-yyyy'), 0, 324, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-07-1990', 'dd-mm-yyyy'), 0, 54, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-09-1982', 'dd-mm-yyyy'), 1, 60, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-1988', 'dd-mm-yyyy'), 0, 205, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-1977', 'dd-mm-yyyy'), 1, 135, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-06-2022', 'dd-mm-yyyy'), 1, 352, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-11-1987', 'dd-mm-yyyy'), 1, 101, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-08-2010', 'dd-mm-yyyy'), 1, 126, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-12-1995', 'dd-mm-yyyy'), 0, 182, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-01-2016', 'dd-mm-yyyy'), 0, 208, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2010', 'dd-mm-yyyy'), 1, 10, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-05-1995', 'dd-mm-yyyy'), 0, 270, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-10-1984', 'dd-mm-yyyy'), 0, 264, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-1985', 'dd-mm-yyyy'), 1, 392, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-10-2018', 'dd-mm-yyyy'), 1, 260, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-02-2004', 'dd-mm-yyyy'), 0, 211, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-04-1973', 'dd-mm-yyyy'), 1, 88, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1995', 'dd-mm-yyyy'), 0, 162, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-05-2022', 'dd-mm-yyyy'), 1, 108, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-12-1993', 'dd-mm-yyyy'), 0, 218, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-04-2022', 'dd-mm-yyyy'), 1, 162, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-05-2002', 'dd-mm-yyyy'), 1, 318, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-02-1986', 'dd-mm-yyyy'), 0, 378, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-07-2014', 'dd-mm-yyyy'), 1, 161, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-06-1977', 'dd-mm-yyyy'), 0, 241, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-11-1973', 'dd-mm-yyyy'), 1, 78, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-06-2011', 'dd-mm-yyyy'), 1, 246, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('02-06-1984', 'dd-mm-yyyy'), 1, 250, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-06-2006', 'dd-mm-yyyy'), 0, 332, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-07-1975', 'dd-mm-yyyy'), 1, 151, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-2014', 'dd-mm-yyyy'), 0, 138, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-01-1975', 'dd-mm-yyyy'), 0, 215, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('28-02-2013', 'dd-mm-yyyy'), 0, 280, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('10-01-2001', 'dd-mm-yyyy'), 1, 132, 4);
commit;
prompt 300 records committed...
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-05-1981', 'dd-mm-yyyy'), 0, 260, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('31-07-2011', 'dd-mm-yyyy'), 1, 160, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-01-1971', 'dd-mm-yyyy'), 1, 195, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-07-2023', 'dd-mm-yyyy'), 0, 275, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-03-2023', 'dd-mm-yyyy'), 1, 371, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-04-2014', 'dd-mm-yyyy'), 0, 334, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-09-1974', 'dd-mm-yyyy'), 0, 229, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-03-1992', 'dd-mm-yyyy'), 0, 70, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('08-05-1984', 'dd-mm-yyyy'), 1, 361, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('15-04-2015', 'dd-mm-yyyy'), 1, 110, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-10-2016', 'dd-mm-yyyy'), 1, 349, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-1990', 'dd-mm-yyyy'), 0, 18, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-12-1989', 'dd-mm-yyyy'), 0, 157, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-11-1983', 'dd-mm-yyyy'), 1, 115, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-10-1973', 'dd-mm-yyyy'), 0, 197, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-11-2004', 'dd-mm-yyyy'), 0, 15, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-09-2018', 'dd-mm-yyyy'), 0, 217, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('13-11-1983', 'dd-mm-yyyy'), 0, 51, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-02-1990', 'dd-mm-yyyy'), 1, 73, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-04-2008', 'dd-mm-yyyy'), 0, 79, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('25-11-2011', 'dd-mm-yyyy'), 1, 224, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-01-1973', 'dd-mm-yyyy'), 0, 172, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-06-2014', 'dd-mm-yyyy'), 0, 346, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('26-06-2018', 'dd-mm-yyyy'), 0, 155, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-03-2002', 'dd-mm-yyyy'), 0, 14, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-06-1973', 'dd-mm-yyyy'), 1, 32, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-07-1973', 'dd-mm-yyyy'), 0, 387, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-09-1983', 'dd-mm-yyyy'), 1, 53, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('11-09-1989', 'dd-mm-yyyy'), 0, 294, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-03-2018', 'dd-mm-yyyy'), 1, 210, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-10-1971', 'dd-mm-yyyy'), 1, 132, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-04-1996', 'dd-mm-yyyy'), 0, 4, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('16-12-2011', 'dd-mm-yyyy'), 1, 139, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('23-10-1972', 'dd-mm-yyyy'), 1, 323, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-02-1973', 'dd-mm-yyyy'), 1, 285, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-07-1987', 'dd-mm-yyyy'), 0, 210, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('24-11-2024', 'dd-mm-yyyy'), 1, 1, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('04-02-1975', 'dd-mm-yyyy'), 0, 326, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('07-06-2017', 'dd-mm-yyyy'), 0, 278, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('21-06-1990', 'dd-mm-yyyy'), 1, 144, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-07-1994', 'dd-mm-yyyy'), 0, 271, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('22-06-2001', 'dd-mm-yyyy'), 1, 237, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('12-08-2012', 'dd-mm-yyyy'), 0, 23, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('06-06-1989', 'dd-mm-yyyy'), 1, 301, 1);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('14-02-1971', 'dd-mm-yyyy'), 1, 239, 2);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-08-1992', 'dd-mm-yyyy'), 0, 346, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('01-03-1975', 'dd-mm-yyyy'), 1, 322, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-11-2007', 'dd-mm-yyyy'), 0, 12, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('20-10-2022', 'dd-mm-yyyy'), 1, 63, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('30-10-2011', 'dd-mm-yyyy'), 0, 70, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('19-12-2024', 'dd-mm-yyyy'), 0, 26, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('29-05-2003', 'dd-mm-yyyy'), 0, 370, 3);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('05-07-2013', 'dd-mm-yyyy'), 1, 367, 4);
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('09-12-1984', 'dd-mm-yyyy'), 1, 391, 2);
commit;
prompt 354 records loaded
prompt Loading WORKER...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (1, 'osnat', to_date('20-11-1974', 'dd-mm-yyyy'), 'פקידת קבלה');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (4, 'Shira', to_date('19-06-2016', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (2, 'Ron', to_date('19-06-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (3, 'Michal', to_date('09-05-2020', 'dd-mm-yyyy'), 'Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (5, 'Leonardo', to_date('30-03-1997', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (6, 'Bridget', to_date('15-09-2016', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (7, 'Dean', to_date('06-12-1985', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (8, 'Carrie-Anne', to_date('31-03-1971', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (9, 'Sylvester', to_date('14-03-2022', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (10, 'Benjamin', to_date('24-12-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (11, 'Faye', to_date('26-12-2011', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (12, 'Ellen', to_date('10-03-2005', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (13, 'Jeff', to_date('01-08-2023', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (14, 'Oliver', to_date('19-04-2020', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (15, 'Julie', to_date('25-01-1998', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (16, 'First', to_date('26-12-1978', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (17, 'Ellen', to_date('29-08-1994', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (18, 'Rob', to_date('16-02-1994', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (19, 'Owen', to_date('02-01-2015', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (20, 'Freda', to_date('10-12-2013', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (21, 'Matthew', to_date('06-07-1993', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (22, 'Boz', to_date('30-08-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (23, 'Brooke', to_date('17-12-1971', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (24, 'Keith', to_date('14-08-1977', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (25, 'Mena', to_date('26-10-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (26, 'Mira', to_date('02-10-2018', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (27, 'Susan', to_date('16-06-2018', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (28, 'Lari', to_date('25-06-2024', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (29, 'Fairuza', to_date('23-10-2002', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (30, 'Joaquin', to_date('07-03-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (31, 'Kelli', to_date('10-03-2005', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (32, 'Anita', to_date('30-06-1979', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (33, 'Gates', to_date('10-05-1987', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (34, 'Molly', to_date('04-11-2015', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (35, 'Crystal', to_date('16-01-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (36, 'Edward', to_date('02-07-2009', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (37, 'Lee', to_date('30-06-1993', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (38, 'Greg', to_date('01-02-1976', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (39, 'Elisabeth', to_date('19-05-2005', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (40, 'Udo', to_date('27-02-1981', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (41, 'Burt', to_date('17-04-1993', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (42, 'Bryan', to_date('08-05-2017', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (43, 'Famke', to_date('06-07-2000', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (44, 'Rachid', to_date('24-09-1977', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (45, 'Kristin', to_date('02-11-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (46, 'Lorraine', to_date('15-10-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (47, 'Johnny', to_date('24-11-1973', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (48, 'Ani', to_date('10-01-2006', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (49, 'Maria', to_date('28-10-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (50, 'Maxine', to_date('04-07-2012', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (51, 'Annie', to_date('25-06-1993', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (52, 'Mekhi', to_date('26-04-2018', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (53, 'Kyra', to_date('25-12-2008', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (54, 'Stephen', to_date('05-09-1993', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (55, 'Nigel', to_date('31-03-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (56, 'Brothers', to_date('15-12-2012', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (57, 'Oliver', to_date('22-04-1983', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (58, 'Davy', to_date('29-07-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (59, 'Anita', to_date('18-11-1984', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (60, 'Karen', to_date('09-02-1991', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (61, 'Elle', to_date('29-10-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (62, 'Lily', to_date('06-05-1970', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (63, 'Mitchell', to_date('16-02-1995', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (64, 'Kyle', to_date('04-10-2000', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (65, 'Carolyn', to_date('12-06-1992', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (66, 'Rosie', to_date('15-01-2019', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (67, 'Mykelti', to_date('01-03-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (68, 'Trick', to_date('29-11-2017', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (69, 'Charlton', to_date('05-01-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (70, 'Sinead', to_date('27-03-1975', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (71, 'Dustin', to_date('20-03-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (72, 'Cole', to_date('06-09-1978', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (73, 'Sona', to_date('03-09-1975', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (74, 'Warren', to_date('30-03-1970', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (75, 'Sander', to_date('16-02-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (76, 'Shannyn', to_date('31-08-2014', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (77, 'Maggie', to_date('06-03-1978', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (78, 'Charles', to_date('05-10-1983', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (79, 'David', to_date('11-08-1985', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (80, 'Lou', to_date('14-10-2022', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (81, 'Alessandro', to_date('12-09-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (82, 'Betty', to_date('15-06-1981', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (83, 'Breckin', to_date('25-06-1979', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (84, 'Anita', to_date('17-07-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (85, 'Leonardo', to_date('28-04-1984', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (86, 'Shannon', to_date('30-10-2020', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (87, 'Jennifer', to_date('22-12-1986', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (88, 'Juliana', to_date('15-04-1978', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (89, 'Eric', to_date('05-04-2012', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (90, 'Lloyd', to_date('16-05-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (91, 'Jeffrey', to_date('27-01-2000', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (92, 'Boz', to_date('08-01-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (93, 'Shannyn', to_date('11-06-2021', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (94, 'Jackson', to_date('28-10-1999', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (95, 'Peter', to_date('08-05-2021', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (96, 'Meryl', to_date('28-10-2017', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (97, 'Steve', to_date('27-01-1996', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (98, 'Vanessa', to_date('25-01-1994', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (99, 'Naomi', to_date('21-10-2018', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (100, 'Nastassja', to_date('13-11-1972', 'dd-mm-yyyy'), 'Teller');
commit;
prompt 100 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (101, 'Sara', to_date('12-04-2008', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (102, 'Ralph', to_date('01-01-2005', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (103, 'Eddie', to_date('08-09-2013', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (104, 'Aidan', to_date('04-09-2020', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (105, 'Emmylou', to_date('06-12-1974', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (106, 'Josh', to_date('15-05-1979', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (107, 'Gin', to_date('01-04-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (108, 'Bryan', to_date('22-01-1995', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (109, 'Tyrone', to_date('17-04-1973', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (110, 'Sona', to_date('17-05-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (111, 'Geena', to_date('11-01-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (112, 'Carl', to_date('22-11-1972', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (113, 'Carl', to_date('13-01-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (114, 'Rosanna', to_date('04-09-1986', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (115, 'Beth', to_date('09-12-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (116, 'Bruce', to_date('28-08-1980', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (117, 'Gena', to_date('29-10-2017', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (118, 'Tyrone', to_date('15-12-1978', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (119, 'Amanda', to_date('01-06-1988', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (120, 'Treat', to_date('27-05-2013', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (121, 'Cary', to_date('25-06-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (122, 'Joey', to_date('20-03-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (123, 'Owen', to_date('06-05-2001', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (124, 'Bill', to_date('08-08-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (125, 'Mike', to_date('08-06-2021', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (126, 'Kay', to_date('07-07-1985', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (127, 'Daryle', to_date('17-06-1974', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (128, 'Taylor', to_date('03-01-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (129, 'Cole', to_date('14-12-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (130, 'Taylor', to_date('29-09-2016', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (131, 'Terry', to_date('21-07-1982', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (132, 'Lenny', to_date('18-06-2008', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (133, 'Sean', to_date('02-06-2024', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (134, 'Eileen', to_date('22-09-2022', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (135, 'Chanté', to_date('03-08-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (136, 'Frances', to_date('11-05-1972', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (137, 'Gary', to_date('01-08-2021', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (138, 'Oliver', to_date('31-08-1974', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (139, 'Colm', to_date('12-08-2022', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (140, 'Willem', to_date('08-02-2005', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (141, 'Warren', to_date('21-07-2022', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (142, 'Roscoe', to_date('10-10-1995', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (143, 'Mint', to_date('09-01-1991', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (144, 'Ahmad', to_date('07-11-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (145, 'Treat', to_date('10-01-2020', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (146, 'Harrison', to_date('09-08-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (147, 'Nils', to_date('07-08-1984', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (148, 'Sona', to_date('26-04-2014', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (149, 'Caroline', to_date('18-12-1998', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (150, 'Chet', to_date('21-05-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (151, 'Vendetta', to_date('25-05-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (152, 'Joaquim', to_date('15-06-2011', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (153, 'Tom', to_date('14-09-2007', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (154, 'Tal', to_date('31-05-2000', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (155, 'Lisa', to_date('01-05-1985', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (156, 'Cloris', to_date('06-05-1979', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (157, 'Ivan', to_date('01-04-1973', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (158, 'Tracy', to_date('22-04-2014', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (159, 'Robby', to_date('05-02-1983', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (160, 'Andrew', to_date('25-06-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (161, 'Warren', to_date('26-03-1997', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (162, 'Hal', to_date('16-08-2005', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (163, 'Marianne', to_date('15-10-2020', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (164, 'Barry', to_date('28-05-1998', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (165, 'Alana', to_date('29-09-2012', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (166, 'Mitchell', to_date('21-03-2007', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (167, 'Kitty', to_date('08-04-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (168, 'Mira', to_date('24-04-2002', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (169, 'Solomon', to_date('23-01-2006', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (170, 'Christian', to_date('22-04-1976', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (171, 'Robbie', to_date('26-03-2021', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (172, 'Trick', to_date('06-02-2008', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (173, 'Eileen', to_date('26-12-1985', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (174, 'Mary Beth', to_date('30-01-2014', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (175, 'Greg', to_date('06-07-1994', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (176, 'Rosanna', to_date('04-01-2002', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (177, 'Sydney', to_date('08-04-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (178, 'Bob', to_date('30-05-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (179, 'Dianne', to_date('28-12-2005', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (180, 'Sal', to_date('10-10-1992', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (181, 'Sean', to_date('17-05-1993', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (182, 'Lindsey', to_date('03-12-2021', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (183, 'Jude', to_date('13-04-1998', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (184, 'Noah', to_date('12-12-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (185, 'Edgar', to_date('25-07-2002', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (186, 'Drew', to_date('06-07-2019', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (187, 'Miko', to_date('12-12-2007', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (188, 'Avril', to_date('05-11-2004', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (189, 'Aida', to_date('04-01-1990', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (190, 'Heather', to_date('24-01-2002', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (191, 'Larenz', to_date('16-12-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (192, 'Vanessa', to_date('15-04-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (193, 'Meg', to_date('24-06-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (194, 'Sal', to_date('28-12-1996', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (195, 'Keith', to_date('12-09-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (196, 'Colm', to_date('04-01-1996', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (197, 'Ricky', to_date('24-09-1975', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (198, 'Gran', to_date('13-10-2013', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (199, 'Ricky', to_date('12-08-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (200, 'Hookah', to_date('20-06-1977', 'dd-mm-yyyy'), 'Teller');
commit;
prompt 200 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (201, 'Neve', to_date('23-09-2008', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (202, 'Lionel', to_date('14-09-1984', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (203, 'Marty', to_date('05-06-2012', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (204, 'Harris', to_date('10-06-2009', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (205, 'Kid', to_date('22-04-1982', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (206, 'Judy', to_date('30-05-1981', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (207, 'Rita', to_date('16-06-1998', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (208, 'Giovanni', to_date('03-08-1972', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (209, 'Rhett', to_date('17-10-2003', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (210, 'Carlos', to_date('02-01-1983', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (211, 'James', to_date('10-06-1984', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (212, 'Trick', to_date('28-11-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (213, 'Bernie', to_date('16-11-2022', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (214, 'Greg', to_date('13-11-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (215, 'Mary Beth', to_date('24-12-1985', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (216, 'Cameron', to_date('01-10-1995', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (217, 'Lou', to_date('21-08-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (218, 'Debbie', to_date('11-04-1976', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (219, 'Mitchell', to_date('29-05-2019', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (220, 'Gilberto', to_date('25-10-2012', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (221, 'Jon', to_date('08-07-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (222, 'Bernard', to_date('24-08-2023', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (223, 'Natacha', to_date('10-10-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (224, 'Ritchie', to_date('25-04-1983', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (225, 'Talvin', to_date('03-09-2016', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (226, 'Miki', to_date('17-11-1979', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (227, 'Sissy', to_date('03-04-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (228, 'Gina', to_date('13-03-2014', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (229, 'Gilbert', to_date('09-01-1982', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (230, 'Rene', to_date('17-03-2009', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (231, 'Brothers', to_date('23-01-1971', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (232, 'Johnette', to_date('16-02-2013', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (233, 'Joaquin', to_date('11-11-2024', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (234, 'Azucar', to_date('02-07-1980', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (235, 'Bridgette', to_date('24-10-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (236, 'Marlon', to_date('25-08-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (237, 'Lois', to_date('22-11-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (238, 'Connie', to_date('08-11-2010', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (239, 'Mekhi', to_date('15-11-1997', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (240, 'Lily', to_date('29-08-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (241, 'Robbie', to_date('16-01-2017', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (242, 'Judi', to_date('09-01-1990', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (243, 'Katrin', to_date('30-01-1973', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (244, 'Louise', to_date('11-03-1986', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (245, 'Warren', to_date('14-06-2010', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (246, 'Randy', to_date('30-12-2014', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (247, 'Claude', to_date('15-12-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (248, 'Phil', to_date('02-02-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (249, 'Dylan', to_date('31-05-2024', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (250, 'Roddy', to_date('24-09-1992', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (251, 'Gates', to_date('24-03-1974', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (252, 'Mac', to_date('27-01-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (253, 'Ving', to_date('23-03-1984', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (254, 'Sandra', to_date('18-11-1982', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (255, 'Rhys', to_date('04-05-1974', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (256, 'Tea', to_date('27-04-1996', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (257, 'Tea', to_date('25-03-1992', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (258, 'Willie', to_date('12-01-2006', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (259, 'Joshua', to_date('28-03-1998', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (260, 'Isabella', to_date('03-07-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (261, 'Isaiah', to_date('13-06-2001', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (262, 'Jose', to_date('05-10-1981', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (263, 'Harris', to_date('07-08-1997', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (264, 'Loreena', to_date('13-12-1977', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (265, 'Neil', to_date('01-09-2019', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (266, 'Avril', to_date('31-07-1979', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (267, 'Nicolas', to_date('21-04-2006', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (268, 'Whoopi', to_date('07-05-2019', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (269, 'Jeremy', to_date('16-10-1971', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (270, 'Brittany', to_date('30-06-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (271, 'Rik', to_date('27-10-2005', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (272, 'Ming-Na', to_date('27-02-2001', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (273, 'Kurtwood', to_date('23-11-2011', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (274, 'Adina', to_date('03-11-1972', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (275, 'Eugene', to_date('01-11-2001', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (276, 'Mary', to_date('18-09-1973', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (277, 'Illeana', to_date('03-04-2000', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (278, 'Busta', to_date('27-07-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (279, 'Mitchell', to_date('20-03-2024', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (280, 'Jann', to_date('20-07-1973', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (281, 'Kiefer', to_date('23-04-2009', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (282, 'Harvey', to_date('11-02-2006', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (283, 'Gin', to_date('20-03-1996', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (284, 'Grace', to_date('18-07-2017', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (285, 'Rolando', to_date('11-04-1996', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (286, 'Bruce', to_date('06-08-1997', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (287, 'Mia', to_date('23-06-1982', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (288, 'Ron', to_date('01-12-1984', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (289, 'Crispin', to_date('24-12-1983', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (290, 'Roscoe', to_date('12-12-2024', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (291, 'Marie', to_date('22-03-2019', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (292, 'Nikka', to_date('27-01-2017', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (293, 'Illeana', to_date('31-12-2014', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (294, 'Anjelica', to_date('15-03-1996', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (295, 'Emily', to_date('03-10-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (296, 'Cheech', to_date('11-12-1988', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (297, 'Scott', to_date('07-04-1983', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (298, 'Gena', to_date('17-01-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (299, 'Terence', to_date('07-02-2009', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (300, 'Ossie', to_date('06-04-1974', 'dd-mm-yyyy'), 'Credit Analyst');
commit;
prompt 300 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (301, 'Demi', to_date('24-09-2010', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (302, 'Claire', to_date('24-05-2018', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (303, 'Jonathan', to_date('27-05-1998', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (304, 'Andrew', to_date('17-11-2010', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (305, 'Trini', to_date('20-08-2015', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (306, 'Gary', to_date('27-07-2008', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (307, 'Bernie', to_date('02-06-2022', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (308, 'Goran', to_date('04-03-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (309, 'Rose', to_date('15-08-1992', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (310, 'Rickie', to_date('05-05-1974', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (311, 'Jet', to_date('27-04-1997', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (312, 'Maureen', to_date('30-01-2001', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (313, 'Katie', to_date('26-08-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (314, 'Louise', to_date('27-11-1988', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (315, 'Johnnie', to_date('27-06-1993', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (316, 'Bridget', to_date('10-04-1975', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (317, 'Joanna', to_date('26-06-1977', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (318, 'Rueben', to_date('07-08-2014', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (319, 'Giancarlo', to_date('25-01-1970', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (320, 'Earl', to_date('30-07-1994', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (321, 'Miranda', to_date('03-03-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (322, 'Wayman', to_date('08-11-1993', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (323, 'Boyd', to_date('27-07-1978', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (324, 'Andie', to_date('27-08-1990', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (325, 'Harry', to_date('01-11-2014', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (326, 'Clea', to_date('07-10-1973', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (327, 'Emm', to_date('11-08-1997', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (328, 'Elijah', to_date('30-06-1971', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (329, 'Edie', to_date('13-09-1985', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (330, 'Veruca', to_date('02-04-2007', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (331, 'Denny', to_date('21-09-2004', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (332, 'Antonio', to_date('29-03-1985', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (333, 'Daryle', to_date('08-02-2009', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (334, 'Tea', to_date('07-08-1972', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (335, 'Bruce', to_date('07-10-2024', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (336, 'Earl', to_date('22-06-2023', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (337, 'Isaiah', to_date('24-12-1997', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (338, 'Treat', to_date('18-01-2017', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (339, 'Mint', to_date('09-05-2018', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (340, 'Larenz', to_date('17-11-1998', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (341, 'Gran', to_date('18-01-1999', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (342, 'Ewan', to_date('16-07-1978', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (343, 'Lionel', to_date('13-05-1982', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (344, 'Lonnie', to_date('27-12-2000', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (345, 'Devon', to_date('14-09-2008', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (346, 'Joanna', to_date('29-10-2003', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (347, 'Jim', to_date('09-06-1988', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (348, 'Ed', to_date('26-05-2002', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (349, 'Josh', to_date('29-04-2014', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (350, 'Lizzy', to_date('04-09-1974', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (351, 'Cuba', to_date('15-01-2009', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (352, 'Collective', to_date('20-08-2016', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (353, 'Micky', to_date('26-06-2007', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (354, 'Brooke', to_date('16-09-1987', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (355, 'Denis', to_date('13-06-1999', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (356, 'Mac', to_date('12-08-2017', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (357, 'Al', to_date('19-04-2004', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (358, 'Mena', to_date('07-03-2022', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (359, 'Luis', to_date('14-10-2002', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (360, 'Peter', to_date('30-04-1989', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (361, 'Charles', to_date('12-12-2011', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (362, 'Greg', to_date('10-10-2023', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (363, 'Chuck', to_date('18-12-2003', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (364, 'Burt', to_date('26-03-1993', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (365, 'Rip', to_date('25-12-2003', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (366, 'Jane', to_date('24-02-1996', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (367, 'Jason', to_date('13-02-1987', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (368, 'Cevin', to_date('13-06-1989', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (369, 'Morris', to_date('23-01-1981', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (370, 'Christian', to_date('09-11-1980', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (371, 'Irene', to_date('13-12-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (372, 'Hilary', to_date('27-09-1986', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (373, 'Ralph', to_date('17-03-1987', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (374, 'Chrissie', to_date('16-11-1984', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (375, 'Tara', to_date('30-12-1971', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (376, 'Colin', to_date('06-12-2009', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (377, 'Mekhi', to_date('23-08-2020', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (378, 'Forest', to_date('25-10-1983', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (379, 'Bebe', to_date('09-10-2007', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (380, 'Debra', to_date('07-03-1992', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (381, 'Marianne', to_date('15-12-2011', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (382, 'Julianna', to_date('08-08-1977', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (383, 'Rosanne', to_date('14-05-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (384, 'Patti', to_date('13-04-1988', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (385, 'Sally', to_date('03-01-2001', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (386, 'Mitchell', to_date('16-03-1979', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (387, 'Shirley', to_date('28-10-2016', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (388, 'Buffy', to_date('02-12-2018', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (389, 'Matthew', to_date('24-11-1997', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (390, 'Ernest', to_date('27-08-1995', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (391, 'Connie', to_date('16-06-1998', 'dd-mm-yyyy'), 'Teller');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (392, 'Brenda', to_date('17-07-2024', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (393, 'Mandy', to_date('19-11-2016', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (394, 'Ernie', to_date('07-06-2019', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (395, 'Dwight', to_date('03-12-2021', 'dd-mm-yyyy'), 'Financial Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (396, 'Andrae', to_date('21-04-1981', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (397, 'Laura', to_date('07-02-2016', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (398, 'Heather', to_date('20-01-2007', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (399, 'James', to_date('14-09-1970', 'dd-mm-yyyy'), 'Credit Analyst');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (400, 'Miriam', to_date('08-03-1970', 'dd-mm-yyyy'), 'Customer Service Representativ');
commit;
prompt 400 records committed...
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (401, 'Tal', to_date('11-06-1984', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (402, 'Carolyn', to_date('22-04-2000', 'dd-mm-yyyy'), 'Investment Advisor');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (403, 'Casey', to_date('29-04-1974', 'dd-mm-yyyy'), 'Business Account Manager');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (404, 'Lila', to_date('15-04-2004', 'dd-mm-yyyy'), 'Customer Service Representativ');
insert into WORKER (workerid, workername, workerbirthdate, workerrole)
values (405, 'Naomi', to_date('12-03-2001', 'dd-mm-yyyy'), 'Branch Manager');
commit;
prompt 405 records loaded
prompt Enabling foreign key constraints for ACOUNT...
alter table ACOUNT enable constraint SYS_C007110;
prompt Enabling foreign key constraints for ACTIVITY...
alter table ACTIVITY enable constraint SYS_C007122;
alter table ACTIVITY enable constraint SYS_C007123;
alter table ACTIVITY enable constraint SYS_C007124;
prompt Enabling foreign key constraints for LOANTOACCOUNT...
alter table LOANTOACCOUNT enable constraint SYS_C007135;
alter table LOANTOACCOUNT enable constraint SYS_C007136;
prompt Enabling triggers for BRANCH...
alter table BRANCH enable all triggers;
prompt Enabling triggers for ACOUNT...
alter table ACOUNT enable all triggers;
prompt Enabling triggers for ACTIONS...
alter table ACTIONS enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for ACTIVITY...
alter table ACTIVITY enable all triggers;
prompt Enabling triggers for LOAN...
alter table LOAN enable all triggers;
prompt Enabling triggers for LOANTOACCOUNT...
alter table LOANTOACCOUNT enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
set feedback on
set define on
prompt Done.
