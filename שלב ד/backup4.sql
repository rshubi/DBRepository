prompt PL/SQL Developer import file
prompt Created on Sunday, 21 July 2024 by renan
set feedback off
set define off
prompt Creating BRANCH...
create table BRANCH
(
  branchid      NUMBER(5) not null,
  branchaddress VARCHAR2(30) not null,
  branchmanager VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BRANCH
  add primary key (BRANCHID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACOUNT...
create table ACOUNT
(
  accountid     NUMBER(5) not null,
  balance       INTEGER default 0 not null,
  accountnumber INTEGER not null,
  branchid      NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACOUNT
  add primary key (ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACOUNT
  add foreign key (BRANCHID)
  references BRANCH (BRANCHID);

prompt Creating ACTIONS...
create table ACTIONS
(
  actionid   NUMBER(5) not null,
  actionname VARCHAR2(30) not null,
  actionsum  INTEGER not null,
  actiondate DATE default SYSDATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIONS
  add primary key (ACTIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMERS...
create table CUSTOMERS
(
  customerid       INTEGER not null,
  firstname        VARCHAR2(50) not null,
  lastname         VARCHAR2(50) not null,
  phonenumber      VARCHAR2(15) not null,
  birthdaydate     DATE not null,
  lastpurchasedate DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERS
  add primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating VENUES...
create table VENUES
(
  venueid        INTEGER not null,
  name           VARCHAR2(100) not null,
  location       VARCHAR2(255) not null,
  capacity       INTEGER not null,
  opendate       DATE not null,
  renovationdate DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VENUES
  add primary key (VENUEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EVENTS_...
create table EVENTS_
(
  eventid               INTEGER not null,
  eventdate             DATE not null,
  eventconfirmationdate DATE,
  customerid            INTEGER not null,
  venueid               INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENTS_
  add primary key (EVENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENTS_
  add foreign key (VENUEID)
  references VENUES (VENUEID);
alter table EVENTS_
  add foreign key (CUSTOMERID)
  references CUSTOMERS (CUSTOMERID);

prompt Creating PAYMENTS...
create table PAYMENTS
(
  paymentid           INTEGER not null,
  amount              NUMBER(10,2) not null,
  paymentdate         DATE not null,
  paymentdeadlinedate DATE,
  customerid          INTEGER not null,
  eventid             INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAYMENTS
  add primary key (PAYMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PAYMENTS
  add foreign key (EVENTID)
  references EVENTS_ (EVENTID);

prompt Creating ACTIONSTOPAYMENTS...
create table ACTIONSTOPAYMENTS
(
  actionid  NUMBER(5) not null,
  paymentid NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIONSTOPAYMENTS
  add primary key (ACTIONID, PAYMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIONSTOPAYMENTS
  add constraint UNIQ_ACTIONID unique (ACTIONID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIONSTOPAYMENTS
  add constraint UNIQ_PAYMENTID unique (PAYMENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIONSTOPAYMENTS
  add foreign key (ACTIONID)
  references ACTIONS (ACTIONID);
alter table ACTIONSTOPAYMENTS
  add foreign key (PAYMENTID)
  references PAYMENTS (PAYMENTID);

prompt Creating CLIENT...
create table CLIENT
(
  clientid       NUMBER(5) not null,
  clientname     VARCHAR2(30) not null,
  clientaddress  VARCHAR2(30) not null,
  clientlastname VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (CLIENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add constraint CHK_CLIENT_NAME
  check (LENGTH(ClientName) > 1);

prompt Creating WORKER...
create table WORKER
(
  workerid        INTEGER not null,
  workername      VARCHAR2(30) not null,
  workerbirthdate DATE,
  workerrole      VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ACTIVITY...
create table ACTIVITY
(
  activityid NUMBER(5) not null,
  clientid   NUMBER(5) not null,
  actionid   NUMBER(5) not null,
  accountid  NUMBER(5) not null,
  workerid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add primary key (ACTIVITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add foreign key (CLIENTID)
  references CLIENT (CLIENTID);
alter table ACTIVITY
  add foreign key (ACTIONID)
  references ACTIONS (ACTIONID);
alter table ACTIVITY
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);
alter table ACTIVITY
  add foreign key (WORKERID)
  references WORKER (WORKERID);

prompt Creating CATERING...
create table CATERING
(
  cateringid        INTEGER not null,
  name              VARCHAR2(100) not null,
  menudescription   VARCHAR2(500) not null,
  contractstartdate DATE not null,
  contractenddate   DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CATERING
  add primary key (CATERINGID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOMERSTOCLIENT...
create table CUSTOMERSTOCLIENT
(
  clientid   NUMBER(5) not null,
  customerid NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERSTOCLIENT
  add primary key (CUSTOMERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMERSTOCLIENT
  add foreign key (CLIENTID)
  references CLIENT (CLIENTID);
alter table CUSTOMERSTOCLIENT
  add foreign key (CUSTOMERID)
  references CUSTOMERS (CUSTOMERID);

prompt Creating GUSTS...
create table GUSTS
(
  gustid            INTEGER not null,
  relationshiplevel VARCHAR2(50) not null,
  firstname         VARCHAR2(50) not null,
  lastname          VARCHAR2(50) not null,
  invitationdate    DATE not null,
  confirmationdate  DATE,
  rsvpstatus        VARCHAR2(50),
  eventid           INTEGER not null,
  customerid        INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GUSTS
  add primary key (GUSTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table GUSTS
  add foreign key (EVENTID)
  references EVENTS_ (EVENTID);

prompt Creating HAS_CATERING...
create table HAS_CATERING
(
  cateringid INTEGER not null,
  eventid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAS_CATERING
  add primary key (CATERINGID, EVENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HAS_CATERING
  add foreign key (CATERINGID)
  references CATERING (CATERINGID);
alter table HAS_CATERING
  add foreign key (EVENTID)
  references EVENTS_ (EVENTID);

prompt Creating LOAN...
create table LOAN
(
  loanid      NUMBER(5) not null,
  numofpaymet NUMBER(5) not null,
  loansum     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOAN
  add primary key (LOANID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating LOANTOACCOUNT...
create table LOANTOACCOUNT
(
  loandate      DATE not null,
  returnedornot NUMBER(5) not null,
  loanid        NUMBER(5) not null,
  accountid     NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANTOACCOUNT
  add primary key (LOANID, ACCOUNTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LOANTOACCOUNT
  add foreign key (LOANID)
  references LOAN (LOANID);
alter table LOANTOACCOUNT
  add foreign key (ACCOUNTID)
  references ACOUNT (ACCOUNTID);

prompt Disabling triggers for BRANCH...
alter table BRANCH disable all triggers;
prompt Disabling triggers for ACOUNT...
alter table ACOUNT disable all triggers;
prompt Disabling triggers for ACTIONS...
alter table ACTIONS disable all triggers;
prompt Disabling triggers for CUSTOMERS...
alter table CUSTOMERS disable all triggers;
prompt Disabling triggers for VENUES...
alter table VENUES disable all triggers;
prompt Disabling triggers for EVENTS_...
alter table EVENTS_ disable all triggers;
prompt Disabling triggers for PAYMENTS...
alter table PAYMENTS disable all triggers;
prompt Disabling triggers for ACTIONSTOPAYMENTS...
alter table ACTIONSTOPAYMENTS disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for ACTIVITY...
alter table ACTIVITY disable all triggers;
prompt Disabling triggers for CATERING...
alter table CATERING disable all triggers;
prompt Disabling triggers for CUSTOMERSTOCLIENT...
alter table CUSTOMERSTOCLIENT disable all triggers;
prompt Disabling triggers for GUSTS...
alter table GUSTS disable all triggers;
prompt Disabling triggers for HAS_CATERING...
alter table HAS_CATERING disable all triggers;
prompt Disabling triggers for LOAN...
alter table LOAN disable all triggers;
prompt Disabling triggers for LOANTOACCOUNT...
alter table LOANTOACCOUNT disable all triggers;
prompt Disabling foreign key constraints for ACOUNT...
alter table ACOUNT disable constraint SYS_C007110;
prompt Disabling foreign key constraints for EVENTS_...
alter table EVENTS_ disable constraint SYS_C007470;
alter table EVENTS_ disable constraint SYS_C007492;
prompt Disabling foreign key constraints for PAYMENTS...
alter table PAYMENTS disable constraint SYS_C007491;
prompt Disabling foreign key constraints for ACTIONSTOPAYMENTS...
alter table ACTIONSTOPAYMENTS disable constraint SYS_C007565;
alter table ACTIONSTOPAYMENTS disable constraint SYS_C007566;
prompt Disabling foreign key constraints for ACTIVITY...
alter table ACTIVITY disable constraint SYS_C007122;
alter table ACTIVITY disable constraint SYS_C007123;
alter table ACTIVITY disable constraint SYS_C007124;
alter table ACTIVITY disable constraint SYS_C007579;
prompt Disabling foreign key constraints for CUSTOMERSTOCLIENT...
alter table CUSTOMERSTOCLIENT disable constraint SYS_C007548;
alter table CUSTOMERSTOCLIENT disable constraint SYS_C007549;
prompt Disabling foreign key constraints for GUSTS...
alter table GUSTS disable constraint SYS_C007479;
prompt Disabling foreign key constraints for HAS_CATERING...
alter table HAS_CATERING disable constraint SYS_C007483;
alter table HAS_CATERING disable constraint SYS_C007484;
prompt Disabling foreign key constraints for LOANTOACCOUNT...
alter table LOANTOACCOUNT disable constraint SYS_C007135;
alter table LOANTOACCOUNT disable constraint SYS_C007136;
prompt Deleting LOANTOACCOUNT...
delete from LOANTOACCOUNT;
commit;
prompt Deleting LOAN...
delete from LOAN;
commit;
prompt Deleting HAS_CATERING...
delete from HAS_CATERING;
commit;
prompt Deleting GUSTS...
delete from GUSTS;
commit;
prompt Deleting CUSTOMERSTOCLIENT...
delete from CUSTOMERSTOCLIENT;
commit;
prompt Deleting CATERING...
delete from CATERING;
commit;
prompt Deleting ACTIVITY...
delete from ACTIVITY;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting ACTIONSTOPAYMENTS...
delete from ACTIONSTOPAYMENTS;
commit;
prompt Deleting PAYMENTS...
delete from PAYMENTS;
commit;
prompt Deleting EVENTS_...
delete from EVENTS_;
commit;
prompt Deleting VENUES...
delete from VENUES;
commit;
prompt Deleting CUSTOMERS...
delete from CUSTOMERS;
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
insert into BRANCH (branchid, branchaddress, branchmanager)
values (404, 'RabiAkiva 55,Bnei Brak', 'Michael');
insert into BRANCH (branchid, branchaddress, branchmanager)
values (405, 'RabiAkiva 55,Bnei Brak', 'Michael');
commit;
prompt 405 records loaded
prompt Loading ACOUNT...
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (1, 400, 123456, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (2, 0, 654321, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (3, 734, 615243, 1);
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
values (105, 337754, 990328, 144);
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
values (125, 201005, 106692, 141);
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
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (405, 200, 123456, 1);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (406, 0, 654321, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (407, 0, 777771, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (408, 20000, 1408, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (409, 20000, 1409, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (410, 20000, 1410, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (411, 20000, 1411, 2);
insert into ACOUNT (accountid, balance, accountnumber, branchid)
values (412, 567899, 1412, 1);
commit;
prompt 412 records loaded
prompt Loading ACTIONS...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (2, 'deposit', 100, to_date('12-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (3, 'deposit', 20, to_date('06-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (4, 'deposit', 340, to_date('22-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (5, 'Transferring Funds', 460493, to_date('06-06-1982', 'dd-mm-yyyy'));
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
values (18, 'Withdrawing Funds', 965692, to_date('21-09-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (20, 'Transferring Funds', 680685, to_date('11-04-2006', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (21, 'deposit', 776344, to_date('14-07-1991', 'dd-mm-yyyy'));
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
values (30, 'Withdrawing Funds', 688258, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (31, 'Withdrawing Funds', 86601, to_date('24-05-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (32, 'deposit', 188120, to_date('22-06-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (33, 'Transferring Funds', 595649, to_date('02-01-2020', 'dd-mm-yyyy'));
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
values (64, 'Transferring Funds', 326704, to_date('01-06-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (66, 'deposit', 561940, to_date('18-04-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (67, 'Transferring Funds', 720854, to_date('29-12-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (68, 'Transferring Funds', 41951, to_date('17-06-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (69, 'Withdrawing Funds', 135840, to_date('04-03-1990', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (71, 'Transferring Funds', 731983, to_date('29-08-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (72, 'deposit', 969829, to_date('19-06-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (73, 'Transferring Funds', 134342, to_date('09-01-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (74, 'deposit', 802199, to_date('22-04-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (76, 'Withdrawing Funds', 848436, to_date('09-05-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (77, 'Transferring Funds', 579198, to_date('14-12-1985', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (78, 'Transferring Funds', 790597, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (79, 'Transferring Funds', 167461, to_date('22-01-2020', 'dd-mm-yyyy'));
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
values (88, 'Withdrawing Funds', 794859, to_date('17-07-1992', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (89, 'Transferring Funds', 401669, to_date('16-09-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (90, 'Transferring Funds', 333592, to_date('06-02-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (91, 'Withdrawing Funds', 89234, to_date('21-11-2000', 'dd-mm-yyyy'));
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
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (101, 'Withdrawing Funds', 636595, to_date('09-06-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (102, 'Transferring Funds', 584858, to_date('21-09-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (103, 'deposit', 76497, to_date('31-10-2010', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (107, 'Withdrawing Funds', 800501, to_date('11-07-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (108, 'deposit', 195344, to_date('11-10-2000', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (109, 'Transferring Funds', 38895, to_date('12-07-2005', 'dd-mm-yyyy'));
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
commit;
prompt 100 records committed...
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
values (137, 'deposit', 228286, to_date('24-06-2001', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (138, 'Transferring Funds', 435175, to_date('28-06-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (139, 'deposit', 791601, to_date('27-04-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (141, 'Transferring Funds', 319361, to_date('13-10-1991', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (143, 'Withdrawing Funds', 90545, to_date('01-08-1986', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (144, 'Transferring Funds', 295856, to_date('06-11-2010', 'dd-mm-yyyy'));
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
values (152, 'Withdrawing Funds', 884386, to_date('28-07-1993', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (153, 'deposit', 406958, to_date('28-11-2011', 'dd-mm-yyyy'));
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
values (190, 'deposit', 187102, to_date('26-11-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (191, 'Transferring Funds', 821620, to_date('29-03-1996', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (192, 'Transferring Funds', 194308, to_date('09-01-2012', 'dd-mm-yyyy'));
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
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (201, 'deposit', 88572, to_date('18-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (203, 'deposit', 135408, to_date('29-11-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (204, 'deposit', 408552, to_date('15-11-1987', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (205, 'Transferring Funds', 735796, to_date('26-11-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (207, 'Transferring Funds', 191176, to_date('17-09-1998', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (209, 'Transferring Funds', 455392, to_date('24-03-2002', 'dd-mm-yyyy'));
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
values (217, 'Transferring Funds', 855557, to_date('22-05-1992', 'dd-mm-yyyy'));
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
values (225, 'Transferring Funds', 82529, to_date('05-10-2009', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (226, 'deposit', 702335, to_date('02-06-1994', 'dd-mm-yyyy'));
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
values (242, 'Transferring Funds', 440880, to_date('29-07-1984', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (243, 'Withdrawing Funds', 6280, to_date('13-02-1994', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
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
values (254, 'deposit', 124624, to_date('26-08-1992', 'dd-mm-yyyy'));
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
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (301, 'Withdrawing Funds', 445884, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (303, 'Transferring Funds', 577797, to_date('29-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (305, 'Transferring Funds', 820319, to_date('30-12-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (306, 'Transferring Funds', 260619, to_date('07-08-2005', 'dd-mm-yyyy'));
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
values (316, 'Transferring Funds', 569739, to_date('19-03-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (317, 'Transferring Funds', 741278, to_date('02-04-1999', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (319, 'deposit', 343572, to_date('24-04-1980', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (320, 'Transferring Funds', 334557, to_date('13-09-2012', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (321, 'Transferring Funds', 884223, to_date('02-10-2020', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (322, 'Transferring Funds', 580451, to_date('03-08-1988', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (323, 'Withdrawing Funds', 661055, to_date('16-06-2024', 'dd-mm-yyyy'));
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
commit;
prompt 300 records committed...
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (355, 'deposit', 379107, to_date('30-06-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (357, 'deposit', 778754, to_date('04-05-2005', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (358, 'deposit', 918025, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (359, 'deposit', 341833, to_date('09-12-2018', 'dd-mm-yyyy'));
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
values (368, 'Withdrawing Funds', 572130, to_date('25-07-1983', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (369, 'deposit', 492930, to_date('23-12-2021', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (372, 'Withdrawing Funds', 203544, to_date('17-05-2022', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (373, 'Withdrawing Funds', 811066, to_date('10-02-1988', 'dd-mm-yyyy'));
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
values (397, 'deposit', 716812, to_date('28-04-2003', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (398, 'Transferring Funds', 55216, to_date('20-10-2007', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (399, 'Withdrawing Funds', 122870, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (400, 'deposit', 865331, to_date('21-12-2011', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (401, 'Transferring Funds', 168848, to_date('09-02-2016', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (403, 'Transferring Funds', 954640, to_date('04-03-2019', 'dd-mm-yyyy'));
insert into ACTIONS (actionid, actionname, actionsum, actiondate)
values (404, 'deposit', 111111, to_date('16-06-2024 21:47:28', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 340 records loaded
prompt Loading CUSTOMERS...
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1000, 'Rene', 'Ali', '0565733703', to_date('01-06-1984', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1001, 'Keith', 'Van Shelton', '0581872701', to_date('25-08-1978', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1002, 'Tim', 'Statham', '0591857884', to_date('08-05-1997', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1003, 'Cyndi', 'McGinley', '0576984268', to_date('04-03-1987', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1004, 'Carla', 'Turner', '0519397861', to_date('02-06-1994', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1005, 'Paul', 'Checker', '0532219973', to_date('27-02-2000', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1006, 'Corey', 'Schiavelli', '0581051159', to_date('08-09-1990', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1007, 'Clive', 'Lindley', '0544309957', to_date('28-06-1977', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1008, 'Jean-Claude', 'Giannini', '0555180193', to_date('08-06-1997', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1009, 'Emmylou', 'Zeta-Jones', '0521854909', to_date('10-10-2000', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1010, 'Rolando', 'Nash', '0577973379', to_date('04-06-1983', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1011, 'Miko', 'Mitra', '0592603228', to_date('24-04-2008', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1012, 'Annette', 'Chinlund', '0543846450', to_date('20-01-1976', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1013, 'Juan', 'Williams', '0510461723', to_date('21-05-1998', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1014, 'Cevin', 'Rea', '0526355761', to_date('01-09-1973', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1015, 'Andre', 'Gore', '0559737184', to_date('02-07-2008', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1016, 'Bridget', 'Sample', '0566768419', to_date('29-01-1985', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1017, 'Clarence', 'Gyllenhaal', '0542683512', to_date('09-07-1987', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1018, 'Meg', 'Elwes', '0519344710', to_date('10-09-1970', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1019, 'Loreena', 'Thornton', '0567120309', to_date('30-12-1990', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1020, 'Barry', 'Foster', '0533732091', to_date('27-01-1988', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1021, 'Ike', 'Zeta-Jones', '0567466427', to_date('30-11-1974', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1022, 'Merrill', 'Reubens', '0559527583', to_date('19-09-1996', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1023, 'Vin', 'Woods', '0530898582', to_date('18-10-1985', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1024, 'Fairuza', 'Boone', '0590766698', to_date('08-07-2002', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1025, 'Christine', 'Niven', '0544087746', to_date('16-04-1981', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1026, 'Milla', 'Fonda', '0537982927', to_date('26-12-1991', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1027, 'Melanie', 'Driver', '0546098838', to_date('24-01-1983', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1028, 'Hikaru', 'Scott', '0547418462', to_date('18-09-1994', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1029, 'Kiefer', 'Schock', '0592427329', to_date('29-05-2003', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1030, 'Sonny', 'Ramirez', '0568625948', to_date('04-09-2007', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1031, 'Gladys', 'Cattrall', '0568242997', to_date('27-04-1977', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1032, 'Jon', 'Cube', '0522663851', to_date('28-08-1972', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1033, 'Emily', 'Davies', '0534505021', to_date('03-02-1991', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1034, 'Bridgette', 'Cockburn', '0539092227', to_date('03-12-1997', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1035, 'Rik', 'McElhone', '0598963883', to_date('24-04-1975', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1036, 'Geoffrey', 'Keen', '0556881247', to_date('10-07-1991', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1037, 'Denise', 'Myles', '0579683905', to_date('17-01-1993', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1038, 'Kurtwood', 'Bacon', '0553391659', to_date('13-06-1970', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1039, 'Eileen', 'Merchant', '0529774570', to_date('16-04-1976', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1040, 'Norm', 'Gere', '0568103955', to_date('22-10-1997', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1041, 'Jake', 'Shearer', '0576557290', to_date('17-04-1982', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1042, 'Deborah', 'Sutherland', '0521548664', to_date('27-07-1995', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1043, 'Aimee', 'Darren', '0565171574', to_date('03-07-1979', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1044, 'Cliff', 'Spears', '0587225976', to_date('09-03-1975', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1045, 'Carrie', 'Kudrow', '0514729203', to_date('26-08-1987', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1046, 'Kiefer', 'Wheel', '0593944474', to_date('22-11-1995', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1047, 'Nicolas', 'Witherspoon', '0525527360', to_date('03-10-1971', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1048, 'Tia', 'Gallagher', '0549027266', to_date('13-01-1970', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1049, 'Meg', 'Lauper', '0512719201', to_date('19-06-1996', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1050, 'Night', 'Green', '0591193332', to_date('14-04-1979', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1051, 'Willie', 'Saxon', '0566996940', to_date('04-12-1982', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1052, 'Todd', 'Faithfull', '0530861294', to_date('09-10-1992', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1053, 'Crispin', 'Salonga', '0519632212', to_date('24-11-1997', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1054, 'Rita', 'Ellis', '0510884515', to_date('12-02-1993', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1055, 'Gordon', 'Downey', '0525329996', to_date('24-10-2009', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1056, 'Lena', 'Vicious', '0564268536', to_date('23-07-1972', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1057, 'Hank', 'Levert', '0599702178', to_date('12-01-2008', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1058, 'Emerson', 'Secada', '0556885483', to_date('19-03-2003', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1059, 'Boz', 'Irving', '0519646541', to_date('25-09-2002', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1060, 'Mika', 'Craven', '0555645771', to_date('04-02-2001', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1061, 'Cheech', 'Vannelli', '0535310258', to_date('23-12-1977', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1062, 'Wesley', 'Snipes', '0599582038', to_date('19-02-1981', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1063, 'Davis', 'Irving', '0545091503', to_date('15-02-1995', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1064, 'Viggo', 'Womack', '0559831221', to_date('11-02-1990', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1065, 'Maceo', 'Ammons', '0580623426', to_date('29-06-1988', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1066, 'Austin', 'McGowan', '0587440483', to_date('11-06-1997', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1067, 'Fionnula', 'Redford', '0574967558', to_date('24-12-1994', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1068, 'Maceo', 'Statham', '0573745504', to_date('27-06-2005', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1069, 'Temuera', 'Abraham', '0537733468', to_date('26-02-2009', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1070, 'Rachid', 'Wahlberg', '0570380675', to_date('28-04-1991', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1071, 'Larenz', 'Quinlan', '0584619024', to_date('18-05-2008', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1072, 'Nick', 'MacIsaac', '0549831160', to_date('02-02-1984', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1073, 'Denny', 'Shatner', '0510542021', to_date('13-06-1998', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1074, 'Jean-Luc', 'Pryce', '0581528034', to_date('05-11-1987', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1075, 'Rich', 'Wine', '0519464793', to_date('20-12-1987', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1076, 'Josh', 'Downey', '0554305115', to_date('05-05-1978', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1077, 'Nile', 'Shocked', '0541211079', to_date('26-05-1992', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1078, 'Derek', 'Danes', '0588417123', to_date('07-06-1980', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1079, 'Keanu', 'Freeman', '0541341087', to_date('12-03-1993', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1080, 'Ernest', 'Schneider', '0536012569', to_date('13-01-1970', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1081, 'Jaime', 'Frost', '0539051141', to_date('04-01-1971', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1082, 'Judi', 'Hurley', '0544527080', to_date('04-09-1997', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1083, 'Charles', 'Pryce', '0589302831', to_date('02-06-1993', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1084, 'Cevin', 'McKennitt', '0527916539', to_date('01-05-2002', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1085, 'Aida', 'Haggard', '0599109785', to_date('16-09-1992', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1086, 'Vendetta', 'Emmerich', '0595013401', to_date('14-03-2006', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1087, 'Nathan', 'Caldwell', '0551486214', to_date('30-04-1985', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1088, 'Will', 'Monk', '0596640576', to_date('14-12-1986', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1089, 'Praga', 'Sweeney', '0522451178', to_date('28-08-1976', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1090, 'Ethan', 'Dreyfuss', '0523263148', to_date('04-02-1971', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1091, 'Harold', 'Liu', '0514652566', to_date('11-02-1978', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1092, 'Chazz', 'Barkin', '0552566689', to_date('02-08-1995', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1093, 'Luis', 'Heron', '0567067280', to_date('09-06-1989', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1094, 'Gailard', 'Rodriguez', '0511267454', to_date('03-11-1973', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1095, 'Christmas', 'Chung', '0563440218', to_date('19-03-1973', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1096, 'Celia', 'Humphrey', '0536019077', to_date('28-05-1986', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1097, 'Nikki', 'Quinones', '0583078963', to_date('10-07-1997', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1098, 'Sophie', 'Serbedzija', '0582475606', to_date('15-10-1978', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1099, 'Mike', 'McGriff', '0512772042', to_date('21-02-2003', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1100, 'First', 'Dupree', '0583187976', to_date('01-11-1993', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1101, 'Trey', 'Venora', '0552833838', to_date('20-08-1973', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1102, 'Night', 'Pepper', '0599990239', to_date('23-12-1989', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1103, 'Reese', 'Benson', '0584638324', to_date('13-10-1990', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1104, 'Suzanne', 'Red', '0568420504', to_date('15-01-1986', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1105, 'Taye', 'Finney', '0578760700', to_date('18-08-1992', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1106, 'Rhea', 'Rodgers', '0538782695', to_date('29-10-1981', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1107, 'Boz', 'Uggams', '0568534945', to_date('01-12-1983', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1108, 'Alicia', 'Keitel', '0528558961', to_date('25-08-2002', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1109, 'Timothy', 'Choice', '0580471653', to_date('07-01-2005', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1110, 'Marina', 'Whitaker', '0526363542', to_date('25-05-1986', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1111, 'Selma', 'Kudrow', '0563212109', to_date('28-04-2005', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1112, 'Sandra', 'Trejo', '0590135666', to_date('06-01-1974', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1113, 'Woody', 'Hanley', '0512354695', to_date('06-03-1991', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1114, 'Mekhi', 'Liotta', '0537481867', to_date('29-08-1985', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1115, 'Teena', 'McDonald', '0518450331', to_date('02-05-2000', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1116, 'Rickie', 'Hirsch', '0548068605', to_date('25-02-2008', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1117, 'Cheech', 'McCoy', '0595423057', to_date('17-09-1999', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1118, 'Harry', 'Chao', '0523929762', to_date('17-08-1992', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1119, 'Allison', 'Raye', '0592833740', to_date('26-08-1987', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1120, 'Minnie', 'Cobbs', '0532744880', to_date('10-01-1994', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1121, 'Rupert', 'Durning', '0543391609', to_date('20-12-1979', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1122, 'Frederic', 'Coward', '0532988545', to_date('26-03-1971', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1123, 'Kevn', 'Jonze', '0530596299', to_date('26-01-1974', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1124, 'Nils', 'Frakes', '0599284779', to_date('12-05-2001', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1125, 'Jonathan', 'Blackwell', '0533813459', to_date('17-03-1974', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1126, 'Mira', 'Rebhorn', '0541278448', to_date('10-09-2009', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1127, 'Alex', 'Lopez', '0511761089', to_date('22-06-1987', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1128, 'Cate', 'Cale', '0546458688', to_date('31-05-1989', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1129, 'Lila', 'Applegate', '0547836470', to_date('15-10-1981', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1130, 'Alessandro', 'Quatro', '0556254578', to_date('09-02-2007', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1131, 'Terrence', 'Albright', '0543218683', to_date('13-07-1975', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1132, 'Tom', 'Spiner', '0510672932', to_date('13-08-2007', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1133, 'Lance', 'Hatfield', '0554871419', to_date('14-08-1979', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1134, 'Thora', 'Gryner', '0543929634', to_date('23-04-2001', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1135, 'Derek', 'Payne', '0510494420', to_date('04-07-1998', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1136, 'Ving', 'Moriarty', '0567833502', to_date('31-03-1983', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1137, 'Denny', 'Ojeda', '0543450391', to_date('17-05-1987', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1138, 'Lou', 'Gilliam', '0582315135', to_date('29-03-1977', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1139, 'Rachel', 'Mollard', '0568405045', to_date('03-11-1984', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1140, 'Gil', 'Brooks', '0588929836', to_date('24-09-2008', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1141, 'Grace', 'Perrineau', '0519245204', to_date('28-08-1987', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1142, 'Rebeka', 'Birch', '0519786090', to_date('06-06-1986', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1143, 'Marianne', 'Cervine', '0544028587', to_date('20-02-2004', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1144, 'Nils', 'Whitaker', '0573755725', to_date('20-11-2002', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1145, 'Benicio', 'Gibbons', '0560918726', to_date('22-04-1974', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1146, 'Julio', 'Leigh', '0577624577', to_date('13-08-1992', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1147, 'Kate', 'Hamilton', '0528998734', to_date('31-05-1979', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1148, 'Loretta', 'Feuerstein', '0523993823', to_date('20-04-1997', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1149, 'Wesley', 'Short', '0571759431', to_date('04-01-2001', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1150, 'Natalie', 'Mollard', '0582697039', to_date('23-12-1989', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1151, 'Gary', 'Berkley', '0526024223', to_date('22-08-1974', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1152, 'Ashley', 'McKennitt', '0578069781', to_date('18-12-1992', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1153, 'Hank', 'Derringer', '0513963171', to_date('28-06-1982', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1154, 'Brian', 'Palminteri', '0563430447', to_date('26-09-2009', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1155, 'Ali', 'Malkovich', '0515548838', to_date('01-03-1994', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1156, 'Malcolm', 'James', '0518925823', to_date('26-10-1979', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1157, 'Bernie', 'Watson', '0524865041', to_date('06-07-2001', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1158, 'Domingo', 'Shaye', '0584210727', to_date('12-11-1998', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1159, 'Naomi', 'Prowse', '0581748093', to_date('23-12-1999', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1160, 'Thelma', 'Harry', '0565809973', to_date('30-11-1978', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1161, 'Isaiah', 'Eat World', '0519288616', to_date('04-01-2005', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1162, 'Lesley', 'Stevenson', '0533327264', to_date('15-05-1977', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1163, 'Wang', 'Lange', '0599698772', to_date('14-12-1985', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1164, 'Andrea', 'Peet', '0528955567', to_date('23-06-1992', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1165, 'Elvis', 'Dysart', '0554147667', to_date('15-01-1985', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1166, 'Suzi', 'Burns', '0576311379', to_date('23-06-2004', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1167, 'Carl', 'Kweller', '0538505823', to_date('25-10-2007', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1168, 'Kevin', 'Kenoly', '0535378090', to_date('12-07-1992', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1169, 'Jessica', 'Forrest', '0557076786', to_date('05-09-1999', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1170, 'Andre', 'Hingle', '0550688986', to_date('02-01-1984', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1171, 'Delbert', 'Cohn', '0556411413', to_date('02-05-1998', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1172, 'Gran', 'Boorem', '0583947700', to_date('26-11-1985', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1173, 'Albertina', 'Savage', '0571398100', to_date('26-08-1992', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1174, 'Kirk', 'Cozier', '0552047089', to_date('04-03-1970', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1175, 'Chloe', 'Leachman', '0537163184', to_date('01-07-1988', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1176, 'Vern', 'McKellen', '0585524932', to_date('15-11-1994', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1177, 'Kitty', 'Leachman', '0583736328', to_date('27-01-2006', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1178, 'Sinead', 'Quinn', '0568843885', to_date('21-02-1995', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1179, 'Tommy', 'Penders', '0550465119', to_date('29-05-1973', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1180, 'Harrison', 'Elizabeth', '0535263800', to_date('06-04-2003', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1181, 'Larnelle', 'Mollard', '0529290063', to_date('13-01-1972', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1182, 'Linda', 'Brolin', '0566242806', to_date('22-08-1982', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1183, 'Sophie', 'Bright', '0525958220', to_date('28-01-1979', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1184, 'Sheena', 'DiCaprio', '0537631076', to_date('26-06-1971', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1185, 'Chuck', 'Wells', '0582964417', to_date('20-10-1980', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1186, 'Jodie', 'Flanagan', '0551693373', to_date('26-06-1991', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1187, 'Hazel', 'Whitford', '0559737614', to_date('06-06-1985', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1188, 'Joely', 'Crow', '0555496559', to_date('07-05-2002', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1189, 'Harvey', 'Jane', '0591037831', to_date('04-10-1991', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1190, 'Rachael', 'Emmerich', '0575040709', to_date('28-06-1976', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1191, 'Davey', 'Sampson', '0561306442', to_date('13-06-2007', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1192, 'Dorry', 'Preston', '0589787271', to_date('20-02-2007', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1193, 'Jay', 'Tippe', '0526393266', to_date('08-11-1997', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1194, 'Etta', 'Cronin', '0539828934', to_date('07-11-2007', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1195, 'Maria', 'Idol', '0536646612', to_date('16-09-1996', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1196, 'Michelle', 'Black', '0529896683', to_date('26-08-1979', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1197, 'Daryl', 'Sweet', '0540767315', to_date('18-07-1986', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1198, 'Alex', 'Janney', '0567591373', to_date('14-03-1978', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1199, 'Maury', 'Rippy', '0591904793', to_date('21-10-1980', 'dd-mm-yyyy'), null);
commit;
prompt 200 records committed...
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1200, 'Benjamin', 'Crystal', '0539961845', to_date('11-12-1981', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1201, 'Shannyn', 'Diddley', '0534325903', to_date('18-12-1994', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1202, 'Goran', 'Fogerty', '0539530945', to_date('15-02-2002', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1203, 'Tamala', 'Portman', '0510229352', to_date('30-03-1981', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1204, 'Sara', 'Leto', '0533444191', to_date('29-08-2003', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1205, 'Edgar', 'Hannah', '0587714491', to_date('13-07-1986', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1206, 'Pelvic', 'Hopper', '0572166868', to_date('31-10-1973', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1207, 'Denny', 'Newton', '0583007521', to_date('26-10-2003', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1208, 'Matt', 'Berkeley', '0557775664', to_date('16-06-1996', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1209, 'Samuel', 'Vassar', '0572568917', to_date('07-08-2009', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1210, 'Tori', 'Balaban', '0584963652', to_date('19-08-2008', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1211, 'Lindsey', 'Marsden', '0535616885', to_date('05-09-1983', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1212, 'Charles', 'Harrison', '0596739534', to_date('21-05-1998', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1213, 'Rosie', 'Kane', '0530831068', to_date('23-02-1998', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1214, 'Patti', 'Laurie', '0510273996', to_date('23-06-1999', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1215, 'Sander', 'O''Hara', '0585206875', to_date('05-04-1990', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1216, 'Dwight', 'Colman', '0568964652', to_date('14-08-1997', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1217, 'Scarlett', 'Lemmon', '0599091284', to_date('12-04-1999', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1218, 'Anthony', 'Speaks', '0510532663', to_date('09-12-2004', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1219, 'Dianne', 'Beckham', '0541529430', to_date('09-05-1972', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1220, 'Mandy', 'McIntosh', '0595266715', to_date('20-04-1990', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1221, 'Delroy', 'Culkin', '0568651844', to_date('19-12-1971', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1222, 'Miriam', 'Dorn', '0584325016', to_date('02-07-1978', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1223, 'Marc', 'McGoohan', '0516737892', to_date('02-03-1992', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1224, 'Chazz', 'Benet', '0556739205', to_date('23-12-1993', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1225, 'Willie', 'Jay', '0511729133', to_date('30-04-1982', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1226, 'Courtney', 'Bates', '0536268920', to_date('27-06-1979', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1227, 'Patrick', 'Polley', '0526639201', to_date('24-08-1981', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1228, 'Terence', 'Portman', '0526647100', to_date('25-06-2001', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1229, 'Charles', 'DeGraw', '0553379265', to_date('10-07-2007', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1230, 'Art', 'Bachman', '0599671055', to_date('26-08-1977', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1231, 'Nik', 'Tyson', '0537119313', to_date('02-09-1981', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1232, 'Sean', 'Matthau', '0578696555', to_date('09-03-1971', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1233, 'Milla', 'Bryson', '0521933979', to_date('02-11-1987', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1234, 'Andie', 'Hiatt', '0512984845', to_date('30-07-1974', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1235, 'Isaiah', 'Mortensen', '0536434251', to_date('09-12-1991', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1236, 'Nile', 'Robbins', '0592635463', to_date('28-03-1977', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1237, 'Jonathan', 'Trevino', '0546791407', to_date('16-07-1993', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1238, 'Merillee', 'Lonsdale', '0516254129', to_date('04-12-1987', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1239, 'Rosco', 'Watson', '0554904178', to_date('15-05-1997', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1240, 'Ming-Na', 'Herndon', '0544016533', to_date('19-12-1992', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1241, 'Don', 'Mifune', '0571847731', to_date('07-03-1974', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1242, 'Linda', 'Cassel', '0594140969', to_date('31-08-1984', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1243, 'Steve', 'Osborne', '0549121029', to_date('29-08-1982', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1244, 'Rhea', 'Yorn', '0524201425', to_date('02-04-1978', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1245, 'Stevie', 'Morse', '0585874309', to_date('12-03-2000', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1246, 'Leon', 'Nicholas', '0598626007', to_date('18-03-1970', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1247, 'Seth', 'Peterson', '0557329252', to_date('30-05-1986', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1248, 'Rutger', 'Numan', '0528119072', to_date('14-07-1978', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1249, 'Balthazar', 'Moorer', '0552207678', to_date('20-01-1987', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1250, 'Kitty', 'Underwood', '0592772548', to_date('31-07-1985', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1251, 'Belinda', 'Favreau', '0552711391', to_date('06-11-2006', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1252, 'Campbell', 'Gates', '0574858354', to_date('16-04-2004', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1253, 'Victor', 'Affleck', '0557613615', to_date('23-08-1987', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1254, 'Wayne', 'Torn', '0518275721', to_date('02-01-1971', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1255, 'Jonny Lee', 'Arden', '0589310922', to_date('24-02-1990', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1256, 'Dianne', 'Cantrell', '0584327105', to_date('16-01-1992', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1257, 'Meg', 'Teng', '0575439293', to_date('20-07-2006', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1258, 'Judy', 'Browne', '0532879593', to_date('08-02-1993', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1259, 'Gwyneth', 'Avalon', '0581326426', to_date('23-05-1987', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1260, 'Thelma', 'Burstyn', '0582654519', to_date('12-02-1988', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1261, 'Sylvester', 'Warden', '0593069034', to_date('24-03-1988', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1262, 'Oro', 'Webb', '0597422698', to_date('30-03-1992', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1263, 'Rod', 'Borden', '0539658638', to_date('22-12-1992', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1264, 'Debra', 'Randal', '0525224549', to_date('14-09-2009', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1265, 'Thora', 'Lunch', '0529018856', to_date('09-04-1971', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1266, 'Cherry', 'Moffat', '0526537628', to_date('29-03-1997', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1267, 'Renee', 'O''Donnell', '0593193048', to_date('02-05-1978', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1268, 'Crispin', 'Mitra', '0522175184', to_date('02-04-2001', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1269, 'Harry', 'Swinton', '0525786754', to_date('15-05-1999', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1270, 'Ricky', 'Marshall', '0583714853', to_date('27-11-1986', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1271, 'Lena', 'Lloyd', '0587694066', to_date('31-03-1996', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1272, 'Cameron', 'Durning', '0527882325', to_date('28-07-1974', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1273, 'Cuba', 'Broza', '0531457744', to_date('11-03-1974', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1274, 'Wally', 'Hart', '0599472495', to_date('08-12-1983', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1275, 'Jean-Claude', 'Richards', '0520581249', to_date('13-05-1978', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1276, 'Phoebe', 'Shannon', '0514139511', to_date('17-07-1995', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1277, 'Jake', 'Heatherly', '0544063238', to_date('27-01-1992', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1278, 'Edwin', 'Wiest', '0572519969', to_date('09-11-1997', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1279, 'Aaron', 'DeGraw', '0516072698', to_date('02-04-1977', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1280, 'Leelee', 'Ripley', '0515605021', to_date('18-05-2009', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1281, 'Isaiah', 'Warwick', '0514068964', to_date('24-12-1981', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1282, 'Paul', 'Duke', '0561386709', to_date('21-04-1974', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1283, 'Buffy', 'Browne', '0593069598', to_date('31-05-1976', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1284, 'Javon', 'Wakeling', '0531644909', to_date('08-12-2005', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1285, 'Udo', 'McKellen', '0537578447', to_date('30-03-1975', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1286, 'Alice', 'Faithfull', '0565680282', to_date('15-04-1999', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1287, 'Jonny Lee', 'Taylor', '0530725470', to_date('30-09-1975', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1288, 'Lari', 'McIntosh', '0541459453', to_date('13-12-1990', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1289, 'Bonnie', 'Union', '0592297028', to_date('09-11-2006', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1290, 'Dan', 'Nicks', '0533447345', to_date('03-02-1995', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1291, 'Johnnie', 'Stanton', '0590852174', to_date('15-01-1983', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1292, 'Kieran', 'Wiest', '0545739496', to_date('19-02-1986', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1293, 'Julia', 'Coe', '0535393372', to_date('06-08-2000', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1294, 'Murray', 'Close', '0570623682', to_date('12-07-2003', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1295, 'Clive', 'Winslet', '0513243234', to_date('22-02-1982', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1296, 'Ving', 'Cruise', '0549008817', to_date('17-03-1998', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1297, 'Denny', 'Olin', '0513884260', to_date('23-04-1979', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1298, 'Selma', 'Haggard', '0562059138', to_date('22-10-2009', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1299, 'Ty', 'Guzman', '0547145151', to_date('22-07-1986', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1300, 'Mos', 'Gugino', '0516351459', to_date('26-01-1994', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1301, 'Mary-Louise', 'Cage', '0591149584', to_date('09-09-1979', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1302, 'Larry', 'Costello', '0592477944', to_date('03-11-1986', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1303, 'Annette', 'McCabe', '0558567409', to_date('22-11-1985', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1304, 'Juliet', 'Lee', '0578652534', to_date('17-02-1993', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1305, 'Alannah', 'Mollard', '0592376432', to_date('04-04-2004', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1306, 'Edward', 'Nivola', '0577527631', to_date('07-01-1989', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1307, 'Mia', 'Carradine', '0559896587', to_date('17-11-1996', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1308, 'Tom', 'Cotton', '0517657796', to_date('14-07-1982', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1309, 'Ted', 'Harry', '0559348072', to_date('14-08-1996', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1310, 'Lee', 'Noseworthy', '0592718626', to_date('13-03-1981', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1311, 'Humberto', 'Paul', '0541269413', to_date('08-10-2005', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1312, 'Jeff', 'Harrelson', '0570267808', to_date('20-03-1999', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1313, 'Lonnie', 'Magnuson', '0523822653', to_date('28-10-1976', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1314, 'Micky', 'Moore', '0565309928', to_date('03-09-1977', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1315, 'Donal', 'Pony', '0545582648', to_date('09-07-1996', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1316, 'Rickie', 'Ribisi', '0573413463', to_date('26-02-2001', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1317, 'Kenneth', 'Galecki', '0526216933', to_date('25-07-1988', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1318, 'Lizzy', 'Brandt', '0541451446', to_date('05-01-1982', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1319, 'Curtis', 'Quinones', '0519959868', to_date('18-12-2001', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1320, 'Suzanne', 'Dean', '0572124495', to_date('01-10-1973', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1321, 'Alana', 'Spall', '0554037548', to_date('22-01-2000', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1322, 'Kevin', 'Curtis-Hall', '0553011652', to_date('14-11-2007', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1323, 'Merle', 'Sawa', '0525114471', to_date('10-08-1974', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1324, 'Pete', 'McAnally', '0523905570', to_date('12-03-1987', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1325, 'Gin', 'Bruce', '0537257136', to_date('19-06-1986', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1326, 'Pelvic', 'Solido', '0535309254', to_date('25-10-1976', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1327, 'Lindsay', 'Hoskins', '0550943184', to_date('05-12-1989', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1328, 'Meredith', 'Avital', '0543288725', to_date('20-09-1983', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1329, 'Claude', 'Torres', '0592837944', to_date('11-12-2005', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1330, 'Teena', 'Dawson', '0536156643', to_date('09-12-1971', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1331, 'Angela', 'Iglesias', '0551897542', to_date('27-05-1971', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1332, 'Wayman', 'Hamilton', '0582985125', to_date('30-10-1985', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1333, 'Maxine', 'Merchant', '0599392109', to_date('14-04-2006', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1334, 'Art', 'Janney', '0528471712', to_date('24-05-2007', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1335, 'Janice', 'Satriani', '0517105032', to_date('02-03-2003', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1336, 'Charles', 'Skerritt', '0543539059', to_date('28-08-1975', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1337, 'Gordie', 'Humphrey', '0524516802', to_date('17-02-1981', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1338, 'Kyle', 'Diaz', '0547288483', to_date('19-10-1995', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1339, 'Katie', 'Perry', '0583632917', to_date('31-12-1984', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1340, 'Boz', 'Estevez', '0558301436', to_date('29-07-1981', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1341, 'Robby', 'Cornell', '0560209992', to_date('31-07-1996', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1342, 'Desmond', 'Fraser', '0571885386', to_date('30-12-1980', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1343, 'Halle', 'Bergen', '0515615950', to_date('08-11-1981', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1344, 'Salma', 'Mann', '0537124040', to_date('09-08-1988', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1345, 'Anita', 'Buffalo', '0573506799', to_date('03-01-1985', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1346, 'Dylan', 'English', '0514470444', to_date('29-07-1993', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1347, 'Vanessa', 'Wainwright', '0516046315', to_date('03-01-1970', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1348, 'Jonny', 'Cozier', '0565682764', to_date('04-01-2009', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1349, 'Alan', 'Sampson', '0528921228', to_date('03-08-2003', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1350, 'Nikka', 'Seagal', '0584496965', to_date('26-05-2005', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1351, 'Marley', 'Lithgow', '0557355636', to_date('01-09-2007', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1352, 'Tzi', 'Hanks', '0594539448', to_date('15-12-2001', 'dd-mm-yyyy'), to_date('06-07-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1353, 'Joely', 'Galecki', '0556168759', to_date('13-07-2002', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1354, 'Raul', 'Thornton', '0518399520', to_date('15-06-1979', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1355, 'Lara', 'Borgnine', '0568976925', to_date('26-11-2009', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1356, 'Wade', 'Conlee', '0594228416', to_date('25-12-2001', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1357, 'Nicole', 'Woodard', '0556086684', to_date('03-04-2001', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1358, 'Stellan', 'Craven', '0591445604', to_date('19-06-1991', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1359, 'Helen', 'Strathairn', '0530035715', to_date('18-09-2006', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1360, 'Ming-Na', 'Caan', '0530958097', to_date('19-11-2000', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1361, 'Bonnie', 'Morton', '0560742631', to_date('03-11-2007', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1362, 'Paul', 'Wayans', '0524392397', to_date('10-06-2007', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1363, 'Elizabeth', 'Evans', '0552477111', to_date('25-12-1988', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1364, 'Teena', 'Schwimmer', '0551721972', to_date('24-11-1979', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1365, 'Richie', 'Dorn', '0510976145', to_date('22-02-1988', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1366, 'Chubby', 'Cassidy', '0579153042', to_date('12-06-1979', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1367, 'Gilbert', 'Rispoli', '0524574528', to_date('04-10-2000', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1368, 'Rosie', 'Clooney', '0574033424', to_date('19-03-1999', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1369, 'Jay', 'Epps', '0530758210', to_date('29-01-1996', 'dd-mm-yyyy'), to_date('01-07-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1370, 'Diane', 'Dushku', '0560295260', to_date('07-07-1982', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1371, 'Samuel', 'Newman', '0561136729', to_date('23-08-2003', 'dd-mm-yyyy'), null);
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1372, 'Tobey', 'Austin', '0530422658', to_date('07-10-1980', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1373, 'Raul', 'Westerberg', '0599774497', to_date('10-08-1988', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1374, 'Boz', 'Elizondo', '0572003895', to_date('25-10-2009', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1375, 'Charlton', 'Torino', '0547486450', to_date('19-08-2005', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1376, 'Omar', 'Hornsby', '0519044002', to_date('23-12-1994', 'dd-mm-yyyy'), to_date('06-01-2016', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1377, 'Mika', 'Puckett', '0566111933', to_date('23-01-1987', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1378, 'Geggy', 'Reid', '0513447054', to_date('13-06-1975', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1379, 'Adam', 'Bening', '0571542624', to_date('21-10-1994', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1380, 'Larnelle', 'Cage', '0519751440', to_date('21-11-1991', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1381, 'Saul', 'Sharp', '0559787621', to_date('19-10-2007', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1382, 'David', 'Osment', '0520985880', to_date('02-01-1982', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1383, 'Tanya', 'Schiff', '0590744736', to_date('22-04-1992', 'dd-mm-yyyy'), to_date('08-07-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1384, 'Debi', 'Furtado', '0597482978', to_date('03-08-1970', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1385, 'Daryl', 'Underwood', '0537653163', to_date('27-01-1997', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1386, 'Brittany', 'Thomson', '0525050320', to_date('11-10-2001', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1387, 'Jaime', 'Spacey', '0539814873', to_date('24-05-1991', 'dd-mm-yyyy'), to_date('03-01-2018', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1388, 'Maceo', 'Connery', '0593409355', to_date('26-08-1970', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1389, 'Juliana', 'Venora', '0581535204', to_date('22-10-1994', 'dd-mm-yyyy'), to_date('28-12-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1390, 'Embeth', 'Blackmore', '0569247054', to_date('21-03-1988', 'dd-mm-yyyy'), to_date('05-07-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1391, 'Benjamin', 'Hatosy', '0573392676', to_date('04-04-2000', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1392, 'Woody', 'Midler', '0550553615', to_date('25-10-1993', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1393, 'Paul', 'Pryce', '0547563999', to_date('19-08-1993', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1394, 'Marianne', 'Marley', '0531434731', to_date('06-08-2005', 'dd-mm-yyyy'), to_date('09-07-2014', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1395, 'Cledus', 'Tanon', '0525161810', to_date('02-01-1999', 'dd-mm-yyyy'), to_date('07-01-2015', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1396, 'Charlie', 'Pleasence', '0572021853', to_date('04-07-1992', 'dd-mm-yyyy'), to_date('29-06-2022', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1397, 'Elle', 'Ward', '0544909112', to_date('26-08-1972', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1398, 'Willem', 'Hutch', '0558485017', to_date('26-12-1994', 'dd-mm-yyyy'), to_date('04-01-2017', 'dd-mm-yyyy'));
insert into CUSTOMERS (customerid, firstname, lastname, phonenumber, birthdaydate, lastpurchasedate)
values (1399, 'Nigel', 'Dayne', '0541628535', to_date('16-08-1988', 'dd-mm-yyyy'), to_date('30-12-2020', 'dd-mm-yyyy'));
commit;
prompt 400 records loaded
prompt Loading VENUES...
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (1, 'Grand Hall', '123 Main St', 500, to_date('01-01-2000', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (2, 'Conference Center', '456 Elm St', 200, to_date('05-05-2005', 'dd-mm-yyyy'), to_date('05-05-2015', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (3, 'Banquet Hall', '789 Oak St', 300, to_date('15-03-2010', 'dd-mm-yyyy'), to_date('15-03-2020', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (4, 'Wedding Venue', '101 Pine St', 400, to_date('20-07-2008', 'dd-mm-yyyy'), to_date('20-07-2018', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (5, 'Convention Center', '202 Cedar St', 800, to_date('10-11-2012', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (6, 'Exhibition Hall', '303 Birch St', 250, to_date('25-02-2016', 'dd-mm-yyyy'), to_date('25-02-2026', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (7, 'Garden Venue', '404 Maple St', 350, to_date('18-06-2001', 'dd-mm-yyyy'), to_date('18-06-2021', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (8, 'Rooftop Venue', '505 Walnut St', 150, to_date('22-09-2003', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (9, 'Beach Venue', '606 Palm St', 600, to_date('12-12-2014', 'dd-mm-yyyy'), to_date('12-12-2024', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (10, 'Country Club', '707 Spruce St', 450, to_date('08-04-2006', 'dd-mm-yyyy'), to_date('08-04-2016', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (11, 'City Hall', '808 Fir St', 700, to_date('14-08-2011', 'dd-mm-yyyy'), to_date('14-08-2021', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (12, 'Historic Mansion', '909 Cherry St', 320, to_date('28-10-2009', 'dd-mm-yyyy'), to_date('28-10-2019', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (13, 'Art Gallery', '1010 Ash St', 180, to_date('06-01-2017', 'dd-mm-yyyy'), to_date('06-01-2027', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (14, 'Hotel Ballroom', '1111 Willow St', 500, to_date('19-05-2002', 'dd-mm-yyyy'), to_date('19-05-2022', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (15, 'Museum Venue', '1212 Poplar St', 600, to_date('23-07-2015', 'dd-mm-yyyy'), to_date('23-07-2025', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (16, 'Resort Venue', '1313 Beech St', 350, to_date('30-03-2004', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (17, 'Event Pavilion', '1414 Hemlock St', 250, to_date('11-09-2007', 'dd-mm-yyyy'), to_date('11-09-2027', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (18, 'Auditorium', '1515 Magnolia St', 450, to_date('05-11-2013', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (19, 'Lakeside Venue', '1616 Olive St', 550, to_date('17-06-2018', 'dd-mm-yyyy'), to_date('17-06-2028', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (20, 'Park Venue', '1717 Cypress St', 220, to_date('01-10-2019', 'dd-mm-yyyy'), to_date('01-10-2029', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (21, 'Community Center', '1818 Pine St', 400, to_date('12-01-2020', 'dd-mm-yyyy'), to_date('12-01-2030', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (22, 'Mountain Lodge', '1919 Palm St', 300, to_date('14-02-2000', 'dd-mm-yyyy'), to_date('14-02-2020', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (23, 'Desert Venue', '2020 Maple St', 200, to_date('16-03-2005', 'dd-mm-yyyy'), to_date('16-03-2025', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (24, 'Vineyard Venue', '2121 Oak St', 350, to_date('18-04-2010', 'dd-mm-yyyy'), to_date('18-04-2030', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (25, 'Island Venue', '2323 Elm St', 500, to_date('20-05-2015', 'dd-mm-yyyy'), to_date('20-05-2035', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (26, 'River Venue', '2424 Spruce St', 250, to_date('22-06-2020', 'dd-mm-yyyy'), to_date('22-06-2040', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (27, 'Forest Venue', '2525 Fir St', 450, to_date('24-07-2003', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (28, 'Castle Venue', '2626 Cedar St', 600, to_date('26-08-2008', 'dd-mm-yyyy'), to_date('26-08-2028', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (29, 'Heritage Hall', '2727 Birch St', 320, to_date('28-09-2013', 'dd-mm-yyyy'), to_date('28-09-2033', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (30, 'Library Venue', '2828 Cherry St', 180, to_date('30-10-2018', 'dd-mm-yyyy'), to_date('30-10-2038', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (31, 'Ranch Venue', '2929 Ash St', 500, to_date('01-11-2001', 'dd-mm-yyyy'), to_date('01-11-2021', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (32, 'Palace Venue', '3030 Willow St', 700, to_date('03-12-2006', 'dd-mm-yyyy'), to_date('03-12-2026', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (33, 'Studio Venue', '3131 Poplar St', 150, to_date('25-03-2008', 'dd-mm-yyyy'), to_date('25-03-2028', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (34, 'Sports Arena', '3232 Maple St', 1000, to_date('30-05-2010', 'dd-mm-yyyy'), to_date('30-05-2030', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (35, 'Theater Venue', '3333 Elm St', 750, to_date('15-07-2012', 'dd-mm-yyyy'), to_date('15-07-2032', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (36, 'Boat House', '3434 Pine St', 300, to_date('20-08-2014', 'dd-mm-yyyy'), to_date('20-08-2034', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (37, 'Aquarium Venue', '3535 Palm St', 400, to_date('10-09-2016', 'dd-mm-yyyy'), to_date('10-09-2036', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (38, 'Zoo Pavilion', '3636 Spruce St', 600, to_date('05-10-2018', 'dd-mm-yyyy'), to_date('05-10-2038', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (39, 'Amphitheater', '3737 Maple St', 1200, to_date('25-11-2020', 'dd-mm-yyyy'), to_date('25-11-2040', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (40, 'Convention Hall', '3838 Elm St', 900, to_date('15-12-2022', 'dd-mm-yyyy'), to_date('15-12-2042', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (1000, 'Grand Hall', '123 Main St', 500, to_date('01-01-2000', 'dd-mm-yyyy'), to_date('01-01-2020', 'dd-mm-yyyy'));
insert into VENUES (venueid, name, location, capacity, opendate, renovationdate)
values (2000, 'Conference Center', '456 Elm St', 200, to_date('05-05-2005', 'dd-mm-yyyy'), to_date('05-05-2015', 'dd-mm-yyyy'));
commit;
prompt 42 records loaded
prompt Loading EVENTS_...
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2000, to_date('23-04-2022', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'), 1172, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2001, to_date('05-08-2022', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'), 1104, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2002, to_date('30-10-2022', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'), 1358, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2003, to_date('18-04-2022', 'dd-mm-yyyy'), to_date('25-11-2021', 'dd-mm-yyyy'), 1138, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2004, to_date('06-08-2022', 'dd-mm-yyyy'), to_date('19-01-2021', 'dd-mm-yyyy'), 1351, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2005, to_date('03-02-2022', 'dd-mm-yyyy'), to_date('02-04-2021', 'dd-mm-yyyy'), 1087, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2006, to_date('25-10-2022', 'dd-mm-yyyy'), to_date('24-05-2021', 'dd-mm-yyyy'), 1079, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2007, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('05-01-2021', 'dd-mm-yyyy'), 1218, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2008, to_date('06-09-2022', 'dd-mm-yyyy'), to_date('29-09-2021', 'dd-mm-yyyy'), 1378, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2009, to_date('27-01-2022', 'dd-mm-yyyy'), to_date('17-02-2021', 'dd-mm-yyyy'), 1296, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2010, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('02-09-2021', 'dd-mm-yyyy'), 1338, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2011, to_date('20-01-2022', 'dd-mm-yyyy'), to_date('15-04-2021', 'dd-mm-yyyy'), 1311, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2012, to_date('01-06-2022', 'dd-mm-yyyy'), to_date('17-08-2021', 'dd-mm-yyyy'), 1349, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2013, to_date('30-09-2022', 'dd-mm-yyyy'), to_date('22-11-2021', 'dd-mm-yyyy'), 1029, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2014, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('01-02-2021', 'dd-mm-yyyy'), 1356, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2015, to_date('03-02-2022', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 1161, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2016, to_date('01-02-2022', 'dd-mm-yyyy'), to_date('26-06-2021', 'dd-mm-yyyy'), 1151, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2017, to_date('08-12-2022', 'dd-mm-yyyy'), to_date('10-04-2021', 'dd-mm-yyyy'), 1367, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2018, to_date('26-03-2022', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'), 1080, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2019, to_date('09-07-2022', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), 1079, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2020, to_date('20-07-2022', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), 1185, 36);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2021, to_date('09-07-2022', 'dd-mm-yyyy'), to_date('11-04-2021', 'dd-mm-yyyy'), 1148, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2022, to_date('08-04-2022', 'dd-mm-yyyy'), to_date('24-07-2021', 'dd-mm-yyyy'), 1159, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2023, to_date('29-08-2022', 'dd-mm-yyyy'), to_date('13-04-2021', 'dd-mm-yyyy'), 1122, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2024, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('24-09-2021', 'dd-mm-yyyy'), 1139, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2025, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('19-05-2021', 'dd-mm-yyyy'), 1341, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2026, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('13-04-2021', 'dd-mm-yyyy'), 1314, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2027, to_date('17-01-2022', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 1065, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2028, to_date('06-10-2022', 'dd-mm-yyyy'), to_date('20-09-2021', 'dd-mm-yyyy'), 1164, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2029, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'), 1021, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2030, to_date('12-12-2022', 'dd-mm-yyyy'), to_date('08-11-2021', 'dd-mm-yyyy'), 1120, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2031, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('04-08-2021', 'dd-mm-yyyy'), 1178, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2032, to_date('08-01-2022', 'dd-mm-yyyy'), to_date('05-04-2021', 'dd-mm-yyyy'), 1051, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2033, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('29-03-2021', 'dd-mm-yyyy'), 1346, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2034, to_date('03-11-2022', 'dd-mm-yyyy'), to_date('08-07-2021', 'dd-mm-yyyy'), 1176, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2035, to_date('17-05-2022', 'dd-mm-yyyy'), to_date('28-09-2021', 'dd-mm-yyyy'), 1000, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2036, to_date('16-12-2022', 'dd-mm-yyyy'), to_date('17-04-2021', 'dd-mm-yyyy'), 1001, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2037, to_date('11-11-2022', 'dd-mm-yyyy'), to_date('19-12-2021', 'dd-mm-yyyy'), 1130, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2038, to_date('18-03-2022', 'dd-mm-yyyy'), to_date('19-03-2021', 'dd-mm-yyyy'), 1080, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2039, to_date('19-05-2022', 'dd-mm-yyyy'), to_date('14-02-2021', 'dd-mm-yyyy'), 1314, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2040, to_date('07-11-2022', 'dd-mm-yyyy'), to_date('22-07-2021', 'dd-mm-yyyy'), 1203, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2041, to_date('14-03-2022', 'dd-mm-yyyy'), to_date('06-02-2021', 'dd-mm-yyyy'), 1218, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2042, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 1007, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2043, to_date('21-08-2022', 'dd-mm-yyyy'), to_date('17-08-2021', 'dd-mm-yyyy'), 1321, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2044, to_date('04-03-2022', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 1012, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2045, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('04-04-2021', 'dd-mm-yyyy'), 1263, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2046, to_date('30-07-2022', 'dd-mm-yyyy'), to_date('31-01-2021', 'dd-mm-yyyy'), 1283, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2047, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('22-02-2021', 'dd-mm-yyyy'), 1018, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2048, to_date('10-01-2022', 'dd-mm-yyyy'), to_date('22-10-2021', 'dd-mm-yyyy'), 1317, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2049, to_date('03-06-2022', 'dd-mm-yyyy'), to_date('25-08-2021', 'dd-mm-yyyy'), 1298, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2050, to_date('22-08-2022', 'dd-mm-yyyy'), to_date('30-04-2021', 'dd-mm-yyyy'), 1157, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2051, to_date('13-05-2022', 'dd-mm-yyyy'), to_date('30-09-2021', 'dd-mm-yyyy'), 1171, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2052, to_date('04-08-2022', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 1323, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2053, to_date('27-11-2022', 'dd-mm-yyyy'), to_date('05-04-2021', 'dd-mm-yyyy'), 1314, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2054, to_date('13-03-2022', 'dd-mm-yyyy'), to_date('13-02-2021', 'dd-mm-yyyy'), 1180, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2055, to_date('03-02-2022', 'dd-mm-yyyy'), to_date('18-11-2021', 'dd-mm-yyyy'), 1288, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2056, to_date('21-07-2022', 'dd-mm-yyyy'), to_date('25-11-2021', 'dd-mm-yyyy'), 1321, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2057, to_date('25-05-2022', 'dd-mm-yyyy'), to_date('15-01-2021', 'dd-mm-yyyy'), 1233, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2058, to_date('22-09-2022', 'dd-mm-yyyy'), to_date('15-09-2021', 'dd-mm-yyyy'), 1179, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2059, to_date('19-06-2022', 'dd-mm-yyyy'), to_date('20-07-2021', 'dd-mm-yyyy'), 1198, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2060, to_date('16-07-2022', 'dd-mm-yyyy'), to_date('04-04-2021', 'dd-mm-yyyy'), 1066, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2061, to_date('25-05-2022', 'dd-mm-yyyy'), to_date('04-02-2021', 'dd-mm-yyyy'), 1284, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2062, to_date('14-11-2022', 'dd-mm-yyyy'), to_date('04-03-2021', 'dd-mm-yyyy'), 1031, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2063, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 1024, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2064, to_date('26-07-2022', 'dd-mm-yyyy'), to_date('05-06-2021', 'dd-mm-yyyy'), 1349, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2065, to_date('08-04-2022', 'dd-mm-yyyy'), to_date('15-11-2021', 'dd-mm-yyyy'), 1178, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2066, to_date('16-11-2022', 'dd-mm-yyyy'), to_date('09-08-2021', 'dd-mm-yyyy'), 1036, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2067, to_date('31-03-2022', 'dd-mm-yyyy'), to_date('10-06-2021', 'dd-mm-yyyy'), 1158, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2068, to_date('23-06-2022', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), 1177, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2069, to_date('08-09-2022', 'dd-mm-yyyy'), to_date('06-05-2021', 'dd-mm-yyyy'), 1281, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2070, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('19-04-2021', 'dd-mm-yyyy'), 1097, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2071, to_date('10-02-2022', 'dd-mm-yyyy'), to_date('26-02-2021', 'dd-mm-yyyy'), 1037, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2072, to_date('11-05-2022', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), 1342, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2073, to_date('26-01-2022', 'dd-mm-yyyy'), to_date('16-03-2021', 'dd-mm-yyyy'), 1392, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2074, to_date('06-02-2022', 'dd-mm-yyyy'), to_date('06-12-2021', 'dd-mm-yyyy'), 1093, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2075, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('09-10-2021', 'dd-mm-yyyy'), 1114, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2076, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'), 1201, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2077, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('15-01-2021', 'dd-mm-yyyy'), 1117, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2078, to_date('04-10-2022', 'dd-mm-yyyy'), to_date('05-10-2021', 'dd-mm-yyyy'), 1251, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2079, to_date('26-03-2022', 'dd-mm-yyyy'), to_date('26-11-2021', 'dd-mm-yyyy'), 1239, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2080, to_date('07-05-2022', 'dd-mm-yyyy'), to_date('02-09-2021', 'dd-mm-yyyy'), 1047, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2081, to_date('25-09-2022', 'dd-mm-yyyy'), to_date('17-07-2021', 'dd-mm-yyyy'), 1042, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2082, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('19-10-2021', 'dd-mm-yyyy'), 1324, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2083, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('07-11-2021', 'dd-mm-yyyy'), 1032, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2084, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('05-10-2021', 'dd-mm-yyyy'), 1287, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2085, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 1112, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2086, to_date('07-10-2022', 'dd-mm-yyyy'), to_date('07-01-2021', 'dd-mm-yyyy'), 1367, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2087, to_date('03-01-2022', 'dd-mm-yyyy'), to_date('15-10-2021', 'dd-mm-yyyy'), 1054, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2088, to_date('08-02-2022', 'dd-mm-yyyy'), to_date('01-02-2021', 'dd-mm-yyyy'), 1216, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2089, to_date('26-01-2022', 'dd-mm-yyyy'), to_date('05-11-2021', 'dd-mm-yyyy'), 1001, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2090, to_date('27-12-2022', 'dd-mm-yyyy'), to_date('10-07-2021', 'dd-mm-yyyy'), 1310, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2091, to_date('05-08-2022', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 1187, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2092, to_date('23-12-2022', 'dd-mm-yyyy'), to_date('06-10-2021', 'dd-mm-yyyy'), 1391, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2093, to_date('24-02-2022', 'dd-mm-yyyy'), to_date('28-02-2021', 'dd-mm-yyyy'), 1291, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2094, to_date('02-06-2022', 'dd-mm-yyyy'), to_date('28-09-2021', 'dd-mm-yyyy'), 1330, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2095, to_date('10-11-2022', 'dd-mm-yyyy'), to_date('20-10-2021', 'dd-mm-yyyy'), 1007, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2096, to_date('02-05-2022', 'dd-mm-yyyy'), to_date('03-05-2021', 'dd-mm-yyyy'), 1209, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2097, to_date('17-10-2022', 'dd-mm-yyyy'), to_date('13-07-2021', 'dd-mm-yyyy'), 1046, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2098, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('15-08-2021', 'dd-mm-yyyy'), 1035, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2099, to_date('19-12-2022', 'dd-mm-yyyy'), to_date('08-04-2021', 'dd-mm-yyyy'), 1360, 1);
commit;
prompt 100 records committed...
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2100, to_date('30-04-2022', 'dd-mm-yyyy'), to_date('11-12-2021', 'dd-mm-yyyy'), 1277, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2101, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('29-11-2021', 'dd-mm-yyyy'), 1387, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2102, to_date('16-09-2022', 'dd-mm-yyyy'), to_date('19-10-2021', 'dd-mm-yyyy'), 1028, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2103, to_date('08-08-2022', 'dd-mm-yyyy'), to_date('18-11-2021', 'dd-mm-yyyy'), 1133, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2104, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('12-07-2021', 'dd-mm-yyyy'), 1392, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2105, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('20-06-2021', 'dd-mm-yyyy'), 1065, 23);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2106, to_date('05-04-2022', 'dd-mm-yyyy'), to_date('24-10-2021', 'dd-mm-yyyy'), 1292, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2107, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('27-12-2021', 'dd-mm-yyyy'), 1236, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2108, to_date('05-02-2022', 'dd-mm-yyyy'), to_date('03-01-2021', 'dd-mm-yyyy'), 1312, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2109, to_date('18-06-2022', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 1238, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2110, to_date('12-04-2022', 'dd-mm-yyyy'), to_date('07-04-2021', 'dd-mm-yyyy'), 1156, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2111, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'), 1371, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2112, to_date('24-09-2022', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 1136, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2113, to_date('03-09-2022', 'dd-mm-yyyy'), to_date('21-12-2021', 'dd-mm-yyyy'), 1047, 1000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2114, to_date('13-05-2022', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 1279, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2115, to_date('27-07-2022', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), 1210, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2116, to_date('05-08-2022', 'dd-mm-yyyy'), to_date('15-05-2021', 'dd-mm-yyyy'), 1272, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2117, to_date('08-08-2022', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 1188, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2118, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('30-05-2021', 'dd-mm-yyyy'), 1217, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2119, to_date('17-12-2022', 'dd-mm-yyyy'), to_date('12-10-2021', 'dd-mm-yyyy'), 1167, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2120, to_date('05-01-2022', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), 1219, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2121, to_date('14-09-2022', 'dd-mm-yyyy'), to_date('27-10-2021', 'dd-mm-yyyy'), 1090, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2122, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('19-05-2021', 'dd-mm-yyyy'), 1001, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2123, to_date('26-06-2022', 'dd-mm-yyyy'), to_date('20-01-2021', 'dd-mm-yyyy'), 1179, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2124, to_date('06-04-2022', 'dd-mm-yyyy'), to_date('22-02-2021', 'dd-mm-yyyy'), 1138, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2125, to_date('12-11-2022', 'dd-mm-yyyy'), to_date('06-06-2021', 'dd-mm-yyyy'), 1288, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2126, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('19-09-2021', 'dd-mm-yyyy'), 1116, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2127, to_date('27-02-2022', 'dd-mm-yyyy'), to_date('31-03-2021', 'dd-mm-yyyy'), 1074, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2128, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 1026, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2129, to_date('07-11-2022', 'dd-mm-yyyy'), to_date('30-03-2021', 'dd-mm-yyyy'), 1399, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2130, to_date('03-10-2022', 'dd-mm-yyyy'), to_date('19-03-2021', 'dd-mm-yyyy'), 1270, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2131, to_date('03-08-2022', 'dd-mm-yyyy'), to_date('03-07-2021', 'dd-mm-yyyy'), 1350, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2132, to_date('12-09-2022', 'dd-mm-yyyy'), to_date('24-02-2021', 'dd-mm-yyyy'), 1097, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2133, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('10-03-2021', 'dd-mm-yyyy'), 1295, 1000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2134, to_date('02-09-2022', 'dd-mm-yyyy'), to_date('13-11-2021', 'dd-mm-yyyy'), 1170, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2135, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('29-01-2021', 'dd-mm-yyyy'), 1150, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2136, to_date('04-02-2022', 'dd-mm-yyyy'), to_date('26-06-2021', 'dd-mm-yyyy'), 1348, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2137, to_date('14-04-2022', 'dd-mm-yyyy'), to_date('30-11-2021', 'dd-mm-yyyy'), 1083, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2138, to_date('01-09-2022', 'dd-mm-yyyy'), to_date('21-01-2021', 'dd-mm-yyyy'), 1301, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2139, to_date('14-09-2022', 'dd-mm-yyyy'), to_date('21-07-2021', 'dd-mm-yyyy'), 1035, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2140, to_date('16-08-2022', 'dd-mm-yyyy'), to_date('28-11-2021', 'dd-mm-yyyy'), 1143, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2141, to_date('11-07-2022', 'dd-mm-yyyy'), to_date('17-12-2021', 'dd-mm-yyyy'), 1073, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2142, to_date('26-07-2022', 'dd-mm-yyyy'), to_date('29-09-2021', 'dd-mm-yyyy'), 1297, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2143, to_date('21-06-2022', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), 1360, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2144, to_date('06-11-2022', 'dd-mm-yyyy'), to_date('12-08-2021', 'dd-mm-yyyy'), 1181, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2145, to_date('19-01-2022', 'dd-mm-yyyy'), to_date('20-12-2021', 'dd-mm-yyyy'), 1358, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2146, to_date('16-07-2022', 'dd-mm-yyyy'), to_date('25-08-2021', 'dd-mm-yyyy'), 1118, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2147, to_date('14-01-2022', 'dd-mm-yyyy'), to_date('19-02-2021', 'dd-mm-yyyy'), 1050, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2148, to_date('29-11-2022', 'dd-mm-yyyy'), to_date('24-08-2021', 'dd-mm-yyyy'), 1076, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2149, to_date('10-07-2022', 'dd-mm-yyyy'), to_date('07-11-2021', 'dd-mm-yyyy'), 1390, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2150, to_date('19-07-2022', 'dd-mm-yyyy'), to_date('10-06-2021', 'dd-mm-yyyy'), 1025, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2151, to_date('05-07-2022', 'dd-mm-yyyy'), to_date('17-08-2021', 'dd-mm-yyyy'), 1175, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2152, to_date('15-12-2022', 'dd-mm-yyyy'), to_date('05-02-2021', 'dd-mm-yyyy'), 1328, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2153, to_date('03-02-2022', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'), 1148, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2154, to_date('13-10-2022', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'), 1152, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2155, to_date('13-03-2022', 'dd-mm-yyyy'), to_date('22-02-2021', 'dd-mm-yyyy'), 1321, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2156, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('16-04-2021', 'dd-mm-yyyy'), 1302, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2157, to_date('07-11-2022', 'dd-mm-yyyy'), to_date('05-06-2021', 'dd-mm-yyyy'), 1122, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2158, to_date('06-02-2022', 'dd-mm-yyyy'), to_date('30-03-2021', 'dd-mm-yyyy'), 1086, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2159, to_date('24-01-2022', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'), 1172, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2160, to_date('30-03-2022', 'dd-mm-yyyy'), to_date('19-12-2021', 'dd-mm-yyyy'), 1199, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2161, to_date('31-03-2022', 'dd-mm-yyyy'), to_date('10-01-2021', 'dd-mm-yyyy'), 1082, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2162, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('12-01-2021', 'dd-mm-yyyy'), 1037, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2163, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('31-05-2021', 'dd-mm-yyyy'), 1278, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2164, to_date('05-10-2022', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 1234, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2165, to_date('16-07-2022', 'dd-mm-yyyy'), to_date('13-09-2021', 'dd-mm-yyyy'), 1252, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2166, to_date('06-05-2022', 'dd-mm-yyyy'), to_date('24-08-2021', 'dd-mm-yyyy'), 1019, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2167, to_date('31-01-2022', 'dd-mm-yyyy'), to_date('09-07-2021', 'dd-mm-yyyy'), 1035, 23);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2168, to_date('07-09-2022', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 1209, 36);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2169, to_date('26-03-2022', 'dd-mm-yyyy'), to_date('25-07-2021', 'dd-mm-yyyy'), 1093, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2170, to_date('31-03-2022', 'dd-mm-yyyy'), to_date('26-04-2021', 'dd-mm-yyyy'), 1217, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2171, to_date('06-05-2022', 'dd-mm-yyyy'), to_date('27-09-2021', 'dd-mm-yyyy'), 1057, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2172, to_date('06-10-2022', 'dd-mm-yyyy'), to_date('11-07-2021', 'dd-mm-yyyy'), 1290, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2173, to_date('04-07-2022', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), 1268, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2174, to_date('18-01-2022', 'dd-mm-yyyy'), to_date('08-05-2021', 'dd-mm-yyyy'), 1169, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2175, to_date('21-11-2022', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'), 1153, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2176, to_date('22-05-2022', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), 1180, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2177, to_date('31-08-2022', 'dd-mm-yyyy'), to_date('20-07-2021', 'dd-mm-yyyy'), 1224, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2178, to_date('30-06-2022', 'dd-mm-yyyy'), to_date('28-04-2021', 'dd-mm-yyyy'), 1339, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2179, to_date('29-06-2022', 'dd-mm-yyyy'), to_date('12-11-2021', 'dd-mm-yyyy'), 1101, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2180, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), 1295, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2181, to_date('25-07-2022', 'dd-mm-yyyy'), to_date('04-09-2021', 'dd-mm-yyyy'), 1164, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2182, to_date('13-08-2022', 'dd-mm-yyyy'), to_date('04-04-2021', 'dd-mm-yyyy'), 1089, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2183, to_date('15-03-2022', 'dd-mm-yyyy'), to_date('08-02-2021', 'dd-mm-yyyy'), 1023, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2184, to_date('12-08-2022', 'dd-mm-yyyy'), to_date('20-09-2021', 'dd-mm-yyyy'), 1140, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2185, to_date('18-01-2022', 'dd-mm-yyyy'), to_date('19-05-2021', 'dd-mm-yyyy'), 1222, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2186, to_date('05-03-2022', 'dd-mm-yyyy'), to_date('22-10-2021', 'dd-mm-yyyy'), 1058, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2187, to_date('12-10-2022', 'dd-mm-yyyy'), to_date('29-06-2021', 'dd-mm-yyyy'), 1360, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2188, to_date('02-02-2022', 'dd-mm-yyyy'), to_date('07-02-2021', 'dd-mm-yyyy'), 1281, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2189, to_date('29-05-2022', 'dd-mm-yyyy'), to_date('03-09-2021', 'dd-mm-yyyy'), 1041, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2190, to_date('03-02-2022', 'dd-mm-yyyy'), to_date('19-06-2021', 'dd-mm-yyyy'), 1135, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2191, to_date('18-02-2022', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), 1247, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2192, to_date('30-09-2022', 'dd-mm-yyyy'), to_date('26-06-2021', 'dd-mm-yyyy'), 1323, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2193, to_date('13-10-2022', 'dd-mm-yyyy'), to_date('29-11-2021', 'dd-mm-yyyy'), 1342, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2194, to_date('25-11-2022', 'dd-mm-yyyy'), to_date('22-09-2021', 'dd-mm-yyyy'), 1235, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2195, to_date('06-10-2022', 'dd-mm-yyyy'), to_date('11-04-2021', 'dd-mm-yyyy'), 1289, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2196, to_date('13-09-2022', 'dd-mm-yyyy'), to_date('23-10-2021', 'dd-mm-yyyy'), 1084, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2197, to_date('18-08-2022', 'dd-mm-yyyy'), to_date('20-12-2021', 'dd-mm-yyyy'), 1105, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2198, to_date('02-03-2022', 'dd-mm-yyyy'), to_date('15-04-2021', 'dd-mm-yyyy'), 1272, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2199, to_date('09-03-2022', 'dd-mm-yyyy'), to_date('23-12-2021', 'dd-mm-yyyy'), 1134, 29);
commit;
prompt 200 records committed...
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2200, to_date('30-04-2022', 'dd-mm-yyyy'), to_date('30-04-2021', 'dd-mm-yyyy'), 1370, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2201, to_date('23-02-2022', 'dd-mm-yyyy'), to_date('11-06-2021', 'dd-mm-yyyy'), 1142, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2202, to_date('06-12-2022', 'dd-mm-yyyy'), to_date('27-03-2021', 'dd-mm-yyyy'), 1137, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2203, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('26-10-2021', 'dd-mm-yyyy'), 1049, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2204, to_date('13-09-2022', 'dd-mm-yyyy'), to_date('05-10-2021', 'dd-mm-yyyy'), 1150, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2205, to_date('18-09-2022', 'dd-mm-yyyy'), to_date('02-11-2021', 'dd-mm-yyyy'), 1271, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2206, to_date('28-02-2022', 'dd-mm-yyyy'), to_date('25-03-2021', 'dd-mm-yyyy'), 1070, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2207, to_date('31-03-2022', 'dd-mm-yyyy'), to_date('26-04-2021', 'dd-mm-yyyy'), 1097, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2208, to_date('10-01-2022', 'dd-mm-yyyy'), to_date('02-07-2021', 'dd-mm-yyyy'), 1129, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2209, to_date('28-04-2022', 'dd-mm-yyyy'), to_date('27-09-2021', 'dd-mm-yyyy'), 1091, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2210, to_date('01-03-2022', 'dd-mm-yyyy'), to_date('12-09-2021', 'dd-mm-yyyy'), 1237, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2211, to_date('26-12-2022', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 1109, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2212, to_date('01-02-2022', 'dd-mm-yyyy'), to_date('19-10-2021', 'dd-mm-yyyy'), 1326, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2213, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('07-01-2021', 'dd-mm-yyyy'), 1157, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2214, to_date('17-01-2022', 'dd-mm-yyyy'), to_date('03-01-2021', 'dd-mm-yyyy'), 1305, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2215, to_date('07-08-2022', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), 1060, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2216, to_date('30-08-2022', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 1051, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2217, to_date('17-05-2022', 'dd-mm-yyyy'), to_date('03-01-2021', 'dd-mm-yyyy'), 1359, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2218, to_date('18-02-2022', 'dd-mm-yyyy'), to_date('04-09-2021', 'dd-mm-yyyy'), 1216, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2219, to_date('17-04-2022', 'dd-mm-yyyy'), to_date('16-05-2021', 'dd-mm-yyyy'), 1043, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2220, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('25-06-2021', 'dd-mm-yyyy'), 1271, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2221, to_date('03-11-2022', 'dd-mm-yyyy'), to_date('12-09-2021', 'dd-mm-yyyy'), 1290, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2222, to_date('06-06-2022', 'dd-mm-yyyy'), to_date('16-07-2021', 'dd-mm-yyyy'), 1161, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2223, to_date('02-12-2022', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), 1247, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2224, to_date('10-03-2022', 'dd-mm-yyyy'), to_date('03-05-2021', 'dd-mm-yyyy'), 1396, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2225, to_date('07-04-2022', 'dd-mm-yyyy'), to_date('30-11-2021', 'dd-mm-yyyy'), 1026, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2226, to_date('09-01-2022', 'dd-mm-yyyy'), to_date('10-12-2021', 'dd-mm-yyyy'), 1159, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2227, to_date('03-06-2022', 'dd-mm-yyyy'), to_date('12-05-2021', 'dd-mm-yyyy'), 1130, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2228, to_date('11-09-2022', 'dd-mm-yyyy'), to_date('24-01-2021', 'dd-mm-yyyy'), 1246, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2229, to_date('19-04-2022', 'dd-mm-yyyy'), to_date('08-07-2021', 'dd-mm-yyyy'), 1101, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2230, to_date('23-07-2022', 'dd-mm-yyyy'), to_date('09-12-2021', 'dd-mm-yyyy'), 1026, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2231, to_date('08-04-2022', 'dd-mm-yyyy'), to_date('24-03-2021', 'dd-mm-yyyy'), 1394, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2232, to_date('14-09-2022', 'dd-mm-yyyy'), to_date('05-01-2021', 'dd-mm-yyyy'), 1030, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2233, to_date('01-11-2022', 'dd-mm-yyyy'), to_date('30-07-2021', 'dd-mm-yyyy'), 1278, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2234, to_date('25-08-2022', 'dd-mm-yyyy'), to_date('19-06-2021', 'dd-mm-yyyy'), 1158, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2235, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('24-01-2021', 'dd-mm-yyyy'), 1159, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2236, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 1320, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2237, to_date('13-06-2022', 'dd-mm-yyyy'), to_date('27-07-2021', 'dd-mm-yyyy'), 1328, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2238, to_date('29-04-2022', 'dd-mm-yyyy'), to_date('14-07-2021', 'dd-mm-yyyy'), 1296, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2239, to_date('05-02-2022', 'dd-mm-yyyy'), to_date('17-02-2021', 'dd-mm-yyyy'), 1140, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2240, to_date('11-06-2022', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'), 1024, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2241, to_date('30-10-2022', 'dd-mm-yyyy'), to_date('25-07-2021', 'dd-mm-yyyy'), 1005, 23);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2242, to_date('22-06-2022', 'dd-mm-yyyy'), to_date('02-06-2021', 'dd-mm-yyyy'), 1311, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2243, to_date('29-07-2022', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'), 1221, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2244, to_date('20-04-2022', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 1367, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2245, to_date('24-03-2022', 'dd-mm-yyyy'), to_date('28-05-2021', 'dd-mm-yyyy'), 1217, 1000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2246, to_date('06-04-2022', 'dd-mm-yyyy'), to_date('05-11-2021', 'dd-mm-yyyy'), 1172, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2247, to_date('03-04-2022', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'), 1230, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2248, to_date('14-10-2022', 'dd-mm-yyyy'), to_date('11-03-2021', 'dd-mm-yyyy'), 1058, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2249, to_date('16-11-2022', 'dd-mm-yyyy'), to_date('25-11-2021', 'dd-mm-yyyy'), 1205, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2250, to_date('05-08-2022', 'dd-mm-yyyy'), to_date('07-03-2021', 'dd-mm-yyyy'), 1324, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2251, to_date('15-10-2022', 'dd-mm-yyyy'), to_date('21-01-2021', 'dd-mm-yyyy'), 1316, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2252, to_date('16-06-2022', 'dd-mm-yyyy'), to_date('29-04-2021', 'dd-mm-yyyy'), 1070, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2253, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('07-01-2021', 'dd-mm-yyyy'), 1317, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2254, to_date('14-07-2022', 'dd-mm-yyyy'), to_date('10-08-2021', 'dd-mm-yyyy'), 1061, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2255, to_date('22-12-2022', 'dd-mm-yyyy'), to_date('04-01-2021', 'dd-mm-yyyy'), 1118, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2256, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('02-12-2021', 'dd-mm-yyyy'), 1014, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2257, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('24-01-2021', 'dd-mm-yyyy'), 1382, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2258, to_date('02-10-2022', 'dd-mm-yyyy'), to_date('01-05-2021', 'dd-mm-yyyy'), 1306, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2259, to_date('15-03-2022', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 1349, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2260, to_date('03-12-2022', 'dd-mm-yyyy'), to_date('18-02-2021', 'dd-mm-yyyy'), 1115, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2261, to_date('06-11-2022', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'), 1086, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2262, to_date('15-12-2022', 'dd-mm-yyyy'), to_date('30-09-2021', 'dd-mm-yyyy'), 1379, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2263, to_date('19-11-2022', 'dd-mm-yyyy'), to_date('13-01-2021', 'dd-mm-yyyy'), 1362, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2264, to_date('30-06-2022', 'dd-mm-yyyy'), to_date('28-05-2021', 'dd-mm-yyyy'), 1384, 27);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2265, to_date('06-02-2022', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), 1146, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2266, to_date('01-05-2022', 'dd-mm-yyyy'), to_date('26-08-2021', 'dd-mm-yyyy'), 1376, 23);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2267, to_date('21-11-2022', 'dd-mm-yyyy'), to_date('03-10-2021', 'dd-mm-yyyy'), 1132, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2268, to_date('04-09-2022', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 1196, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2269, to_date('07-01-2022', 'dd-mm-yyyy'), to_date('11-11-2021', 'dd-mm-yyyy'), 1287, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2270, to_date('24-12-2022', 'dd-mm-yyyy'), to_date('28-05-2021', 'dd-mm-yyyy'), 1344, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2271, to_date('30-12-2022', 'dd-mm-yyyy'), to_date('29-01-2021', 'dd-mm-yyyy'), 1227, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2272, to_date('27-04-2022', 'dd-mm-yyyy'), to_date('08-07-2021', 'dd-mm-yyyy'), 1264, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2273, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('17-01-2021', 'dd-mm-yyyy'), 1014, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2274, to_date('09-05-2022', 'dd-mm-yyyy'), to_date('18-02-2021', 'dd-mm-yyyy'), 1256, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2275, to_date('24-04-2022', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 1183, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2276, to_date('02-11-2022', 'dd-mm-yyyy'), to_date('29-05-2021', 'dd-mm-yyyy'), 1214, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2277, to_date('16-06-2022', 'dd-mm-yyyy'), to_date('10-05-2021', 'dd-mm-yyyy'), 1189, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2278, to_date('12-09-2022', 'dd-mm-yyyy'), to_date('30-11-2021', 'dd-mm-yyyy'), 1385, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2279, to_date('20-09-2022', 'dd-mm-yyyy'), to_date('19-01-2021', 'dd-mm-yyyy'), 1083, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2280, to_date('30-08-2022', 'dd-mm-yyyy'), to_date('01-11-2021', 'dd-mm-yyyy'), 1158, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2281, to_date('11-05-2022', 'dd-mm-yyyy'), to_date('30-01-2021', 'dd-mm-yyyy'), 1208, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2282, to_date('25-06-2022', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'), 1077, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2283, to_date('27-04-2022', 'dd-mm-yyyy'), to_date('27-10-2021', 'dd-mm-yyyy'), 1126, 9);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2284, to_date('01-09-2022', 'dd-mm-yyyy'), to_date('12-07-2021', 'dd-mm-yyyy'), 1274, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2285, to_date('22-07-2022', 'dd-mm-yyyy'), to_date('01-03-2021', 'dd-mm-yyyy'), 1369, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2286, to_date('03-11-2022', 'dd-mm-yyyy'), to_date('27-10-2021', 'dd-mm-yyyy'), 1132, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2287, to_date('09-11-2022', 'dd-mm-yyyy'), to_date('24-10-2021', 'dd-mm-yyyy'), 1208, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2288, to_date('10-08-2022', 'dd-mm-yyyy'), to_date('20-08-2021', 'dd-mm-yyyy'), 1375, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2289, to_date('14-04-2022', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 1256, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2290, to_date('06-01-2022', 'dd-mm-yyyy'), to_date('15-07-2021', 'dd-mm-yyyy'), 1374, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2291, to_date('27-02-2022', 'dd-mm-yyyy'), to_date('21-04-2021', 'dd-mm-yyyy'), 1292, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2292, to_date('26-07-2022', 'dd-mm-yyyy'), to_date('29-11-2021', 'dd-mm-yyyy'), 1289, 6);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2293, to_date('03-08-2022', 'dd-mm-yyyy'), to_date('20-07-2021', 'dd-mm-yyyy'), 1308, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2294, to_date('14-10-2022', 'dd-mm-yyyy'), to_date('12-11-2021', 'dd-mm-yyyy'), 1026, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2295, to_date('03-08-2022', 'dd-mm-yyyy'), to_date('08-03-2021', 'dd-mm-yyyy'), 1386, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2296, to_date('18-05-2022', 'dd-mm-yyyy'), to_date('26-11-2021', 'dd-mm-yyyy'), 1230, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2297, to_date('30-09-2022', 'dd-mm-yyyy'), to_date('10-09-2021', 'dd-mm-yyyy'), 1195, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2298, to_date('27-11-2022', 'dd-mm-yyyy'), to_date('12-06-2021', 'dd-mm-yyyy'), 1089, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2299, to_date('18-06-2022', 'dd-mm-yyyy'), to_date('28-02-2021', 'dd-mm-yyyy'), 1116, 2000);
commit;
prompt 300 records committed...
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2300, to_date('28-01-2022', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), 1377, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2301, to_date('23-09-2022', 'dd-mm-yyyy'), to_date('28-03-2021', 'dd-mm-yyyy'), 1394, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2302, to_date('19-07-2022', 'dd-mm-yyyy'), to_date('30-12-2021', 'dd-mm-yyyy'), 1112, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2303, to_date('01-07-2022', 'dd-mm-yyyy'), to_date('06-12-2021', 'dd-mm-yyyy'), 1306, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2304, to_date('01-05-2022', 'dd-mm-yyyy'), to_date('28-04-2021', 'dd-mm-yyyy'), 1045, 30);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2305, to_date('10-08-2022', 'dd-mm-yyyy'), to_date('16-03-2021', 'dd-mm-yyyy'), 1164, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2306, to_date('25-09-2022', 'dd-mm-yyyy'), to_date('29-06-2021', 'dd-mm-yyyy'), 1171, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2307, to_date('02-04-2022', 'dd-mm-yyyy'), to_date('21-05-2021', 'dd-mm-yyyy'), 1143, 32);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2308, to_date('18-11-2022', 'dd-mm-yyyy'), to_date('03-07-2021', 'dd-mm-yyyy'), 1064, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2309, to_date('11-01-2022', 'dd-mm-yyyy'), to_date('25-05-2021', 'dd-mm-yyyy'), 1322, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2310, to_date('12-10-2022', 'dd-mm-yyyy'), to_date('14-05-2021', 'dd-mm-yyyy'), 1041, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2311, to_date('22-07-2022', 'dd-mm-yyyy'), to_date('13-10-2021', 'dd-mm-yyyy'), 1364, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2312, to_date('21-12-2022', 'dd-mm-yyyy'), to_date('14-04-2021', 'dd-mm-yyyy'), 1349, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2313, to_date('15-08-2022', 'dd-mm-yyyy'), to_date('28-07-2021', 'dd-mm-yyyy'), 1013, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2314, to_date('22-09-2022', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 1374, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2315, to_date('11-12-2022', 'dd-mm-yyyy'), to_date('07-12-2021', 'dd-mm-yyyy'), 1021, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2316, to_date('20-10-2022', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'), 1280, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2317, to_date('12-06-2022', 'dd-mm-yyyy'), to_date('26-08-2021', 'dd-mm-yyyy'), 1293, 38);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2318, to_date('11-10-2022', 'dd-mm-yyyy'), to_date('29-04-2021', 'dd-mm-yyyy'), 1271, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2319, to_date('12-02-2022', 'dd-mm-yyyy'), to_date('29-05-2021', 'dd-mm-yyyy'), 1063, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2320, to_date('11-12-2022', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 1275, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2321, to_date('08-06-2022', 'dd-mm-yyyy'), to_date('22-11-2021', 'dd-mm-yyyy'), 1095, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2322, to_date('30-09-2022', 'dd-mm-yyyy'), to_date('18-03-2021', 'dd-mm-yyyy'), 1059, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2323, to_date('07-05-2022', 'dd-mm-yyyy'), to_date('14-09-2021', 'dd-mm-yyyy'), 1106, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2324, to_date('20-10-2022', 'dd-mm-yyyy'), to_date('20-04-2021', 'dd-mm-yyyy'), 1164, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2325, to_date('26-10-2022', 'dd-mm-yyyy'), to_date('30-01-2021', 'dd-mm-yyyy'), 1213, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2326, to_date('25-06-2022', 'dd-mm-yyyy'), to_date('08-06-2021', 'dd-mm-yyyy'), 1066, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2327, to_date('09-12-2022', 'dd-mm-yyyy'), to_date('10-06-2021', 'dd-mm-yyyy'), 1011, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2328, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('26-11-2021', 'dd-mm-yyyy'), 1364, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2329, to_date('31-07-2022', 'dd-mm-yyyy'), to_date('21-09-2021', 'dd-mm-yyyy'), 1070, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2330, to_date('21-04-2022', 'dd-mm-yyyy'), to_date('30-06-2021', 'dd-mm-yyyy'), 1193, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2331, to_date('27-08-2022', 'dd-mm-yyyy'), to_date('21-07-2021', 'dd-mm-yyyy'), 1258, 35);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2332, to_date('28-12-2022', 'dd-mm-yyyy'), to_date('28-10-2021', 'dd-mm-yyyy'), 1258, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2333, to_date('17-11-2022', 'dd-mm-yyyy'), to_date('21-03-2021', 'dd-mm-yyyy'), 1096, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2334, to_date('18-06-2022', 'dd-mm-yyyy'), to_date('15-06-2021', 'dd-mm-yyyy'), 1296, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2335, to_date('27-02-2022', 'dd-mm-yyyy'), to_date('18-06-2021', 'dd-mm-yyyy'), 1323, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2336, to_date('28-02-2022', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'), 1164, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2337, to_date('28-06-2022', 'dd-mm-yyyy'), to_date('26-01-2021', 'dd-mm-yyyy'), 1103, 26);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2338, to_date('19-07-2022', 'dd-mm-yyyy'), to_date('22-02-2021', 'dd-mm-yyyy'), 1151, 39);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2339, to_date('14-06-2022', 'dd-mm-yyyy'), to_date('15-04-2021', 'dd-mm-yyyy'), 1247, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2340, to_date('10-08-2022', 'dd-mm-yyyy'), to_date('29-08-2021', 'dd-mm-yyyy'), 1113, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2341, to_date('31-03-2022', 'dd-mm-yyyy'), to_date('18-01-2021', 'dd-mm-yyyy'), 1061, 10);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2342, to_date('10-12-2022', 'dd-mm-yyyy'), to_date('06-05-2021', 'dd-mm-yyyy'), 1237, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2343, to_date('23-04-2022', 'dd-mm-yyyy'), to_date('04-01-2021', 'dd-mm-yyyy'), 1220, 1000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2344, to_date('24-05-2022', 'dd-mm-yyyy'), to_date('08-12-2021', 'dd-mm-yyyy'), 1226, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2345, to_date('23-06-2022', 'dd-mm-yyyy'), to_date('25-05-2021', 'dd-mm-yyyy'), 1069, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2346, to_date('05-04-2022', 'dd-mm-yyyy'), to_date('22-12-2021', 'dd-mm-yyyy'), 1110, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2347, to_date('19-09-2022', 'dd-mm-yyyy'), to_date('03-09-2021', 'dd-mm-yyyy'), 1147, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2348, to_date('15-01-2022', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'), 1285, 8);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2349, to_date('08-06-2022', 'dd-mm-yyyy'), to_date('03-01-2021', 'dd-mm-yyyy'), 1334, 5);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2350, to_date('11-10-2022', 'dd-mm-yyyy'), to_date('10-04-2021', 'dd-mm-yyyy'), 1374, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2351, to_date('25-04-2022', 'dd-mm-yyyy'), to_date('27-07-2021', 'dd-mm-yyyy'), 1029, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2352, to_date('09-12-2022', 'dd-mm-yyyy'), to_date('19-01-2021', 'dd-mm-yyyy'), 1111, 23);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2353, to_date('30-09-2022', 'dd-mm-yyyy'), to_date('14-08-2021', 'dd-mm-yyyy'), 1346, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2354, to_date('15-11-2022', 'dd-mm-yyyy'), to_date('01-01-2021', 'dd-mm-yyyy'), 1258, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2355, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('04-06-2021', 'dd-mm-yyyy'), 1337, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2356, to_date('24-10-2022', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), 1337, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2357, to_date('05-11-2022', 'dd-mm-yyyy'), to_date('27-12-2021', 'dd-mm-yyyy'), 1048, 20);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2358, to_date('19-06-2022', 'dd-mm-yyyy'), to_date('11-08-2021', 'dd-mm-yyyy'), 1393, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2359, to_date('27-06-2022', 'dd-mm-yyyy'), to_date('01-08-2021', 'dd-mm-yyyy'), 1385, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2360, to_date('21-02-2022', 'dd-mm-yyyy'), to_date('22-10-2021', 'dd-mm-yyyy'), 1384, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2361, to_date('28-05-2022', 'dd-mm-yyyy'), to_date('05-02-2021', 'dd-mm-yyyy'), 1218, 15);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2362, to_date('15-06-2022', 'dd-mm-yyyy'), to_date('13-06-2021', 'dd-mm-yyyy'), 1386, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2363, to_date('09-07-2022', 'dd-mm-yyyy'), to_date('17-03-2021', 'dd-mm-yyyy'), 1305, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2364, to_date('06-08-2022', 'dd-mm-yyyy'), to_date('12-08-2021', 'dd-mm-yyyy'), 1036, 37);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2365, to_date('11-10-2022', 'dd-mm-yyyy'), to_date('02-05-2021', 'dd-mm-yyyy'), 1039, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2366, to_date('24-02-2022', 'dd-mm-yyyy'), to_date('05-12-2021', 'dd-mm-yyyy'), 1392, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2367, to_date('12-07-2022', 'dd-mm-yyyy'), to_date('12-06-2021', 'dd-mm-yyyy'), 1226, 2000);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2368, to_date('28-06-2022', 'dd-mm-yyyy'), to_date('07-07-2021', 'dd-mm-yyyy'), 1217, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2369, to_date('09-06-2022', 'dd-mm-yyyy'), to_date('30-08-2021', 'dd-mm-yyyy'), 1278, 12);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2370, to_date('19-09-2022', 'dd-mm-yyyy'), to_date('26-09-2021', 'dd-mm-yyyy'), 1293, 11);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2371, to_date('18-12-2022', 'dd-mm-yyyy'), to_date('23-08-2021', 'dd-mm-yyyy'), 1243, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2372, to_date('13-03-2022', 'dd-mm-yyyy'), to_date('10-10-2021', 'dd-mm-yyyy'), 1159, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2373, to_date('30-05-2022', 'dd-mm-yyyy'), to_date('02-11-2021', 'dd-mm-yyyy'), 1054, 17);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2374, to_date('11-08-2022', 'dd-mm-yyyy'), to_date('01-01-2021', 'dd-mm-yyyy'), 1071, 21);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2375, to_date('16-07-2022', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 1398, 3);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2376, to_date('10-08-2022', 'dd-mm-yyyy'), to_date('11-03-2021', 'dd-mm-yyyy'), 1187, 29);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2377, to_date('21-09-2022', 'dd-mm-yyyy'), to_date('31-07-2021', 'dd-mm-yyyy'), 1022, 19);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2378, to_date('04-01-2022', 'dd-mm-yyyy'), to_date('01-07-2021', 'dd-mm-yyyy'), 1183, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2379, to_date('09-09-2022', 'dd-mm-yyyy'), to_date('24-04-2021', 'dd-mm-yyyy'), 1251, 14);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2380, to_date('24-07-2022', 'dd-mm-yyyy'), to_date('19-04-2021', 'dd-mm-yyyy'), 1086, 34);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2381, to_date('27-10-2022', 'dd-mm-yyyy'), to_date('04-10-2021', 'dd-mm-yyyy'), 1342, 28);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2382, to_date('07-04-2022', 'dd-mm-yyyy'), to_date('24-10-2021', 'dd-mm-yyyy'), 1338, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2383, to_date('31-12-2022', 'dd-mm-yyyy'), to_date('25-01-2021', 'dd-mm-yyyy'), 1055, 31);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2384, to_date('09-04-2022', 'dd-mm-yyyy'), to_date('20-07-2021', 'dd-mm-yyyy'), 1280, 40);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2385, to_date('12-01-2022', 'dd-mm-yyyy'), to_date('31-07-2021', 'dd-mm-yyyy'), 1255, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2386, to_date('28-04-2022', 'dd-mm-yyyy'), to_date('23-07-2021', 'dd-mm-yyyy'), 1268, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2387, to_date('20-08-2022', 'dd-mm-yyyy'), to_date('25-09-2021', 'dd-mm-yyyy'), 1334, 25);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2388, to_date('11-10-2022', 'dd-mm-yyyy'), to_date('03-07-2021', 'dd-mm-yyyy'), 1205, 2);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2389, to_date('23-12-2022', 'dd-mm-yyyy'), to_date('16-10-2021', 'dd-mm-yyyy'), 1060, 33);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2390, to_date('05-03-2022', 'dd-mm-yyyy'), to_date('16-07-2021', 'dd-mm-yyyy'), 1107, 13);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2391, to_date('15-10-2022', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 1254, 7);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2392, to_date('19-05-2022', 'dd-mm-yyyy'), to_date('04-01-2021', 'dd-mm-yyyy'), 1286, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2393, to_date('10-01-2022', 'dd-mm-yyyy'), to_date('05-11-2021', 'dd-mm-yyyy'), 1287, 22);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2394, to_date('15-04-2022', 'dd-mm-yyyy'), to_date('14-12-2021', 'dd-mm-yyyy'), 1364, 4);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2395, to_date('11-02-2022', 'dd-mm-yyyy'), to_date('25-05-2021', 'dd-mm-yyyy'), 1003, 24);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2396, to_date('28-01-2022', 'dd-mm-yyyy'), to_date('30-05-2021', 'dd-mm-yyyy'), 1309, 16);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2397, to_date('24-09-2022', 'dd-mm-yyyy'), to_date('05-02-2021', 'dd-mm-yyyy'), 1072, 18);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2398, to_date('16-01-2022', 'dd-mm-yyyy'), to_date('27-07-2021', 'dd-mm-yyyy'), 1298, 1);
insert into EVENTS_ (eventid, eventdate, eventconfirmationdate, customerid, venueid)
values (2399, to_date('03-03-2022', 'dd-mm-yyyy'), to_date('28-08-2021', 'dd-mm-yyyy'), 1361, 11);
commit;
prompt 400 records loaded
prompt Loading PAYMENTS...
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4000, 9123.24, to_date('07-12-1914', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1373, 2087);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4001, 32552.32, to_date('12-06-2002', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1061, 2005);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4002, 5585.25, to_date('16-01-1964', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1332, 2127);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4003, 19456.69, to_date('30-01-1905', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1302, 2032);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4004, 28126.09, to_date('20-04-1932', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1316, 2147);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4005, 22085.99, to_date('16-06-1904', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1269, 2206);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4006, 33248.29, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1235, 2296);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4007, 27550.07, to_date('14-03-1992', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1158, 2362);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4008, 47388.65, to_date('31-03-2014', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1250, 2090);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4009, 32245, to_date('16-12-1952', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1280, 2027);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4010, 17105.12, to_date('14-10-1984', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1020, 2071);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4011, 24538.56, to_date('18-12-1998', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1011, 2385);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4012, 12543.6, to_date('08-08-2021', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1321, 2272);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4013, 26518.35, to_date('27-10-1974', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1270, 2258);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4014, 39967.24, to_date('19-10-1987', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1179, 2322);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4015, 14802.27, to_date('11-09-2007', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1321, 2124);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4016, 48348.25, to_date('05-11-1989', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1340, 2368);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4017, 35411.63, to_date('22-09-1977', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1103, 2150);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4018, 40022.15, to_date('06-06-1914', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1261, 2025);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4019, 17706.66, to_date('02-11-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1080, 2253);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4020, 15404.62, to_date('19-08-1910', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1218, 2148);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4021, 7384.55, to_date('24-10-1954', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1216, 2191);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4022, 21770.79, to_date('06-06-1942', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1155, 2236);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4023, 8540.04, to_date('02-09-1955', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1082, 2070);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4024, 36097, to_date('25-06-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1039, 2251);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4025, 19788.42, to_date('25-05-1939', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1083, 2085);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4026, 41965.12, to_date('04-04-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1160, 2071);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4027, 39451.09, to_date('15-12-1943', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1206, 2275);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4028, 30529.35, to_date('15-06-1935', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1136, 2160);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4029, 39803.63, to_date('18-08-1934', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1300, 2320);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4030, 15545.53, to_date('02-10-1946', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1261, 2273);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4031, 45386.32, to_date('29-08-2016', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1280, 2143);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4032, 17462.91, to_date('09-11-1920', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1365, 2177);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4033, 45377.2, to_date('16-03-1968', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1253, 2151);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4034, 16578.43, to_date('11-11-2000', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1205, 2397);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4035, 10027.61, to_date('16-08-1968', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1168, 2297);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4036, 10253.6, to_date('05-12-1980', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1181, 2197);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4037, 11160.23, to_date('17-01-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1197, 2367);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4038, 39193.69, to_date('13-04-1921', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1375, 2375);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4039, 41729.66, to_date('07-04-1951', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1235, 2290);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4040, 47789.6, to_date('07-07-1958', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1315, 2087);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4041, 29445.43, to_date('20-12-1961', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1128, 2074);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4042, 28522.14, to_date('07-03-1936', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1266, 2098);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4043, 44457.56, to_date('29-03-1902', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1227, 2170);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4044, 45428.81, to_date('05-10-1980', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1044, 2055);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4045, 26104.61, to_date('30-05-1967', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1262, 2261);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4046, 46633.1, to_date('13-11-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1157, 2188);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4047, 18724.23, to_date('04-03-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1146, 2066);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4048, 5936.33, to_date('23-10-2013', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1069, 2231);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4049, 16526.19, to_date('27-01-1961', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1305, 2184);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4050, 33471.89, to_date('22-06-1962', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1391, 2374);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4051, 47527.94, to_date('13-04-1969', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1324, 2152);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4052, 5422.04, to_date('22-06-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1193, 2236);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4053, 46552.67, to_date('25-08-1913', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1332, 2135);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4054, 17797.25, to_date('03-09-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1247, 2266);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4055, 12289.83, to_date('19-02-2009', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1297, 2232);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4056, 44277.99, to_date('11-12-1999', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1190, 2364);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4057, 43418.18, to_date('28-06-2023', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1060, 2219);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4058, 13118.96, to_date('29-04-1997', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1014, 2132);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4059, 28791.37, to_date('16-04-1974', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1083, 2107);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4060, 33115.98, to_date('08-06-1947', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1282, 2350);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4061, 26685.93, to_date('13-04-2021', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1125, 2329);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4062, 48635.23, to_date('14-03-1916', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1268, 2071);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4063, 28111.88, to_date('30-12-1928', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1251, 2355);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4064, 48705.06, to_date('06-12-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1018, 2149);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4065, 49185.74, to_date('04-10-1974', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1154, 2122);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4066, 20170.27, to_date('25-08-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1346, 2387);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4067, 12566.06, to_date('23-11-1926', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1006, 2304);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4068, 49908.96, to_date('25-10-1900', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1343, 2310);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4069, 47951.53, to_date('18-05-1968', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1041, 2192);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4070, 36111.76, to_date('15-04-1953', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1022, 2367);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4071, 41641.44, to_date('05-09-1940', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1053, 2008);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4072, 43623.67, to_date('14-08-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1078, 2352);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4073, 10158.82, to_date('03-01-1908', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1025, 2045);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4074, 43348.35, to_date('10-09-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1381, 2256);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4075, 37935.9, to_date('22-10-1916', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1280, 2221);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4076, 25714.91, to_date('23-08-1906', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1390, 2338);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4077, 49062.23, to_date('12-08-1950', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1360, 2075);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4078, 38207.19, to_date('02-02-1983', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1294, 2028);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4079, 43095.18, to_date('06-03-1955', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1228, 2372);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4080, 11955.59, to_date('10-09-1907', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1074, 2049);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4081, 29933, to_date('10-12-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1195, 2342);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4082, 7391.37, to_date('11-01-1999', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1094, 2166);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4083, 23750.37, to_date('23-10-1988', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1371, 2141);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4084, 23963.39, to_date('02-10-2017', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1019, 2162);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4085, 5996.44, to_date('22-03-1931', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1044, 2139);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4086, 48917.48, to_date('01-02-1969', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1050, 2033);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4087, 37455.4, to_date('23-07-1963', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1184, 2232);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4088, 30138.19, to_date('28-08-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1092, 2220);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4089, 24369.49, to_date('02-11-1930', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1266, 2376);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4090, 43053.09, to_date('21-07-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1043, 2249);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4091, 38624.57, to_date('07-10-2017', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1226, 2351);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4092, 21599.6, to_date('21-10-1960', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1007, 2213);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4093, 21998.17, to_date('12-01-2016', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1336, 2349);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4094, 43254.24, to_date('06-02-1986', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1038, 2267);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4095, 44470.03, to_date('22-12-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1209, 2380);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4096, 43124.47, to_date('03-11-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1201, 2151);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4097, 36595.12, to_date('23-07-1919', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1123, 2116);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4098, 37102.94, to_date('30-06-1958', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1163, 2343);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4099, 30939.25, to_date('11-08-1958', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1275, 2349);
commit;
prompt 100 records committed...
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4100, 44084.35, to_date('24-04-2011', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1311, 2034);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4101, 12577.07, to_date('05-06-1953', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1361, 2076);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4102, 22244.69, to_date('08-04-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1384, 2320);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4103, 8652.6, to_date('30-08-1951', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1273, 2015);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4104, 44383.05, to_date('27-05-2005', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1047, 2235);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4105, 12002.35, to_date('15-07-1938', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1330, 2137);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4106, 37325.95, to_date('29-05-1923', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1175, 2393);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4107, 8840.77, to_date('16-05-1971', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1229, 2034);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4108, 30394.09, to_date('03-08-1993', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1070, 2269);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4109, 20508.4, to_date('25-05-2009', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1324, 2099);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4110, 12931.67, to_date('21-01-1969', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1199, 2291);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4111, 24282.31, to_date('03-12-1938', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1026, 2340);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4112, 30898.2, to_date('02-05-1928', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1062, 2371);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4113, 23249.25, to_date('16-10-1918', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1133, 2021);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4114, 27522.78, to_date('07-03-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1379, 2049);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4115, 40241.12, to_date('19-02-1921', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1278, 2116);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4116, 13020.87, to_date('15-10-1905', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1006, 2270);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4117, 35833.05, to_date('28-06-1967', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1312, 2202);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4118, 23373.66, to_date('10-04-2016', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1374, 2384);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4119, 20403.95, to_date('23-02-1935', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1002, 2168);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4120, 48169.79, to_date('17-06-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1256, 2365);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4121, 45259.54, to_date('29-11-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1260, 2354);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4122, 17509.7, to_date('09-01-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1055, 2268);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4123, 27817.9, to_date('03-02-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1295, 2107);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4124, 27972.39, to_date('26-11-1919', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1019, 2098);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4125, 40857.55, to_date('02-11-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1293, 2375);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4126, 42644.75, to_date('14-01-2007', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1380, 2108);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4127, 30827.94, to_date('18-10-1956', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1012, 2315);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4128, 10213.33, to_date('02-06-1984', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1222, 2329);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4129, 45222.54, to_date('26-01-1950', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1119, 2330);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4130, 43118.64, to_date('24-06-1955', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1267, 2114);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4131, 24014.36, to_date('24-06-1992', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1236, 2328);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4132, 24771.97, to_date('26-09-2006', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1393, 2115);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4133, 10154.04, to_date('23-02-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1116, 2016);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4134, 40834.67, to_date('20-10-1947', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1272, 2280);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4135, 14130.33, to_date('01-06-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1353, 2005);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4136, 14559.93, to_date('09-09-1996', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1333, 2280);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4137, 27593.21, to_date('07-01-1951', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1202, 2149);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4138, 31197.12, to_date('30-05-1910', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1259, 2356);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4139, 6039.36, to_date('21-08-1994', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1133, 2306);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4140, 46458.54, to_date('03-12-1935', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1192, 2193);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4141, 45560.29, to_date('20-09-1978', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1313, 2328);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4142, 14048.75, to_date('09-05-1956', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1282, 2223);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4143, 33652.81, to_date('15-08-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1200, 2067);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4144, 27256.36, to_date('27-07-1957', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1144, 2143);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4145, 34092.13, to_date('29-01-1938', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1078, 2218);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4146, 24608.3, to_date('07-01-1940', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1255, 2269);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4147, 10867.38, to_date('21-12-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1106, 2374);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4148, 49586.67, to_date('06-12-1900', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1062, 2110);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4149, 16179.68, to_date('30-05-1982', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1094, 2319);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4150, 29407.98, to_date('22-10-2011', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1028, 2165);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4151, 32502.66, to_date('11-02-1915', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1010, 2137);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4152, 17864.99, to_date('12-03-1991', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1392, 2147);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4153, 8705.51, to_date('01-03-1930', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1000, 2348);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4154, 47230.97, to_date('29-10-1922', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1262, 2036);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4155, 45238.54, to_date('24-12-1983', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1350, 2070);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4156, 39226.55, to_date('24-01-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1229, 2349);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4157, 8381.25, to_date('30-08-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1154, 2006);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4158, 45048.95, to_date('04-08-1954', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1105, 2041);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4159, 13552.81, to_date('03-09-1929', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1321, 2258);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4160, 49463.82, to_date('07-07-2020', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1192, 2031);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4161, 22685.17, to_date('03-10-1963', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1103, 2159);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4162, 13959.54, to_date('09-09-1973', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1068, 2345);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4163, 40658.58, to_date('18-03-1957', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1346, 2139);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4164, 23963.99, to_date('06-06-1956', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1101, 2100);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4165, 10799.63, to_date('05-07-2004', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1266, 2010);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4166, 45123.88, to_date('25-06-1986', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1094, 2294);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4167, 39441.82, to_date('26-02-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1153, 2077);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4168, 8646.49, to_date('28-04-2017', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1245, 2235);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4169, 49548.58, to_date('29-11-1967', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1001, 2276);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4170, 45704.04, to_date('14-10-1943', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1041, 2391);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4171, 33398.85, to_date('27-04-1915', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1053, 2134);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4172, 15900.45, to_date('27-12-1927', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1267, 2059);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4173, 49335.09, to_date('17-07-1943', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1086, 2360);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4174, 39800.61, to_date('26-07-1920', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1152, 2270);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4175, 7573.85, to_date('26-06-2007', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1208, 2049);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4176, 10522.24, to_date('26-03-2002', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1030, 2311);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4177, 10078.82, to_date('11-04-2014', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1390, 2329);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4178, 19390.13, to_date('16-08-1920', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1331, 2273);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4179, 29496.35, to_date('11-01-1989', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1313, 2012);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4180, 30652.97, to_date('08-07-1947', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1098, 2028);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4181, 7153.53, to_date('11-12-1935', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1351, 2089);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4182, 20262.63, to_date('11-04-1931', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1221, 2223);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4183, 10118.72, to_date('05-09-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1067, 2236);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4184, 38715.96, to_date('07-09-1919', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1207, 2113);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4185, 42324.59, to_date('22-01-1942', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1248, 2156);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4186, 17959.1, to_date('17-01-1978', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1071, 2200);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4187, 49753.68, to_date('20-02-2014', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1049, 2137);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4188, 42354.26, to_date('14-08-1952', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1145, 2115);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4189, 29686.46, to_date('22-06-1923', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1079, 2038);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4190, 48709.02, to_date('10-05-1929', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1022, 2114);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4191, 19011.83, to_date('27-10-1946', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1194, 2304);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4192, 35368.14, to_date('14-12-2012', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1220, 2202);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4193, 6600.22, to_date('26-01-1983', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1033, 2202);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4194, 15367.85, to_date('19-03-1926', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1173, 2084);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4195, 39739.09, to_date('08-07-1906', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1265, 2079);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4196, 28652.62, to_date('25-09-1929', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1142, 2336);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4197, 29631.03, to_date('19-06-1990', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1169, 2054);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4198, 33354.51, to_date('21-11-1936', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1260, 2009);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4199, 20954.25, to_date('31-01-1901', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1333, 2327);
commit;
prompt 200 records committed...
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4200, 36134.92, to_date('18-02-1949', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1292, 2248);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4201, 25485.66, to_date('04-09-2011', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1086, 2315);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4202, 11588.91, to_date('14-08-1936', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1130, 2345);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4203, 49786.43, to_date('18-02-1912', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1047, 2215);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4204, 15712, to_date('13-02-1914', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1202, 2212);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4205, 46950, to_date('29-10-1988', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1202, 2191);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4206, 43429.44, to_date('13-04-1962', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1218, 2080);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4207, 17412.64, to_date('18-09-1949', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1311, 2384);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4208, 35188.04, to_date('27-02-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1228, 2223);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4209, 33826.51, to_date('29-10-1919', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1228, 2152);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4210, 32610.45, to_date('01-02-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1018, 2308);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4211, 9995.2, to_date('07-01-1982', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1160, 2127);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4212, 33211.96, to_date('16-11-1989', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1022, 2369);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4213, 23871.77, to_date('20-01-1913', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1041, 2307);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4214, 39179.79, to_date('09-04-2000', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1162, 2206);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4215, 24619.31, to_date('14-01-1990', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1034, 2162);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4216, 30214.89, to_date('11-10-2012', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1213, 2009);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4217, 48733.96, to_date('23-01-1992', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1161, 2375);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4218, 40436.26, to_date('09-10-2011', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1093, 2206);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4219, 45230.51, to_date('13-04-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1253, 2205);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4220, 24347.7, to_date('29-11-1914', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1077, 2142);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4221, 29890.36, to_date('22-03-1900', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1227, 2067);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4222, 6867.15, to_date('30-11-1906', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1140, 2373);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4223, 28572.18, to_date('13-06-1999', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1291, 2151);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4224, 22418.47, to_date('29-07-1968', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1016, 2191);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4225, 34584.85, to_date('23-06-1905', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1269, 2254);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4226, 23085.73, to_date('20-02-1976', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1393, 2377);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4227, 25123.08, to_date('11-02-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1054, 2044);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4228, 25830.03, to_date('26-12-1995', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1027, 2370);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4229, 36765.42, to_date('22-12-1979', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1385, 2145);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4230, 48768.75, to_date('13-08-2024', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1379, 2271);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4231, 30034.8, to_date('04-06-1910', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1352, 2052);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4232, 16517.41, to_date('18-12-1923', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1184, 2064);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4233, 38021.64, to_date('10-10-1979', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1017, 2063);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4234, 39593.91, to_date('31-12-1926', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1336, 2065);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4235, 14069.3, to_date('13-10-1913', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1174, 2045);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4236, 32885.38, to_date('29-08-1963', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1309, 2200);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4237, 8522.2, to_date('14-07-1949', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1022, 2218);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4238, 23177.43, to_date('31-01-1932', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1089, 2099);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4239, 44536.35, to_date('14-07-1985', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1367, 2368);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4240, 20745.95, to_date('08-03-1915', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1047, 2026);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4241, 7952.39, to_date('16-03-1927', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1351, 2283);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4242, 40011.46, to_date('30-06-1967', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1324, 2221);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4243, 46231.13, to_date('24-08-1977', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1105, 2216);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4244, 44255.83, to_date('06-05-1972', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1144, 2283);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4245, 36451.61, to_date('16-09-1998', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1123, 2170);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4246, 39401.66, to_date('16-05-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1262, 2160);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4247, 12371.63, to_date('29-05-1942', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1169, 2010);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4248, 46853.98, to_date('20-04-1902', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1118, 2382);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4249, 20550.83, to_date('15-08-1977', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1099, 2002);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4250, 45404.65, to_date('28-01-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1136, 2302);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4251, 35536.2, to_date('11-02-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1219, 2171);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4252, 17199.07, to_date('11-04-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1335, 2378);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4253, 24110.15, to_date('17-11-1959', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1358, 2092);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4254, 7765.54, to_date('10-11-1987', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1068, 2065);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4255, 23601.05, to_date('04-10-1953', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1071, 2296);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4256, 20107, to_date('21-03-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1087, 2144);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4257, 9256.28, to_date('11-06-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1370, 2114);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4258, 12855.4, to_date('17-07-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1137, 2271);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4259, 45677.74, to_date('14-09-1973', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1171, 2331);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4260, 47488.41, to_date('05-07-1974', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1064, 2149);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4261, 47319.99, to_date('01-01-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1274, 2280);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4262, 44608.79, to_date('30-03-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1061, 2329);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4263, 48050.68, to_date('21-05-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1068, 2149);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4264, 49286.14, to_date('24-08-1948', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1029, 2231);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4265, 34773.69, to_date('01-09-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1153, 2117);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4266, 15461.24, to_date('04-01-1953', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1069, 2198);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4267, 20114.62, to_date('26-12-1973', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1095, 2322);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4268, 9412.79, to_date('07-12-2020', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1095, 2369);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4269, 39168.88, to_date('16-08-1910', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1104, 2039);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4270, 22286.75, to_date('23-07-1930', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1176, 2375);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4271, 25312.18, to_date('23-02-1981', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1236, 2098);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4272, 21688.15, to_date('23-02-1922', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1398, 2266);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4273, 15073.65, to_date('13-11-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1320, 2120);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4274, 17335.33, to_date('04-12-1984', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1258, 2259);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4275, 7071.32, to_date('16-08-1904', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1208, 2176);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4276, 5776.77, to_date('05-04-1964', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1374, 2114);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4277, 15010.21, to_date('08-11-1902', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1358, 2076);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4278, 19170.41, to_date('03-03-1989', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1128, 2132);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4279, 44742.86, to_date('01-01-1993', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1332, 2279);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4280, 8125.41, to_date('06-02-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1031, 2179);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4281, 40392.37, to_date('17-03-1921', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1022, 2033);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4282, 8606.45, to_date('22-01-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1011, 2335);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4283, 24537.96, to_date('11-05-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1008, 2333);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4284, 7900.55, to_date('16-01-1953', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1028, 2368);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4285, 27463.02, to_date('24-05-1937', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1231, 2108);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4286, 49646.36, to_date('07-10-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1215, 2036);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4287, 30465.64, to_date('21-12-1925', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1194, 2035);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4288, 37925.92, to_date('16-09-1921', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1145, 2208);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4289, 13231.67, to_date('02-06-1924', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1295, 2377);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4290, 5419.02, to_date('10-07-2020', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1014, 2014);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4291, 15270.26, to_date('01-01-1949', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1275, 2038);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4292, 35619.95, to_date('25-08-1934', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1163, 2020);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4293, 31411.93, to_date('06-07-1934', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1395, 2056);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4294, 19116.81, to_date('11-05-2014', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1115, 2227);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4295, 11369.06, to_date('03-03-1978', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1142, 2314);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4296, 8933.31, to_date('06-01-1905', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1338, 2095);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4297, 8359.01, to_date('24-10-1903', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1053, 2275);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4298, 49933.06, to_date('27-09-1927', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1337, 2192);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4299, 26789.6, to_date('14-06-2021', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1268, 2142);
commit;
prompt 300 records committed...
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4300, 22286.39, to_date('11-04-1905', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1271, 2267);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4301, 19007.22, to_date('22-01-1957', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1208, 2049);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4302, 38999.61, to_date('17-04-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1087, 2154);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4303, 31107.31, to_date('07-10-1927', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1178, 2071);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4304, 47506.83, to_date('20-11-1971', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1190, 2290);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4305, 47807.47, to_date('12-04-1962', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1092, 2259);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4306, 30324.25, to_date('22-06-2007', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1031, 2268);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4307, 31382.97, to_date('02-09-1941', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1128, 2303);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4308, 39766.96, to_date('17-12-1909', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1221, 2211);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4309, 19664.78, to_date('19-06-1960', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1105, 2021);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4310, 21728.25, to_date('01-04-1985', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1172, 2169);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4311, 13100.19, to_date('12-01-2008', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1382, 2266);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4312, 13521.36, to_date('01-01-1973', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1062, 2347);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4313, 10875.77, to_date('14-04-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1289, 2266);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4314, 40783.85, to_date('21-10-1989', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1325, 2150);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4315, 16102.96, to_date('20-09-1951', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1080, 2186);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4316, 28444.34, to_date('21-07-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1264, 2060);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4317, 10066.14, to_date('26-09-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1005, 2112);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4318, 40751.8, to_date('23-03-1987', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1192, 2334);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4319, 30533.11, to_date('19-04-1907', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1119, 2266);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4320, 40367.41, to_date('23-11-1932', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1298, 2129);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4321, 39128.22, to_date('15-11-1940', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1004, 2040);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4322, 21518.79, to_date('27-02-1966', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1234, 2252);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4323, 27767.83, to_date('21-09-1998', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1026, 2260);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4324, 22216.83, to_date('28-09-1945', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1234, 2330);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4325, 49158.43, to_date('17-06-1944', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1108, 2270);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4326, 15535, to_date('18-07-1992', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1150, 2014);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4327, 36357.14, to_date('29-12-2018', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1033, 2246);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4328, 39951.1, to_date('29-11-1924', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1019, 2204);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4329, 41394.78, to_date('03-09-1904', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1077, 2332);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4330, 28751.59, to_date('10-04-2014', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1151, 2291);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4331, 37961.43, to_date('18-11-1984', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1352, 2202);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4332, 13498.4, to_date('14-01-1936', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1346, 2240);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4333, 8154.42, to_date('19-10-1923', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1093, 2247);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4334, 26558.19, to_date('14-11-1915', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1232, 2283);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4335, 43288.93, to_date('07-08-1941', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1051, 2384);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4336, 17694.18, to_date('24-03-1946', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1331, 2245);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4337, 8771.05, to_date('22-11-1909', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1028, 2097);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4338, 9720.41, to_date('19-03-1948', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1251, 2096);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4339, 33033.25, to_date('28-06-2017', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1325, 2095);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4340, 43218.59, to_date('13-10-2003', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1393, 2120);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4341, 20532.5, to_date('01-07-2006', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1323, 2002);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4342, 45317.34, to_date('10-03-1908', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1002, 2318);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4343, 33810.81, to_date('14-09-1978', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1179, 2066);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4344, 27534.03, to_date('06-11-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1321, 2233);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4345, 14618.21, to_date('22-04-2022', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1060, 2097);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4346, 27679.05, to_date('24-05-1943', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1090, 2396);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4347, 14098.4, to_date('25-11-1908', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1093, 2028);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4348, 20822.61, to_date('21-02-1938', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1154, 2201);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4349, 32036.71, to_date('13-11-1985', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1240, 2102);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4350, 24324.06, to_date('26-10-1981', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1007, 2206);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4351, 5170.68, to_date('13-12-2013', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1105, 2285);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4352, 36923.66, to_date('10-08-1934', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1255, 2055);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4353, 34563.11, to_date('07-04-1950', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1257, 2102);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4354, 36896.9, to_date('14-07-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1206, 2031);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4355, 42037.62, to_date('26-07-1926', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1284, 2095);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4356, 39271.26, to_date('14-02-1952', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1186, 2224);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4357, 25676.67, to_date('23-10-1922', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1370, 2118);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4358, 32105.55, to_date('24-05-2010', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1177, 2137);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4359, 14382.09, to_date('25-01-2011', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1001, 2039);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4360, 16831.69, to_date('03-03-2015', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1382, 2304);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4361, 36498.2, to_date('19-09-1919', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1184, 2086);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4362, 17659, to_date('09-09-2000', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1119, 2345);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4363, 12497.28, to_date('30-12-1917', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1008, 2000);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4364, 15040.98, to_date('15-07-1932', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1228, 2236);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4365, 21727.65, to_date('22-10-2020', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1318, 2228);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4366, 28204.67, to_date('18-11-1978', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1220, 2009);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4367, 43224.23, to_date('13-11-2013', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1115, 2333);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4368, 31742.38, to_date('06-01-1977', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1132, 2279);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4369, 25581.56, to_date('05-03-1924', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1087, 2230);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4370, 21266.01, to_date('01-04-1970', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1327, 2389);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4371, 15889.35, to_date('17-10-1935', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1058, 2248);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4372, 48123.85, to_date('20-01-1940', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1001, 2187);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4373, 32730.56, to_date('27-11-2000', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1371, 2016);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4374, 43179.9, to_date('04-08-1983', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1027, 2226);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4375, 43241.9, to_date('26-03-2021', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1381, 2177);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4376, 14655.6, to_date('21-06-1936', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1116, 2384);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4377, 44236.9, to_date('25-09-1974', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1093, 2123);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4378, 35034.21, to_date('30-11-1940', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1314, 2119);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4379, 22391.46, to_date('18-08-1987', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1107, 2155);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4380, 17027.55, to_date('22-02-1959', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1007, 2338);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4381, 18491.91, to_date('28-09-1976', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1296, 2074);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4382, 43605.31, to_date('20-02-1982', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1070, 2098);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4383, 25745.51, to_date('17-02-1987', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1012, 2189);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4384, 37086.86, to_date('06-09-1933', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1127, 2133);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4385, 37153.54, to_date('21-01-1975', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1212, 2357);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4386, 27295.52, to_date('29-09-2019', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1140, 2399);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4387, 16946.84, to_date('03-04-1911', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1307, 2240);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4388, 28775.4, to_date('15-02-2023', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1328, 2051);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4389, 21083.84, to_date('10-07-1954', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1143, 2397);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4390, 22070.65, to_date('25-06-1918', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1203, 2241);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4391, 16811.12, to_date('07-08-1945', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1303, 2193);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4392, 39067.28, to_date('13-08-1932', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1337, 2142);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4393, 31286.45, to_date('26-05-1971', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1333, 2133);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4394, 37397.47, to_date('31-01-1925', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1051, 2199);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4395, 44264.35, to_date('06-07-1999', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1095, 2231);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4396, 13906.34, to_date('15-02-1964', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1229, 2200);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4397, 29844.12, to_date('15-01-1958', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1243, 2390);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4398, 42181.25, to_date('28-11-1972', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1060, 2179);
insert into PAYMENTS (paymentid, amount, paymentdate, paymentdeadlinedate, customerid, eventid)
values (4399, 12280.4, to_date('08-10-2010', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'), 1230, 2016);
commit;
prompt 400 records loaded
prompt Loading ACTIONSTOPAYMENTS...
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (2, 4203);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (3, 4319);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (4, 4201);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (5, 4134);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (7, 4389);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (8, 4301);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (10, 4111);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (11, 4231);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (12, 4128);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (13, 4350);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (15, 4313);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (16, 4140);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (20, 4306);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (21, 4018);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (23, 4008);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (24, 4288);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (25, 4097);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (26, 4365);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (27, 4236);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (28, 4252);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (31, 4311);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (32, 4006);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (33, 4171);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (35, 4320);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (36, 4261);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (37, 4349);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (38, 4187);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (39, 4188);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (40, 4344);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (42, 4363);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (43, 4377);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (44, 4269);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (45, 4107);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (48, 4052);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (49, 4219);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (50, 4191);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (51, 4220);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (54, 4003);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (55, 4059);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (56, 4177);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (57, 4129);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (58, 4341);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (59, 4142);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (60, 4070);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (61, 4339);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (64, 4278);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (66, 4113);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (67, 4185);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (68, 4064);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (69, 4123);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (72, 4108);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (73, 4338);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (74, 4033);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (76, 4127);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (77, 4197);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (78, 4382);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (79, 4169);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (81, 4245);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (82, 4277);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (83, 4370);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (84, 4116);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (85, 4139);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (86, 4119);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (88, 4153);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (89, 4034);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (91, 4035);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (93, 4195);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (94, 4205);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (95, 4314);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (96, 4368);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (97, 4020);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (99, 4247);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (100, 4343);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (101, 4294);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (107, 4154);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (109, 4090);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (111, 4228);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (112, 4120);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (113, 4147);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (115, 4394);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (116, 4239);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (117, 4118);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (119, 4165);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (120, 4315);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (121, 4161);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (122, 4126);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (123, 4182);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (124, 4266);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (125, 4258);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (126, 4244);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (127, 4122);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (128, 4159);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (129, 4335);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (130, 4249);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (131, 4276);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (132, 4307);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (133, 4137);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (134, 4271);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (137, 4221);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (138, 4212);
commit;
prompt 100 records committed...
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (139, 4117);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (141, 4264);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (143, 4089);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (144, 4112);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (146, 4063);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (148, 4078);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (149, 4194);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (150, 4329);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (152, 4044);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (153, 4061);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (155, 4013);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (156, 4099);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (157, 4295);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (158, 4067);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (159, 4229);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (160, 4053);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (162, 4032);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (163, 4381);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (164, 4327);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (165, 4378);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (166, 4275);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (167, 4073);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (168, 4243);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (169, 4208);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (170, 4256);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (171, 4296);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (172, 4068);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (174, 4200);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (175, 4084);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (176, 4206);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (177, 4004);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (178, 4238);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (179, 4042);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (180, 4136);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (181, 4027);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (184, 4281);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (185, 4011);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (186, 4265);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (187, 4302);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (188, 4178);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (190, 4019);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (191, 4124);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (192, 4028);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (194, 4133);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (195, 4152);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (196, 4189);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (197, 4060);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (200, 4299);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (201, 4138);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (203, 4014);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (204, 4283);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (205, 4233);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (207, 4029);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (209, 4227);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (211, 4383);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (213, 4250);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (214, 4388);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (215, 4225);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (217, 4091);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (219, 4103);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (220, 4095);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (221, 4240);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (222, 4325);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (223, 4156);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (225, 4081);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (226, 4168);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (228, 4318);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (230, 4143);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (231, 4174);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (232, 4246);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (233, 4332);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (236, 4080);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (237, 4384);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (238, 4057);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (239, 4037);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (240, 4115);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (242, 4001);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (243, 4337);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (245, 4270);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (246, 4235);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (247, 4356);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (248, 4293);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (249, 4393);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (250, 4017);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (251, 4303);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (252, 4268);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (254, 4166);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (256, 4215);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (257, 4364);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (258, 4093);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (259, 4056);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (260, 4398);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (262, 4176);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (263, 4088);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (264, 4237);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (266, 4285);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (267, 4326);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (268, 4157);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (269, 4026);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (270, 4160);
commit;
prompt 200 records committed...
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (271, 4380);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (272, 4016);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (273, 4213);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (274, 4260);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (275, 4054);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (276, 4021);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (277, 4323);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (278, 4005);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (279, 4348);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (280, 4114);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (281, 4180);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (282, 4267);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (283, 4226);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (284, 4141);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (285, 4082);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (286, 4251);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (287, 4002);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (288, 4207);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (290, 4125);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (292, 4190);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (294, 4048);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (295, 4175);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (296, 4055);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (297, 4036);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (298, 4255);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (299, 4024);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (300, 4342);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (301, 4023);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (303, 4046);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (305, 4092);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (306, 4362);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (308, 4372);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (309, 4083);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (310, 4075);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (311, 4334);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (312, 4289);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (313, 4391);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (316, 4345);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (317, 4051);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (319, 4376);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (320, 4130);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (321, 4312);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (322, 4198);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (323, 4101);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (324, 4330);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (325, 4150);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (326, 4010);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (327, 4039);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (328, 4183);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (329, 4273);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (331, 4322);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (335, 4184);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (336, 4163);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (338, 4309);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (339, 4199);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (340, 4390);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (341, 4085);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (342, 4025);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (344, 4074);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (346, 4308);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (347, 4355);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (348, 4324);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (349, 4305);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (351, 4210);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (352, 4049);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (353, 4224);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (354, 4254);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (355, 4155);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (357, 4333);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (359, 4132);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (361, 4192);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (363, 4218);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (364, 4012);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (366, 4087);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (368, 4079);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (369, 4359);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (372, 4102);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (373, 4100);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (376, 4353);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (378, 4232);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (379, 4328);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (381, 4202);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (382, 4041);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (383, 4000);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (384, 4259);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (385, 4162);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (386, 4357);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (387, 4366);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (390, 4352);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (391, 4361);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (392, 4047);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (393, 4007);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (394, 4346);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (395, 4072);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (397, 4392);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (398, 4065);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (399, 4086);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (401, 4038);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (403, 4196);
insert into ACTIONSTOPAYMENTS (actionid, paymentid)
values (404, 4287);
commit;
prompt 300 records loaded
prompt Loading CLIENT...
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (1, 'Renana', 'GalGal Hamazalot 10,HodHashron', 'Shubi');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (3, 'Tehila', 'GalgalHamazalot 61,Hod Hashron', 'Shubi');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (5, 'William', 'galgal 56,HodHashron', 'O''Hara');
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
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (102, 'Denny', '26 Trejo Street', 'Alexander');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (103, 'Caroline', '22nd Street', 'Kutcher');
commit;
prompt 100 records committed...
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
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (202, 'Shannon', '70 Gilliam Street', 'Dillon');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (203, 'Campbell', '68 Leigh Drive', 'Gooding');
commit;
prompt 200 records committed...
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
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (302, 'LeVar', '57 Carlisle Drive', 'Jeter');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (303, 'Carol', '38 Noseworthy Drive', 'Barkin');
commit;
prompt 300 records committed...
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
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (402, 'Lenny', '53 Bale Street', 'Neill');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (403, 'Wes', '73 Mitra Ave', 'Carlisle');
commit;
prompt 400 records committed...
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
values (680, 'Reut', 'simchoni 1, Bney Brak', 'Agam');
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
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (582, 'Steffane', '25 Tomscot Plaza', 'Jeffes');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (472, 'Shara', '96 Thackeray Court', 'Benninger');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (466, 'Myrtle', '948 David Terrace', 'Dentith');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (556, 'Ceil', '2 Shoshone Avenue', 'Mor');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (469, 'Skelly', '556 Arrowood Center', 'Alben');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (611, 'Kelcey', '59358 Shasta Street', 'Abraham');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (679, 'Gnni', '7 Lindbergh Terrace', 'Smidmore');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (646, 'Pascal', '33166 Golf Course Circle', 'Rawlings');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (607, 'Chucho', '4608 Farwell Park', 'Gheerhaert');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (579, 'Phedra', '99 Dapin Avenue', 'Ausher');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (681, 'Reuta', 'simchoni 1, Bney Brak', 'Agam');
insert into CLIENT (clientid, clientname, clientaddress, clientlastname)
values (682, 'ret', 'tyuyu 56', 'ret');
commit;
prompt 450 records loaded
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
values (8, 31, 336, 4, 382);
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
values (40, 283, 358, 1, 85);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (41, 98, 388, 1, 156);
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
values (60, 382, 365, 1, 231);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (62, 337, 131, 1, 55);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (63, 88, 39, 4, 302);
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
values (96, 226, 60, 3, 339);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (97, 253, 289, 3, 262);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (98, 399, 190, 2, 328);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (99, 402, 372, 3, 29);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (100, 395, 26, 3, 164);
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
values (111, 99, 56, 2, 284);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (112, 158, 197, 2, 100);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (113, 49, 153, 3, 73);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (114, 436, 323, 2, 379);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (115, 103, 393, 2, 115);
commit;
prompt 100 records committed...
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
values (123, 47, 282, 2, 236);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (124, 44, 308, 4, 293);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (125, 168, 391, 3, 48);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (127, 266, 86, 4, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (128, 193, 358, 4, 35);
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
values (144, 44, 23, 3, 82);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (147, 79, 69, 1, 309);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (148, 377, 108, 2, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (149, 291, 386, 1, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (150, 245, 221, 2, 222);
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
values (171, 123, 290, 1, 146);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (173, 147, 225, 4, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (174, 220, 76, 1, 111);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (175, 297, 313, 2, 74);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (176, 342, 334, 2, 362);
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
values (194, 303, 45, 1, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (195, 34, 121, 4, 236);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (196, 349, 13, 4, 383);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (198, 351, 39, 4, 78);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (200, 152, 28, 2, 11);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (201, 242, 119, 3, 396);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (202, 307, 335, 3, 58);
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
values (225, 292, 344, 3, 264);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (227, 366, 187, 4, 362);
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
values (236, 307, 69, 2, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (237, 211, 400, 2, 60);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (238, 265, 11, 4, 12);
commit;
prompt 200 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (239, 222, 152, 3, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (240, 401, 324, 3, 240);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (243, 441, 116, 1, 393);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (244, 398, 129, 3, 318);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (245, 223, 118, 3, 351);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (246, 225, 223, 3, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (251, 261, 149, 4, 180);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (252, 24, 39, 2, 269);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (255, 168, 192, 4, 275);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (256, 97, 152, 1, 139);
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
values (268, 383, 185, 4, 332);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (269, 277, 399, 1, 226);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (270, 385, 33, 3, 165);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (272, 375, 175, 2, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (273, 410, 269, 1, 10);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (276, 185, 84, 2, 270);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (277, 182, 159, 2, 257);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (279, 293, 46, 3, 260);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (280, 122, 311, 2, 49);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (281, 118, 342, 1, 74);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (282, 379, 134, 2, 203);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (284, 299, 368, 3, 270);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (286, 303, 201, 2, 69);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (287, 386, 289, 2, 223);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (288, 175, 378, 2, 36);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (289, 283, 277, 2, 184);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (292, 277, 138, 1, 398);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (293, 71, 204, 3, 219);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (294, 213, 341, 1, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (295, 258, 64, 1, 217);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (297, 400, 122, 1, 264);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (298, 261, 280, 3, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (299, 414, 343, 3, 176);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (300, 115, 143, 1, 300);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (301, 141, 386, 1, 198);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (302, 419, 69, 3, 196);
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
values (314, 297, 20, 1, 188);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (315, 405, 288, 1, 347);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (501, 184, 240, 242, 253);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (318, 100, 365, 1, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (502, 132, 272, 399, 37);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (320, 374, 160, 3, 22);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (503, 412, 111, 370, 41);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (504, 349, 207, 351, 89);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (505, 127, 37, 280, 206);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (324, 206, 248, 4, 65);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (510, 410, 266, 116, 298);
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
values (511, 149, 139, 96, 208);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (512, 18, 303, 401, 131);
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
values (513, 116, 35, 340, 401);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (514, 375, 296, 60, 184);
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
commit;
prompt 300 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (362, 328, 313, 3, 327);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (515, 406, 338, 242, 255);
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
values (516, 169, 271, 22, 85);
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
values (517, 69, 101, 107, 191);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (388, 415, 276, 3, 364);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (389, 273, 199, 2, 283);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (390, 267, 366, 3, 238);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (518, 129, 254, 60, 139);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (392, 261, 297, 3, 384);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (519, 254, 95, 378, 129);
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
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (401, 162, 148, 16, 72);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (402, 9, 264, 44, 13);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (403, 344, 381, 397, 391);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (404, 222, 257, 18, 126);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (405, 62, 316, 302, 325);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (406, 425, 260, 73, 13);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (407, 607, 36, 387, 6);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (408, 80, 384, 126, 159);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (409, 179, 54, 405, 32);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (410, 17, 232, 157, 164);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (411, 368, 83, 316, 17);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (412, 268, 198, 394, 101);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (413, 382, 88, 180, 111);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (414, 360, 10, 317, 366);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (415, 186, 217, 82, 208);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (416, 350, 44, 111, 46);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (417, 257, 353, 82, 95);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (418, 288, 353, 120, 267);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (419, 391, 327, 185, 132);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (420, 397, 100, 329, 381);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (500, 290, 85, 18, 242);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (520, 121, 295, 137, 5);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (521, 32, 96, 227, 148);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (522, 147, 196, 328, 343);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (523, 103, 330, 229, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (524, 253, 329, 366, 123);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (525, 27, 7, 193, 367);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (526, 245, 330, 20, 140);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (527, 194, 284, 267, 397);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (528, 97, 27, 313, 175);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (529, 7, 321, 32, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (530, 169, 35, 296, 333);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (531, 356, 403, 65, 193);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (532, 331, 196, 349, 80);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (533, 59, 262, 276, 158);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (534, 234, 275, 225, 231);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (535, 194, 203, 299, 394);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (536, 285, 7, 370, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (537, 144, 174, 318, 157);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (538, 179, 27, 15, 352);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (539, 188, 147, 290, 30);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (540, 380, 95, 176, 110);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (541, 299, 184, 8, 210);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (542, 258, 361, 170, 273);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (543, 93, 331, 3, 143);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (544, 78, 361, 260, 269);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (545, 382, 38, 32, 295);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (546, 90, 331, 251, 123);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (547, 32, 147, 28, 19);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (548, 327, 180, 157, 97);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (549, 269, 295, 265, 392);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (550, 204, 180, 67, 54);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (551, 244, 184, 332, 303);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (552, 165, 112, 44, 163);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (553, 50, 130, 153, 357);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (554, 439, 127, 53, 110);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (555, 384, 330, 236, 30);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (556, 54, 331, 307, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (557, 227, 275, 308, 200);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (558, 137, 157, 31, 106);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (559, 164, 395, 14, 150);
commit;
prompt 400 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (560, 288, 113, 298, 291);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (561, 113, 397, 48, 361);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (562, 141, 373, 402, 304);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (563, 5, 301, 53, 161);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (564, 287, 325, 341, 141);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (565, 273, 339, 214, 374);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (566, 295, 195, 86, 79);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (567, 332, 180, 18, 4);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (568, 141, 101, 80, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (569, 26, 24, 303, 354);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (570, 86, 157, 155, 218);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (571, 419, 394, 43, 345);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (572, 359, 322, 82, 225);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (573, 341, 38, 66, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (574, 194, 383, 155, 365);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (575, 389, 329, 301, 14);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (576, 267, 281, 181, 220);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (577, 432, 68, 295, 14);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (578, 438, 359, 106, 108);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (579, 62, 301, 167, 339);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (580, 679, 147, 272, 318);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (581, 207, 397, 362, 87);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (582, 425, 174, 72, 70);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (583, 45, 301, 220, 155);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (584, 260, 285, 281, 244);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (585, 12, 147, 220, 260);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (586, 192, 296, 138, 160);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (587, 134, 305, 191, 137);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (588, 246, 373, 139, 160);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (589, 383, 361, 385, 53);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (590, 405, 317, 383, 257);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (591, 414, 4, 152, 237);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (592, 116, 244, 167, 136);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (593, 436, 125, 279, 24);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (594, 311, 203, 42, 84);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (595, 99, 385, 89, 372);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (596, 276, 7, 235, 25);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (597, 321, 186, 240, 24);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (598, 176, 67, 324, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (599, 432, 244, 278, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (600, 230, 361, 143, 139);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (601, 63, 195, 274, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (602, 140, 112, 324, 333);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (603, 383, 176, 45, 291);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (604, 125, 317, 3, 322);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (605, 210, 270, 34, 90);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (606, 407, 295, 251, 306);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (607, 472, 24, 176, 210);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (608, 49, 117, 213, 222);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (609, 235, 340, 12, 47);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (610, 98, 133, 178, 73);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (611, 127, 2, 47, 184);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (612, 227, 245, 211, 379);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (613, 77, 369, 291, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (614, 142, 270, 22, 324);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (615, 409, 369, 39, 76);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (616, 320, 127, 81, 80);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (617, 339, 174, 120, 348);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (618, 328, 239, 326, 21);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (619, 333, 251, 292, 171);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (620, 69, 139, 112, 59);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (621, 238, 233, 320, 215);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (622, 399, 155, 209, 325);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (623, 350, 170, 271, 235);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (624, 392, 271, 373, 353);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (625, 48, 51, 13, 246);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (626, 252, 31, 178, 14);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (627, 269, 319, 372, 202);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (628, 435, 275, 282, 170);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (629, 397, 301, 249, 207);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (630, 128, 12, 73, 215);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (631, 351, 275, 265, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (632, 14, 184, 200, 195);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (633, 221, 27, 330, 44);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (634, 365, 394, 265, 227);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (635, 163, 120, 91, 55);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (636, 264, 32, 191, 33);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (637, 99, 325, 214, 161);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (638, 246, 305, 403, 232);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (639, 113, 331, 31, 311);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (640, 236, 274, 402, 106);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (641, 208, 113, 92, 76);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (642, 439, 338, 212, 356);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (643, 308, 24, 275, 147);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (644, 242, 385, 226, 314);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (645, 71, 7, 355, 323);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (646, 53, 340, 269, 140);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (647, 296, 385, 193, 50);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (648, 257, 31, 305, 313);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (649, 97, 326, 357, 300);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (650, 423, 68, 361, 31);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (651, 163, 259, 333, 319);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (652, 109, 38, 70, 196);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (653, 434, 2, 8, 165);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (654, 370, 270, 268, 42);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (655, 278, 278, 368, 131);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (656, 130, 95, 152, 369);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (657, 263, 266, 159, 305);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (658, 439, 47, 146, 27);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (659, 145, 170, 290, 243);
commit;
prompt 500 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (660, 1, 133, 327, 208);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (661, 245, 329, 138, 401);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (662, 398, 173, 93, 371);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (663, 395, 196, 381, 38);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (664, 306, 209, 298, 362);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (665, 20, 68, 163, 113);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (666, 336, 295, 126, 237);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (667, 287, 219, 381, 229);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (668, 13, 387, 84, 200);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (669, 201, 139, 94, 162);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (670, 410, 284, 152, 278);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (671, 151, 139, 268, 301);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (672, 289, 101, 391, 110);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (673, 320, 184, 227, 185);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (674, 141, 101, 355, 81);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (675, 237, 81, 238, 9);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (676, 183, 259, 160, 159);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (677, 383, 112, 43, 225);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (678, 408, 319, 352, 62);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (679, 10, 369, 271, 60);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (680, 432, 303, 187, 372);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (681, 155, 203, 217, 202);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (682, 53, 359, 390, 126);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (683, 153, 267, 108, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (684, 53, 125, 264, 201);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (685, 265, 38, 156, 188);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (686, 117, 331, 100, 352);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (687, 53, 266, 34, 312);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (688, 140, 383, 363, 16);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (689, 152, 339, 4, 284);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (690, 582, 24, 96, 55);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (691, 258, 267, 43, 277);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (692, 14, 321, 213, 172);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (693, 58, 71, 208, 84);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (694, 338, 301, 329, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (695, 419, 233, 218, 263);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (696, 118, 403, 79, 68);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (697, 329, 191, 277, 174);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (698, 79, 32, 56, 297);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (699, 388, 340, 301, 188);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (700, 411, 24, 337, 50);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (701, 259, 340, 383, 382);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (702, 251, 165, 256, 177);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (703, 414, 32, 72, 163);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (704, 122, 339, 227, 66);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (705, 91, 262, 110, 55);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (706, 125, 170, 352, 397);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (707, 466, 7, 135, 362);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (708, 188, 184, 264, 352);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (709, 306, 403, 62, 368);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (710, 108, 195, 219, 223);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (711, 308, 174, 271, 90);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (712, 308, 325, 183, 88);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (713, 32, 236, 205, 140);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (714, 139, 301, 158, 237);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (715, 384, 385, 223, 83);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (716, 38, 395, 133, 107);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (717, 375, 24, 254, 170);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (718, 338, 267, 56, 177);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (719, 431, 125, 77, 358);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (720, 335, 395, 242, 341);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (721, 133, 284, 51, 269);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (722, 301, 339, 177, 34);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (723, 239, 81, 236, 85);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (724, 158, 91, 192, 97);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (725, 29, 155, 353, 353);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (726, 198, 254, 321, 323);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (727, 279, 266, 178, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (728, 261, 278, 403, 359);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (729, 215, 2, 366, 314);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (730, 67, 320, 206, 341);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (731, 97, 68, 52, 121);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (732, 243, 184, 391, 22);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (733, 18, 155, 162, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (734, 16, 329, 254, 64);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (735, 310, 191, 252, 288);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (736, 95, 275, 364, 212);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (737, 386, 186, 246, 177);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (738, 417, 330, 351, 21);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (739, 108, 320, 167, 178);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (740, 392, 24, 383, 119);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (741, 35, 38, 307, 228);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (742, 301, 113, 221, 356);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (743, 145, 271, 190, 126);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (744, 247, 387, 339, 103);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (745, 144, 319, 12, 199);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (746, 259, 24, 219, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (747, 40, 394, 67, 73);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (748, 202, 251, 332, 355);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (749, 57, 157, 197, 397);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (750, 384, 32, 83, 58);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (751, 369, 245, 89, 253);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (752, 177, 68, 243, 367);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (753, 173, 369, 400, 347);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (754, 26, 338, 132, 300);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (755, 170, 18, 258, 260);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (756, 120, 233, 107, 18);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (757, 350, 139, 63, 282);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (758, 225, 186, 15, 391);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (759, 281, 394, 257, 128);
commit;
prompt 600 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (760, 198, 281, 98, 259);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (761, 97, 8, 120, 212);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (762, 324, 18, 317, 302);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (763, 392, 320, 240, 214);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (764, 98, 12, 89, 150);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (765, 121, 71, 141, 200);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (766, 406, 120, 94, 75);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (767, 142, 147, 399, 253);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (768, 122, 164, 37, 380);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (769, 276, 236, 325, 231);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (770, 141, 319, 95, 103);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (771, 212, 322, 128, 49);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (772, 35, 305, 361, 305);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (773, 211, 320, 267, 95);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (774, 337, 281, 304, 192);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (775, 276, 139, 24, 151);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (776, 160, 251, 296, 250);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (777, 12, 233, 144, 60);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (778, 435, 242, 316, 244);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (779, 98, 295, 243, 113);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (780, 231, 191, 302, 170);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (781, 403, 338, 286, 348);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (782, 56, 387, 127, 132);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (783, 172, 373, 66, 387);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (784, 29, 274, 6, 331);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (785, 242, 275, 337, 196);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (786, 94, 18, 109, 384);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (787, 131, 176, 308, 177);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (788, 39, 8, 211, 376);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (789, 317, 242, 45, 158);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (790, 221, 326, 169, 28);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (791, 281, 321, 48, 142);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (792, 291, 51, 26, 4);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (793, 393, 113, 46, 360);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (794, 426, 18, 133, 114);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (795, 7, 236, 253, 248);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (796, 111, 274, 88, 65);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (797, 310, 239, 213, 373);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (798, 320, 91, 126, 347);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (799, 217, 339, 104, 45);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (800, 113, 301, 105, 402);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (801, 179, 38, 42, 303);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (802, 223, 317, 140, 171);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (803, 386, 387, 216, 160);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (804, 151, 38, 43, 134);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (805, 129, 231, 245, 255);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (806, 17, 176, 8, 271);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (807, 109, 325, 176, 149);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (808, 410, 340, 104, 361);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (809, 54, 397, 293, 212);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (810, 244, 281, 193, 7);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (811, 190, 209, 142, 389);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (812, 262, 133, 292, 396);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (813, 259, 281, 11, 311);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (814, 51, 219, 135, 129);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (815, 146, 173, 6, 338);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (816, 251, 8, 392, 66);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (817, 308, 251, 366, 308);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (818, 82, 81, 259, 217);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (819, 202, 229, 181, 23);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (820, 51, 229, 346, 394);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (821, 122, 397, 195, 270);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (822, 433, 262, 323, 178);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (823, 135, 359, 358, 323);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (824, 1, 233, 232, 237);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (825, 172, 81, 239, 32);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (826, 398, 296, 209, 116);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (827, 372, 24, 290, 4);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (828, 420, 157, 233, 207);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (829, 329, 275, 275, 298);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (830, 8, 71, 298, 204);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (831, 391, 155, 176, 50);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (832, 432, 81, 212, 111);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (833, 63, 127, 306, 72);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (834, 236, 330, 229, 159);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (835, 262, 71, 227, 295);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (836, 429, 7, 86, 46);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (837, 431, 317, 136, 187);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (838, 40, 195, 92, 325);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (839, 397, 165, 237, 105);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (840, 10, 117, 214, 269);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (841, 237, 244, 151, 337);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (842, 160, 270, 404, 331);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (843, 397, 68, 367, 280);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (844, 433, 259, 147, 259);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (845, 266, 361, 78, 168);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (846, 169, 254, 51, 185);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (847, 147, 157, 310, 91);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (848, 307, 244, 230, 213);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (849, 339, 274, 179, 364);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (850, 13, 245, 323, 140);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (851, 15, 331, 76, 391);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (852, 292, 395, 359, 108);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (900, 112, 43, 71, 375);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (901, 323, 268, 213, 339);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (902, 81, 273, 171, 275);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (903, 384, 273, 325, 352);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (904, 406, 273, 386, 31);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (905, 261, 200, 86, 117);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (906, 437, 43, 218, 114);
commit;
prompt 700 records committed...
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (907, 353, 273, 383, 243);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (908, 321, 200, 227, 169);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (909, 84, 43, 57, 363);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (910, 240, 43, 116, 351);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (911, 401, 268, 293, 395);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (912, 163, 273, 144, 263);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (913, 115, 43, 6, 193);
insert into ACTIVITY (activityid, clientid, actionid, accountid, workerid)
values (914, 13, 141, 223, 55);
commit;
prompt 708 records loaded
prompt Loading CATERING...
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (1, 'Gourmet Delight', 'Fine dining experience with a touch of elegance', to_date('15-01-2020', 'dd-mm-yyyy'), to_date('15-01-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (2, 'Home Comforts', 'Homestyle meals with a cozy feel', to_date('20-02-2020', 'dd-mm-yyyy'), to_date('20-02-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (3, 'Healthy Choices', 'Nutrition-packed meals for health-conscious individuals', to_date('25-03-2020', 'dd-mm-yyyy'), to_date('25-03-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (4, 'Exotic Flavors', 'A journey through exotic and vibrant cuisines', to_date('30-04-2020', 'dd-mm-yyyy'), to_date('30-04-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (5, 'BBQ Heaven', 'Smoky and savory barbecue delights', to_date('05-05-2020', 'dd-mm-yyyy'), to_date('05-05-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (6, 'Seafood Paradise', 'Fresh and succulent seafood dishes', to_date('10-06-2020', 'dd-mm-yyyy'), to_date('10-06-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (7, 'Vegan Feast', 'Plant-based gourmet meals', to_date('15-07-2020', 'dd-mm-yyyy'), to_date('15-07-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (8, 'Sweet Endings', 'Decadent desserts and sweet treats', to_date('20-08-2020', 'dd-mm-yyyy'), to_date('20-08-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (9, 'Comfort Cravings', 'Soul-soothing comfort food', to_date('25-09-2020', 'dd-mm-yyyy'), to_date('25-09-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (10, 'Italian Classics', 'Traditional Italian cuisine with a modern twist', to_date('30-10-2020', 'dd-mm-yyyy'), to_date('30-10-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (11, 'Asian Fusion', 'Innovative fusion of Asian flavors', to_date('04-11-2020', 'dd-mm-yyyy'), to_date('04-11-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (12, 'Fiesta Mexicana', 'Vibrant and flavorful Mexican dishes', to_date('09-12-2020', 'dd-mm-yyyy'), to_date('09-12-2021', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (13, 'French Elegance', 'Sophisticated and classic French cuisine', to_date('14-01-2021', 'dd-mm-yyyy'), to_date('14-01-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (14, 'Mediterranean Magic', 'Heart-healthy Mediterranean dishes', to_date('18-02-2021', 'dd-mm-yyyy'), to_date('18-02-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (15, 'Street Food Extravaganza', 'Authentic street food from around the world', to_date('25-03-2021', 'dd-mm-yyyy'), to_date('25-03-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (16, 'Rustic Retreat', 'Hearty and rustic farm-to-table meals', to_date('30-04-2021', 'dd-mm-yyyy'), to_date('30-04-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (17, 'Sushi Sensations', 'Exquisite sushi and Japanese delicacies', to_date('05-05-2021', 'dd-mm-yyyy'), to_date('05-05-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (18, 'Tropical Taste', 'Fresh and vibrant tropical flavors', to_date('10-06-2021', 'dd-mm-yyyy'), to_date('10-06-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (19, 'Burger Bonanza', 'Gourmet burgers with a variety of toppings', to_date('15-07-2021', 'dd-mm-yyyy'), to_date('15-07-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (20, 'Brunch Bliss', 'Delightful and indulgent brunch options', to_date('20-08-2021', 'dd-mm-yyyy'), to_date('20-08-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (21, 'Tapas Treats', 'Spanish tapas and small plates', to_date('25-09-2021', 'dd-mm-yyyy'), to_date('25-09-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (22, 'Middle Eastern Delights', 'Rich and aromatic Middle Eastern cuisine', to_date('30-10-2021', 'dd-mm-yyyy'), to_date('30-10-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (23, 'American Diner', 'Classic American diner fare', to_date('04-11-2021', 'dd-mm-yyyy'), to_date('04-11-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (24, 'Caribbean Flavors', 'Spicy and bold Caribbean dishes', to_date('09-12-2021', 'dd-mm-yyyy'), to_date('09-12-2022', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (25, 'Indian Spice', 'Aromatic and flavorful Indian cuisine', to_date('14-01-2022', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (26, 'Greek Feast', 'Fresh and vibrant Greek dishes', to_date('18-02-2022', 'dd-mm-yyyy'), to_date('18-02-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (27, 'Modern Bistro', 'Contemporary and chic bistro fare', to_date('25-03-2022', 'dd-mm-yyyy'), to_date('25-03-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (28, 'Soul Food', 'Heartwarming and soulful Southern cuisine', to_date('30-04-2022', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (29, 'Fusion Frenzy', 'A creative mix of global flavors', to_date('05-05-2022', 'dd-mm-yyyy'), to_date('05-05-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (30, 'Dessert Dream', 'Heavenly and indulgent desserts', to_date('10-06-2022', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (1000, 'Gourmet Catering', 'Full service catering with a wide variety of menu options', to_date('01-01-2020', 'dd-mm-yyyy'), to_date('01-01-2025', 'dd-mm-yyyy'));
insert into CATERING (cateringid, name, menudescription, contractstartdate, contractenddate)
values (2000, 'Event Catering', 'Specializing in corporate and private events', to_date('01-06-2019', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'));
commit;
prompt 32 records loaded
prompt Loading CUSTOMERSTOCLIENT...
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (196, 1333);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (428, 1044);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (349, 1173);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (384, 1085);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (158, 1244);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (611, 1399);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (307, 1142);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (280, 1386);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (136, 1156);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (185, 1217);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (126, 1150);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (402, 1148);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (229, 1392);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (145, 1341);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (192, 1098);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (363, 1397);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (55, 1301);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (332, 1292);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (469, 1228);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (369, 1114);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (245, 1172);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (368, 1071);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (56, 1099);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (19, 1270);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (441, 1023);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (246, 1077);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (108, 1365);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (121, 1202);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (345, 1240);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (157, 1067);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (183, 1256);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (288, 1134);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (79, 1367);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (100, 1204);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (359, 1395);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (192, 1334);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (102, 1186);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (81, 1010);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (60, 1028);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (320, 1029);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (216, 1088);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (418, 1120);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (282, 1104);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (466, 1170);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (289, 1275);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (386, 1265);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (332, 1396);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (5, 1031);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (441, 1382);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (158, 1276);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (332, 1227);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (45, 1021);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (235, 1329);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (175, 1115);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (45, 1042);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (250, 1330);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (59, 1391);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (219, 1128);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (307, 1187);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (250, 1195);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (148, 1101);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (418, 1331);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (334, 1125);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (130, 1198);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (433, 1374);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (143, 1310);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (335, 1070);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (182, 1375);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (307, 1052);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (205, 1154);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (681, 1251);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (359, 1167);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (106, 1084);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (227, 1009);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (56, 1199);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (247, 1123);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (216, 1262);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (112, 1055);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (441, 1206);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (295, 1346);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (30, 1342);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (61, 1311);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (28, 1182);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (186, 1112);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (322, 1152);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (13, 1369);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (38, 1127);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (270, 1008);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (218, 1049);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (133, 1002);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (242, 1212);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (166, 1063);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (420, 1343);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (164, 1185);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (391, 1171);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (376, 1390);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (250, 1176);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (72, 1281);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (346, 1097);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (52, 1191);
commit;
prompt 100 records committed...
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (21, 1188);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (86, 1284);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (297, 1000);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (364, 1205);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (84, 1016);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (138, 1385);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (228, 1007);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (346, 1381);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (67, 1050);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (366, 1153);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (154, 1389);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (579, 1332);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (382, 1274);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (418, 1236);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (316, 1378);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (322, 1035);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (82, 1353);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (17, 1216);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (375, 1379);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (199, 1076);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (327, 1323);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (234, 1221);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (357, 1141);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (102, 1137);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (356, 1373);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (206, 1273);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (379, 1326);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (285, 1131);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (433, 1355);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (230, 1043);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (99, 1282);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (95, 1279);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (423, 1192);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (317, 1325);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (319, 1362);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (412, 1347);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (9, 1293);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (469, 1197);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (104, 1119);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (225, 1320);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (30, 1370);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (334, 1046);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (98, 1268);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (136, 1366);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (171, 1302);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (140, 1089);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (95, 1393);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (96, 1066);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (237, 1313);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (680, 1218);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (305, 1298);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (232, 1230);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (158, 1036);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (64, 1082);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (278, 1364);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (309, 1211);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (100, 1027);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (62, 1174);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (218, 1162);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (391, 1316);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (33, 1338);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (368, 1352);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (321, 1143);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (433, 1096);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (116, 1006);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (149, 1001);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (265, 1336);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (173, 1161);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (469, 1047);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (341, 1132);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (83, 1053);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (214, 1121);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (185, 1180);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (237, 1118);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (387, 1177);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (423, 1289);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (119, 1360);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (64, 1113);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (339, 1092);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (238, 1280);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (347, 1243);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (288, 1074);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (117, 1013);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (36, 1018);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (387, 1158);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (279, 1231);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (247, 1005);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (110, 1259);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (196, 1184);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (146, 1314);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (434, 1354);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (263, 1068);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (116, 1321);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (159, 1109);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (56, 1254);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (208, 1083);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (204, 1129);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (369, 1004);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (100, 1328);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (440, 1149);
commit;
prompt 200 records committed...
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (342, 1124);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (20, 1160);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (115, 1094);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (254, 1278);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (377, 1116);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (83, 1300);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (345, 1286);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (253, 1245);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (176, 1309);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (165, 1200);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (90, 1095);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (181, 1257);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (298, 1032);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (135, 1383);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (150, 1024);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (85, 1183);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (398, 1166);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (184, 1350);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (269, 1086);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (579, 1272);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (41, 1012);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (375, 1380);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (260, 1030);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (382, 1335);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (35, 1252);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (121, 1229);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (679, 1015);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (355, 1037);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (427, 1138);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (176, 1299);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (66, 1020);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (13, 1371);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (579, 1315);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (82, 1048);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (188, 1091);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (262, 1130);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (166, 1011);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (165, 1398);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (424, 1169);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (320, 1377);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (42, 1247);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (3, 1225);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (579, 1039);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (166, 1250);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (42, 1356);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (355, 1017);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (270, 1056);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (86, 1014);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (131, 1209);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (113, 1175);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (80, 1242);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (316, 1139);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (337, 1213);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (402, 1287);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (3, 1238);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (53, 1388);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (304, 1387);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (186, 1179);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (98, 1178);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (276, 1040);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (129, 1349);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (289, 1045);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (222, 1359);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (646, 1196);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (435, 1384);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (259, 1122);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (350, 1271);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (273, 1135);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (227, 1241);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (439, 1168);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (273, 1110);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (121, 1136);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (200, 1239);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (143, 1140);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (328, 1034);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (370, 1207);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (250, 1064);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (47, 1358);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (352, 1294);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (159, 1344);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (183, 1277);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (70, 1258);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (284, 1394);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (53, 1194);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (423, 1117);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (385, 1345);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (252, 1233);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (304, 1165);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (282, 1361);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (387, 1080);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (245, 1219);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (282, 1237);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (218, 1181);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (123, 1324);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (22, 1144);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (313, 1105);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (7, 1054);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (391, 1291);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (356, 1340);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (60, 1059);
commit;
prompt 300 records committed...
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (404, 1189);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (127, 1226);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (368, 1288);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (108, 1157);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (92, 1224);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (431, 1155);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (106, 1060);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (284, 1246);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (354, 1264);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (159, 1090);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (362, 1222);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (331, 1260);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (250, 1087);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (345, 1069);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (6, 1376);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (369, 1266);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (390, 1126);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (276, 1322);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (176, 1263);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (85, 1290);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (63, 1133);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (611, 1051);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (679, 1297);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (272, 1249);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (392, 1145);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (469, 1108);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (325, 1312);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (224, 1304);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (44, 1295);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (235, 1100);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (263, 1255);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (90, 1038);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (123, 1203);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (113, 1269);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (402, 1363);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (58, 1267);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (185, 1164);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (235, 1248);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (218, 1193);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (393, 1026);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (329, 1285);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (251, 1022);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (133, 1163);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (41, 1072);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (71, 1190);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (112, 1351);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (348, 1317);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (126, 1078);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (281, 1111);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (231, 1058);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (611, 1033);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (254, 1327);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (151, 1357);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (348, 1348);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (138, 1079);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (434, 1102);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (129, 1057);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (435, 1234);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (54, 1081);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (253, 1303);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (258, 1065);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (285, 1147);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (681, 1306);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (342, 1062);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (251, 1223);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (58, 1339);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (397, 1073);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (437, 1308);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (203, 1201);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (117, 1208);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (406, 1261);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (381, 1106);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (170, 1307);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (268, 1019);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (159, 1003);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (439, 1146);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (110, 1318);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (133, 1159);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (422, 1296);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (198, 1235);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (121, 1061);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (170, 1214);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (114, 1232);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (82, 1151);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (431, 1215);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (135, 1319);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (427, 1093);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (128, 1337);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (223, 1025);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (365, 1220);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (287, 1305);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (350, 1283);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (73, 1107);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (253, 1368);
insert into CUSTOMERSTOCLIENT (clientid, customerid)
values (425, 1372);
commit;
prompt 395 records loaded
prompt Loading GUSTS...
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3000, 'Acquaintances', 'Goran', 'Giraldo', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('30-07-2021', 'dd-mm-yyyy'), 'Cancelled', 2265, 1156);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3001, 'Friends', 'Chet', 'Tah', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('25-06-2021', 'dd-mm-yyyy'), 'Declined', 2104, 1172);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3002, 'Close Friends', 'Gene', 'Ramirez', to_date('24-09-2021', 'dd-mm-yyyy'), to_date('31-01-2021', 'dd-mm-yyyy'), 'Waitlisted', 2160, 1063);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3003, 'Acquaintances', 'Murray', 'Shawn', to_date('15-08-2021', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), 'Declined', 2322, 1025);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3004, 'Work Colleagues', 'Oro', 'Polley', to_date('09-01-2021', 'dd-mm-yyyy'), to_date('03-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2089, 1023);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3005, 'Acquaintances', 'Roberta', 'Geldof', to_date('17-04-2021', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 'Waitlisted', 2012, 1308);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3006, 'Work Colleagues', 'Dwight', 'Tilly', to_date('10-11-2021', 'dd-mm-yyyy'), to_date('31-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2264, 1258);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3007, 'External Invitees', 'Stevie', 'Getty', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('04-10-2021', 'dd-mm-yyyy'), 'Declined', 2230, 1340);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3008, 'Neighbors', 'Rick', 'Forster', to_date('11-08-2021', 'dd-mm-yyyy'), to_date('17-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2325, 1002);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3009, 'Work Colleagues', 'Joshua', 'Sandler', to_date('26-12-2021', 'dd-mm-yyyy'), to_date('30-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2039, 1287);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3010, 'Close Friends', 'Dwight', 'Dafoe', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('06-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2205, 1374);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3011, 'Neighbors', 'Andie', 'Cassidy', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('31-07-2021', 'dd-mm-yyyy'), 'Cancelled', 2290, 1041);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3012, 'Acquaintances', 'Fisher', 'Mann', to_date('17-02-2021', 'dd-mm-yyyy'), to_date('01-12-2021', 'dd-mm-yyyy'), 'Confirmed', 2314, 1056);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3013, 'Close Friends', 'Liv', 'Ponce', to_date('29-05-2021', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 'Declined', 2192, 1092);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3014, 'Acquaintances', 'Alessandro', 'Kadison', to_date('24-10-2021', 'dd-mm-yyyy'), to_date('14-02-2021', 'dd-mm-yyyy'), 'Declined', 2104, 1165);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3015, 'Acquaintances', 'Jean-Claude', 'Depp', to_date('30-01-2021', 'dd-mm-yyyy'), to_date('01-06-2021', 'dd-mm-yyyy'), 'Declined', 2288, 1003);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3016, 'Neighbors', 'Lydia', 'Matthau', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('12-07-2021', 'dd-mm-yyyy'), 'Declined', 2255, 1330);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3017, 'External Invitees', 'Scarlett', 'Cotton', to_date('07-11-2021', 'dd-mm-yyyy'), to_date('10-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2233, 1087);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3018, 'Close Friends', 'Annette', 'McDiarmid', to_date('20-09-2021', 'dd-mm-yyyy'), to_date('31-08-2021', 'dd-mm-yyyy'), 'No Response', 2039, 1366);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3019, 'Close Friends', 'Pierce', 'Ferrell', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('01-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2165, 1279);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3020, 'Friends', 'Scarlett', 'Mirren', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('24-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2303, 1348);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3021, 'Acquaintances', 'Harvey', 'Walken', to_date('22-02-2021', 'dd-mm-yyyy'), to_date('03-08-2021', 'dd-mm-yyyy'), 'No Response', 2082, 1216);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3022, 'Immediate Family', 'Natalie', 'Owen', to_date('18-12-2021', 'dd-mm-yyyy'), to_date('31-12-2021', 'dd-mm-yyyy'), 'Declined', 2041, 1291);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3023, 'External Invitees', 'Wes', 'Morrison', to_date('07-10-2021', 'dd-mm-yyyy'), to_date('05-06-2021', 'dd-mm-yyyy'), 'Cancelled', 2017, 1107);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3024, 'Close Friends', 'Billy', 'Bragg', to_date('26-11-2021', 'dd-mm-yyyy'), to_date('19-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2169, 1217);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3025, 'Friends', 'Lauren', 'Griggs', to_date('15-04-2021', 'dd-mm-yyyy'), to_date('01-06-2021', 'dd-mm-yyyy'), 'Declined', 2214, 1008);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3026, 'External Invitees', 'Busta', 'Wainwright', to_date('25-07-2021', 'dd-mm-yyyy'), to_date('01-06-2021', 'dd-mm-yyyy'), 'No Response', 2100, 1238);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3027, 'Acquaintances', 'Jean-Claude', 'Colin Young', to_date('13-09-2021', 'dd-mm-yyyy'), to_date('20-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2099, 1302);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3028, 'Neighbors', 'Buffy', 'Liu', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('16-07-2021', 'dd-mm-yyyy'), 'No Response', 2321, 1225);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3029, 'Close Friends', 'Boz', 'Kahn', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('17-03-2021', 'dd-mm-yyyy'), 'No Response', 2060, 1170);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3030, 'Close Friends', 'Gaby', 'Rhymes', to_date('28-06-2021', 'dd-mm-yyyy'), to_date('18-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2163, 1285);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3031, 'Work Colleagues', 'Paula', 'Leguizamo', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('29-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2019, 1065);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3032, 'Extended Family', 'Madeline', 'Moody', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('05-04-2021', 'dd-mm-yyyy'), 'No Response', 2382, 1040);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3033, 'External Invitees', 'Barbara', 'Swank', to_date('12-12-2021', 'dd-mm-yyyy'), to_date('03-02-2021', 'dd-mm-yyyy'), 'No Response', 2009, 1191);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3034, 'Extended Family', 'Cary', 'Mohr', to_date('10-08-2021', 'dd-mm-yyyy'), to_date('21-03-2021', 'dd-mm-yyyy'), 'No Response', 2130, 1293);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3035, 'Immediate Family', 'Stephanie', 'Stone', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), 'Waitlisted', 2345, 1174);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3036, 'Extended Family', 'Armand', 'Craddock', to_date('29-04-2021', 'dd-mm-yyyy'), to_date('16-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2333, 1312);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3037, 'Close Friends', 'Scott', 'Venora', to_date('08-07-2021', 'dd-mm-yyyy'), to_date('20-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2204, 1341);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3038, 'Friends', 'Curtis', 'Collie', to_date('29-11-2021', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 'No Response', 2261, 1300);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3039, 'Close Friends', 'Chet', 'Carlton', to_date('13-02-2021', 'dd-mm-yyyy'), to_date('21-11-2021', 'dd-mm-yyyy'), '''Plus One''.', 2197, 1192);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3040, 'Close Friends', 'Randy', 'Crudup', to_date('17-08-2021', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 'Declined', 2110, 1273);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3041, 'Extended Family', 'Claude', 'MacDowell', to_date('20-12-2021', 'dd-mm-yyyy'), to_date('25-09-2021', 'dd-mm-yyyy'), 'Confirmed', 2146, 1073);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3042, 'External Invitees', 'Alana', 'Cronin', to_date('19-03-2021', 'dd-mm-yyyy'), to_date('14-09-2021', 'dd-mm-yyyy'), '''Plus One''.', 2370, 1131);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3043, 'Neighbors', 'Colin', 'Romijn-Stamos', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('01-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2055, 1059);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3044, 'Work Colleagues', 'Taryn', 'Rhys-Davies', to_date('14-07-2021', 'dd-mm-yyyy'), to_date('01-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2005, 1136);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3045, 'Immediate Family', 'Arturo', 'Field', to_date('12-08-2021', 'dd-mm-yyyy'), to_date('28-10-2021', 'dd-mm-yyyy'), 'No Response', 2291, 1019);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3046, 'Close Friends', 'Simon', 'Moorer', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('25-11-2021', 'dd-mm-yyyy'), 'No Response', 2226, 1187);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3047, 'Close Friends', 'Thora', 'White', to_date('12-09-2021', 'dd-mm-yyyy'), to_date('26-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2154, 1100);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3048, 'Acquaintances', 'Jean-Luc', 'Broza', to_date('26-11-2021', 'dd-mm-yyyy'), to_date('30-03-2021', 'dd-mm-yyyy'), 'Waitlisted', 2267, 1294);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3049, 'Work Colleagues', 'Sonny', 'Hidalgo', to_date('12-09-2021', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 'No Response', 2053, 1394);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3050, 'External Invitees', 'Thelma', 'Leoni', to_date('04-02-2021', 'dd-mm-yyyy'), to_date('28-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2358, 1253);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3051, 'Immediate Family', 'Miguel', 'Kristofferson', to_date('05-09-2021', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2083, 1219);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3052, 'Friends', 'Chely', 'Moody', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('06-02-2021', 'dd-mm-yyyy'), 'Waitlisted', 2302, 1123);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3053, 'Friends', 'Geggy', 'Rain', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('03-07-2021', 'dd-mm-yyyy'), 'Declined', 2200, 1193);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3054, 'Neighbors', 'Carolyn', 'Blige', to_date('07-09-2021', 'dd-mm-yyyy'), to_date('14-02-2021', 'dd-mm-yyyy'), 'Declined', 2048, 1296);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3055, 'Friends', 'Winona', 'Rockwell', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('22-05-2021', 'dd-mm-yyyy'), 'Declined', 2391, 1304);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3056, 'Extended Family', 'Neneh', 'Skerritt', to_date('14-11-2021', 'dd-mm-yyyy'), to_date('22-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2269, 1379);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3057, 'Immediate Family', 'Jeremy', 'Rodgers', to_date('28-02-2021', 'dd-mm-yyyy'), to_date('10-07-2021', 'dd-mm-yyyy'), '''Plus One''.', 2057, 1392);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3058, 'Work Colleagues', 'Emilio', 'Northam', to_date('20-10-2021', 'dd-mm-yyyy'), to_date('16-06-2021', 'dd-mm-yyyy'), 'Cancelled', 2136, 1062);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3059, 'External Invitees', 'Sinead', 'Sutherland', to_date('03-05-2021', 'dd-mm-yyyy'), to_date('03-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2181, 1220);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3060, 'Friends', 'Kimberly', 'Hurt', to_date('01-02-2021', 'dd-mm-yyyy'), to_date('14-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2288, 1399);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3061, 'Extended Family', 'LeVar', 'O''Neill', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('21-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2307, 1350);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3062, 'Friends', 'Aimee', 'Ramirez', to_date('21-02-2021', 'dd-mm-yyyy'), to_date('04-09-2021', 'dd-mm-yyyy'), 'No Response', 2217, 1279);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3063, 'Work Colleagues', 'Leslie', 'Logue', to_date('27-07-2021', 'dd-mm-yyyy'), to_date('18-11-2021', 'dd-mm-yyyy'), 'Declined', 2313, 1217);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3064, 'Immediate Family', 'Terry', 'Cromwell', to_date('10-03-2021', 'dd-mm-yyyy'), to_date('20-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2032, 1103);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3065, 'Neighbors', 'Harry', 'Cozier', to_date('29-11-2021', 'dd-mm-yyyy'), to_date('08-02-2021', 'dd-mm-yyyy'), 'Waitlisted', 2187, 1205);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3066, 'Friends', 'Pierce', 'Warren', to_date('17-02-2021', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2243, 1257);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3067, 'Neighbors', 'Miguel', 'Blades', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2203, 1124);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3068, 'Extended Family', 'Yolanda', 'Bracco', to_date('02-06-2021', 'dd-mm-yyyy'), to_date('24-02-2021', 'dd-mm-yyyy'), 'Cancelled', 2330, 1391);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3069, 'Acquaintances', 'Stevie', 'Rodgers', to_date('26-11-2021', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2292, 1079);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3070, 'Extended Family', 'Robbie', 'Berry', to_date('13-10-2021', 'dd-mm-yyyy'), to_date('23-01-2021', 'dd-mm-yyyy'), 'No Response', 2122, 1287);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3071, 'Immediate Family', 'Betty', 'Kutcher', to_date('21-02-2021', 'dd-mm-yyyy'), to_date('01-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2222, 1153);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3072, 'Close Friends', 'Nick', 'Costello', to_date('17-12-2021', 'dd-mm-yyyy'), to_date('18-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2370, 1343);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3073, 'Immediate Family', 'Jena', 'Kenoly', to_date('25-07-2021', 'dd-mm-yyyy'), to_date('11-07-2021', 'dd-mm-yyyy'), 'Declined', 2170, 1073);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3074, 'External Invitees', 'Ed', 'Worrell', to_date('21-02-2021', 'dd-mm-yyyy'), to_date('31-08-2021', 'dd-mm-yyyy'), 'Declined', 2120, 1041);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3075, 'Work Colleagues', 'Bill', 'Hornsby', to_date('28-07-2021', 'dd-mm-yyyy'), to_date('20-10-2021', 'dd-mm-yyyy'), 'Declined', 2099, 1095);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3076, 'Immediate Family', 'Rita', 'Pullman', to_date('16-01-2021', 'dd-mm-yyyy'), to_date('22-05-2021', 'dd-mm-yyyy'), 'Waitlisted', 2093, 1024);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3077, 'Extended Family', 'Nathan', 'Witt', to_date('14-12-2021', 'dd-mm-yyyy'), to_date('24-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2330, 1270);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3078, 'External Invitees', 'Avril', 'Ronstadt', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('10-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2056, 1172);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3079, 'Immediate Family', 'Diane', 'Ceasar', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('06-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2120, 1125);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3080, 'Immediate Family', 'Sydney', 'Botti', to_date('08-11-2021', 'dd-mm-yyyy'), to_date('05-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2198, 1076);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3081, 'External Invitees', 'Merillee', 'Ojeda', to_date('16-07-2021', 'dd-mm-yyyy'), to_date('13-02-2021', 'dd-mm-yyyy'), 'Waitlisted', 2234, 1334);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3082, 'Close Friends', 'Vincent', 'Michael', to_date('24-01-2021', 'dd-mm-yyyy'), to_date('28-08-2021', 'dd-mm-yyyy'), 'No Response', 2107, 1314);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3083, 'External Invitees', 'Jon', 'Macy', to_date('12-09-2021', 'dd-mm-yyyy'), to_date('13-11-2021', 'dd-mm-yyyy'), 'Waitlisted', 2324, 1397);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3084, 'External Invitees', 'James', 'Richardson', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('07-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2141, 1125);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3085, 'Close Friends', 'Marianne', 'Kline', to_date('06-02-2021', 'dd-mm-yyyy'), to_date('13-01-2021', 'dd-mm-yyyy'), 'No Response', 2301, 1311);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3086, 'Neighbors', 'Linda', 'Shatner', to_date('12-09-2021', 'dd-mm-yyyy'), to_date('29-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2007, 1283);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3087, 'Work Colleagues', 'Aaron', 'Daniels', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'), 'No Response', 2110, 1247);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3088, 'Friends', 'Marie', 'Hobson', to_date('07-10-2021', 'dd-mm-yyyy'), to_date('07-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2132, 1377);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3089, 'Acquaintances', 'Donna', 'Birch', to_date('07-03-2021', 'dd-mm-yyyy'), to_date('26-06-2021', 'dd-mm-yyyy'), '''Plus One''.', 2306, 1227);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3090, 'Extended Family', 'Ethan', 'Tanon', to_date('08-11-2021', 'dd-mm-yyyy'), to_date('28-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2244, 1077);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3091, 'Friends', 'Horace', 'Gallagher', to_date('07-04-2021', 'dd-mm-yyyy'), to_date('21-11-2021', 'dd-mm-yyyy'), 'Cancelled', 2230, 1194);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3092, 'Neighbors', 'Lionel', 'Sheen', to_date('04-01-2021', 'dd-mm-yyyy'), to_date('21-12-2021', 'dd-mm-yyyy'), 'Declined', 2340, 1019);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3093, 'Friends', 'Kylie', 'Payne', to_date('31-03-2021', 'dd-mm-yyyy'), to_date('31-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2182, 1090);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3094, 'External Invitees', 'Harris', 'Horizon', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('13-12-2021', 'dd-mm-yyyy'), 'No Response', 2065, 1274);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3095, 'Extended Family', 'Laurie', 'Polley', to_date('05-06-2021', 'dd-mm-yyyy'), to_date('13-10-2021', 'dd-mm-yyyy'), 'Cancelled', 2395, 1334);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3096, 'Close Friends', 'Danny', 'Wainwright', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('12-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2088, 1022);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3097, 'Work Colleagues', 'Rascal', 'Dillon', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'), '''Plus One''.', 2015, 1290);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3098, 'Immediate Family', 'Suzy', 'Collie', to_date('22-06-2021', 'dd-mm-yyyy'), to_date('13-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2272, 1032);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3099, 'Neighbors', 'Mykelti', 'Squier', to_date('22-06-2021', 'dd-mm-yyyy'), to_date('10-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2070, 1348);
commit;
prompt 100 records committed...
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3100, 'Neighbors', 'Donald', 'Shepard', to_date('19-12-2021', 'dd-mm-yyyy'), to_date('09-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2255, 1334);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3101, 'External Invitees', 'Luke', 'Faithfull', to_date('17-02-2021', 'dd-mm-yyyy'), to_date('04-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2050, 1397);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3102, 'External Invitees', 'Quentin', 'Atlas', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('27-08-2021', 'dd-mm-yyyy'), 'Declined', 2022, 1294);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3103, 'Acquaintances', 'Gil', 'Strathairn', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('07-07-2021', 'dd-mm-yyyy'), 'Cancelled', 2078, 1298);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3104, 'Close Friends', 'Elle', 'Phifer', to_date('26-11-2021', 'dd-mm-yyyy'), to_date('15-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2079, 1288);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3105, 'Close Friends', 'Viggo', 'Aaron', to_date('12-11-2021', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), 'Cancelled', 2288, 1362);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3106, 'Acquaintances', 'Nicholas', 'Azaria', to_date('12-05-2021', 'dd-mm-yyyy'), to_date('02-06-2021', 'dd-mm-yyyy'), 'No Response', 2031, 1180);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3107, 'Acquaintances', 'Ice', 'Lewis', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('04-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2197, 1225);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3108, 'Neighbors', 'Molly', 'Torino', to_date('12-12-2021', 'dd-mm-yyyy'), to_date('10-07-2021', 'dd-mm-yyyy'), 'Waitlisted', 2352, 1195);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3109, 'External Invitees', 'Clea', 'Cummings', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('12-01-2021', 'dd-mm-yyyy'), 'Waitlisted', 2084, 1119);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3110, 'External Invitees', 'Elle', 'Gordon', to_date('18-11-2021', 'dd-mm-yyyy'), to_date('09-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2168, 1195);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3111, 'Immediate Family', 'Benicio', 'Coward', to_date('25-07-2021', 'dd-mm-yyyy'), to_date('08-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2361, 1153);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3112, 'Immediate Family', 'Morris', 'Weaving', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('08-07-2021', 'dd-mm-yyyy'), 'Declined', 2223, 1151);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3113, 'Neighbors', 'Salma', 'Harmon', to_date('22-09-2021', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2152, 1382);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3114, 'Immediate Family', 'Sinead', 'Fonda', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('07-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2260, 1222);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3115, 'Extended Family', 'Spike', 'Underwood', to_date('11-03-2021', 'dd-mm-yyyy'), to_date('31-12-2021', 'dd-mm-yyyy'), 'No Response', 2263, 1087);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3116, 'Extended Family', 'Gene', 'Kenoly', to_date('06-02-2021', 'dd-mm-yyyy'), to_date('30-08-2021', 'dd-mm-yyyy'), 'No Response', 2396, 1029);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3117, 'Work Colleagues', 'Temuera', 'Moreno', to_date('21-04-2021', 'dd-mm-yyyy'), to_date('11-02-2021', 'dd-mm-yyyy'), 'Confirmed', 2161, 1246);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3118, 'Extended Family', 'Nik', 'Gray', to_date('22-10-2021', 'dd-mm-yyyy'), to_date('18-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2092, 1328);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3119, 'External Invitees', 'Natascha', 'Heche', to_date('05-11-2021', 'dd-mm-yyyy'), to_date('29-07-2021', 'dd-mm-yyyy'), 'Waitlisted', 2148, 1013);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3120, 'Immediate Family', 'Kid', 'Delta', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('10-02-2021', 'dd-mm-yyyy'), 'No Response', 2333, 1286);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3121, 'External Invitees', 'Millie', 'Peet', to_date('07-01-2021', 'dd-mm-yyyy'), to_date('28-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2336, 1389);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3122, 'Friends', 'Roy', 'Broadbent', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('11-12-2021', 'dd-mm-yyyy'), 'Confirmed', 2201, 1359);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3123, 'Acquaintances', 'Natalie', 'Venora', to_date('18-12-2021', 'dd-mm-yyyy'), to_date('26-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2021, 1298);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3124, 'External Invitees', 'Ty', 'Christie', to_date('27-12-2021', 'dd-mm-yyyy'), to_date('16-07-2021', 'dd-mm-yyyy'), 'Declined', 2251, 1361);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3125, 'Work Colleagues', 'Neneh', 'Whitwam', to_date('29-06-2021', 'dd-mm-yyyy'), to_date('24-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2258, 1267);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3126, 'External Invitees', 'Brooke', 'Doucette', to_date('15-06-2021', 'dd-mm-yyyy'), to_date('24-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2284, 1344);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3127, 'External Invitees', 'Horace', 'Kweller', to_date('08-03-2021', 'dd-mm-yyyy'), to_date('20-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2040, 1092);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3128, 'Friends', 'Cheech', 'Field', to_date('07-07-2021', 'dd-mm-yyyy'), to_date('17-02-2021', 'dd-mm-yyyy'), 'Declined', 2325, 1271);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3129, 'Close Friends', 'Treat', 'Kristofferson', to_date('31-05-2021', 'dd-mm-yyyy'), to_date('02-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2067, 1120);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3130, 'Immediate Family', 'Derrick', 'Polley', to_date('05-11-2021', 'dd-mm-yyyy'), to_date('03-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2393, 1092);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3131, 'Friends', 'Michael', 'Oszajca', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('13-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2123, 1123);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3132, 'Immediate Family', 'Karon', 'Starr', to_date('07-11-2021', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2284, 1218);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3133, 'Work Colleagues', 'Miko', 'Tyler', to_date('19-02-2021', 'dd-mm-yyyy'), to_date('04-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2055, 1169);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3134, 'Immediate Family', 'Phoebe', 'Lane', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('27-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2136, 1394);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3135, 'Friends', 'Maury', 'Polley', to_date('06-05-2021', 'dd-mm-yyyy'), to_date('18-11-2021', 'dd-mm-yyyy'), 'Cancelled', 2341, 1302);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3136, 'Work Colleagues', 'Cole', 'Cornell', to_date('30-11-2021', 'dd-mm-yyyy'), to_date('20-02-2021', 'dd-mm-yyyy'), 'No Response', 2214, 1181);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3137, 'External Invitees', 'Jeffrey', 'Maxwell', to_date('05-04-2021', 'dd-mm-yyyy'), to_date('09-07-2021', 'dd-mm-yyyy'), 'Waitlisted', 2273, 1215);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3138, 'External Invitees', 'Albert', 'Rhymes', to_date('17-01-2021', 'dd-mm-yyyy'), to_date('24-11-2021', 'dd-mm-yyyy'), 'No Response', 2277, 1223);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3139, 'Immediate Family', 'Sal', 'LaSalle', to_date('05-07-2021', 'dd-mm-yyyy'), to_date('22-04-2021', 'dd-mm-yyyy'), 'No Response', 2123, 1123);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3140, 'Extended Family', 'Debbie', 'Rawls', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 'No Response', 2159, 1325);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3141, 'Neighbors', 'Colm', 'Heslov', to_date('26-02-2021', 'dd-mm-yyyy'), to_date('02-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2127, 1042);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3142, 'Work Colleagues', 'Curtis', 'Santa Rosa', to_date('21-12-2021', 'dd-mm-yyyy'), to_date('25-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2337, 1331);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3143, 'Extended Family', 'Bridgette', 'Magnuson', to_date('14-12-2021', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'), 'Declined', 2254, 1259);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3144, 'Acquaintances', 'Joey', 'Church', to_date('17-09-2021', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 'Declined', 2116, 1193);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3145, 'External Invitees', 'Chloe', 'Affleck', to_date('30-04-2021', 'dd-mm-yyyy'), to_date('12-11-2021', 'dd-mm-yyyy'), '''Plus One''.', 2381, 1213);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3146, 'Acquaintances', 'Garth', 'Bello', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('01-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2193, 1052);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3147, 'Neighbors', 'Lizzy', 'Balaban', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('16-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2074, 1164);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3148, 'Close Friends', 'Lorraine', 'Coverdale', to_date('22-06-2021', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2041, 1310);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3149, 'Immediate Family', 'Terri', 'McPherson', to_date('28-09-2021', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), '''Plus One''.', 2354, 1074);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3150, 'Extended Family', 'Denise', 'Caine', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('22-03-2021', 'dd-mm-yyyy'), 'Waitlisted', 2078, 1104);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3151, 'Work Colleagues', 'Phoebe', 'Reubens', to_date('19-01-2021', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2280, 1075);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3152, 'Friends', 'Bret', 'Rankin', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('14-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2245, 1183);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3153, 'Acquaintances', 'Halle', 'Boone', to_date('09-10-2021', 'dd-mm-yyyy'), to_date('22-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2320, 1152);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3154, 'Close Friends', 'Lorraine', 'Phifer', to_date('17-08-2021', 'dd-mm-yyyy'), to_date('08-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2181, 1182);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3155, 'Extended Family', 'Jeremy', 'Chaykin', to_date('24-10-2021', 'dd-mm-yyyy'), to_date('20-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2127, 1209);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3156, 'Close Friends', 'Gena', 'Sorvino', to_date('07-09-2021', 'dd-mm-yyyy'), to_date('04-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2196, 1298);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3157, 'External Invitees', 'Pat', 'Waits', to_date('15-08-2021', 'dd-mm-yyyy'), to_date('07-08-2021', 'dd-mm-yyyy'), 'Waitlisted', 2312, 1154);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3158, 'Acquaintances', 'Susan', 'Orlando', to_date('28-08-2021', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2249, 1165);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3159, 'Friends', 'Rene', 'Fishburne', to_date('30-01-2021', 'dd-mm-yyyy'), to_date('11-02-2021', 'dd-mm-yyyy'), 'No Response', 2224, 1365);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3160, 'External Invitees', 'Jessica', 'Pigott-Smith', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'), 'No Response', 2118, 1126);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3161, 'Immediate Family', 'Lisa', 'Goodman', to_date('02-05-2021', 'dd-mm-yyyy'), to_date('08-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2118, 1170);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3162, 'Neighbors', 'Jonatha', 'Arkin', to_date('23-08-2021', 'dd-mm-yyyy'), to_date('28-10-2021', 'dd-mm-yyyy'), 'Declined', 2382, 1112);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3163, 'Neighbors', 'Donal', 'Ward', to_date('01-09-2021', 'dd-mm-yyyy'), to_date('02-01-2021', 'dd-mm-yyyy'), 'Declined', 2136, 1322);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3164, 'Neighbors', 'Jean-Claude', 'Moraz', to_date('01-09-2021', 'dd-mm-yyyy'), to_date('18-01-2021', 'dd-mm-yyyy'), 'No Response', 2190, 1116);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3165, 'Extended Family', 'Ray', 'Buffalo', to_date('26-06-2021', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 'No Response', 2080, 1271);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3166, 'Work Colleagues', 'Jose', 'Tippe', to_date('11-04-2021', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), '''Plus One''.', 2239, 1265);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3167, 'Neighbors', 'Melanie', 'Jane', to_date('05-02-2021', 'dd-mm-yyyy'), to_date('15-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2386, 1241);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3168, 'Neighbors', 'Brothers', 'Blige', to_date('16-12-2021', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2149, 1099);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3169, 'Immediate Family', 'Larry', 'Murphy', to_date('29-05-2021', 'dd-mm-yyyy'), to_date('06-08-2021', 'dd-mm-yyyy'), 'Declined', 2301, 1107);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3170, 'External Invitees', 'Steven', 'McPherson', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('17-01-2021', 'dd-mm-yyyy'), 'Declined', 2235, 1245);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3171, 'External Invitees', 'Beverley', 'Scaggs', to_date('01-09-2021', 'dd-mm-yyyy'), to_date('19-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2053, 1266);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3172, 'Work Colleagues', 'Candice', 'O''Donnell', to_date('28-09-2021', 'dd-mm-yyyy'), to_date('13-04-2021', 'dd-mm-yyyy'), 'Confirmed', 2087, 1089);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3173, 'Neighbors', 'Jann', 'Aniston', to_date('22-02-2021', 'dd-mm-yyyy'), to_date('03-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2235, 1113);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3174, 'Acquaintances', 'Kiefer', 'LuPone', to_date('05-02-2021', 'dd-mm-yyyy'), to_date('08-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2340, 1255);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3175, 'External Invitees', 'Alice', 'Oszajca', to_date('13-08-2021', 'dd-mm-yyyy'), to_date('22-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2372, 1118);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3176, 'Work Colleagues', 'Tori', 'Candy', to_date('12-05-2021', 'dd-mm-yyyy'), to_date('27-02-2021', 'dd-mm-yyyy'), 'Declined', 2053, 1279);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3177, 'Extended Family', 'Emilio', 'Wiedlin', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('17-01-2021', 'dd-mm-yyyy'), 'Waitlisted', 2297, 1301);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3178, 'Friends', 'Alan', 'Esposito', to_date('13-09-2021', 'dd-mm-yyyy'), to_date('21-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2081, 1281);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3179, 'Friends', 'Donald', 'Gates', to_date('06-05-2021', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 'Cancelled', 2332, 1304);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3180, 'Extended Family', 'Sheryl', 'Goldwyn', to_date('12-08-2021', 'dd-mm-yyyy'), to_date('23-07-2021', 'dd-mm-yyyy'), '''Plus One''.', 2052, 1244);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3181, 'Extended Family', 'Freddy', 'Speaks', to_date('07-11-2021', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 'Confirmed', 2255, 1269);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3182, 'External Invitees', 'Rosanne', 'Loveless', to_date('19-06-2021', 'dd-mm-yyyy'), to_date('16-04-2021', 'dd-mm-yyyy'), 'No Response', 2141, 1087);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3183, 'Work Colleagues', 'Sonny', 'Potter', to_date('05-07-2021', 'dd-mm-yyyy'), to_date('13-09-2021', 'dd-mm-yyyy'), 'No Response', 2282, 1110);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3184, 'Acquaintances', 'Anita', 'Hackman', to_date('30-04-2021', 'dd-mm-yyyy'), to_date('20-11-2021', 'dd-mm-yyyy'), 'Declined', 2045, 1140);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3185, 'Friends', 'Antonio', 'Osborne', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 'No Response', 2035, 1391);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3186, 'Neighbors', 'Donald', 'Charles', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('23-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2360, 1021);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3187, 'Work Colleagues', 'Giancarlo', 'Herrmann', to_date('30-04-2021', 'dd-mm-yyyy'), to_date('15-07-2021', 'dd-mm-yyyy'), 'No Response', 2325, 1002);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3188, 'Extended Family', 'Jackie', 'Gold', to_date('07-07-2021', 'dd-mm-yyyy'), to_date('25-01-2021', 'dd-mm-yyyy'), 'Waitlisted', 2351, 1307);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3189, 'External Invitees', 'Gerald', 'Beals', to_date('01-07-2021', 'dd-mm-yyyy'), to_date('18-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2118, 1227);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3190, 'Close Friends', 'Jane', 'Brown', to_date('30-06-2021', 'dd-mm-yyyy'), to_date('15-01-2021', 'dd-mm-yyyy'), 'Declined', 2133, 1211);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3191, 'External Invitees', 'Ike', 'McDonnell', to_date('14-09-2021', 'dd-mm-yyyy'), to_date('03-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2320, 1029);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3192, 'External Invitees', 'Rawlins', 'McGinley', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('15-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2042, 1061);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3193, 'External Invitees', 'Grace', 'English', to_date('09-01-2021', 'dd-mm-yyyy'), to_date('07-12-2021', 'dd-mm-yyyy'), 'No Response', 2342, 1116);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3194, 'Neighbors', 'Embeth', 'Liu', to_date('08-05-2021', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2012, 1167);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3195, 'Work Colleagues', 'Christopher', 'Carlisle', to_date('19-10-2021', 'dd-mm-yyyy'), to_date('16-05-2021', 'dd-mm-yyyy'), 'No Response', 2284, 1221);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3196, 'Close Friends', 'Pamela', 'MacNeil', to_date('25-07-2021', 'dd-mm-yyyy'), to_date('31-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2149, 1104);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3197, 'Friends', 'Mary', 'English', to_date('06-10-2021', 'dd-mm-yyyy'), to_date('26-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2302, 1377);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3198, 'External Invitees', 'Malcolm', 'Penn', to_date('15-07-2021', 'dd-mm-yyyy'), to_date('10-08-2021', 'dd-mm-yyyy'), 'Declined', 2106, 1380);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3199, 'Extended Family', 'Armand', 'Lee', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('31-05-2021', 'dd-mm-yyyy'), 'No Response', 2388, 1190);
commit;
prompt 200 records committed...
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3200, 'Neighbors', 'Patrick', 'Schwarzenegger', to_date('26-04-2021', 'dd-mm-yyyy'), to_date('31-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2058, 1116);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3201, 'External Invitees', 'Vonda', 'Miles', to_date('22-10-2021', 'dd-mm-yyyy'), to_date('24-04-2021', 'dd-mm-yyyy'), 'Declined', 2146, 1113);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3202, 'Acquaintances', 'Alannah', 'Allan', to_date('16-01-2021', 'dd-mm-yyyy'), to_date('18-10-2021', 'dd-mm-yyyy'), 'No Response', 2078, 1320);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3203, 'Friends', 'Roberta', 'Stigers', to_date('22-11-2021', 'dd-mm-yyyy'), to_date('04-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2162, 1326);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3204, 'External Invitees', 'Arturo', 'Brown', to_date('19-01-2021', 'dd-mm-yyyy'), to_date('11-10-2021', 'dd-mm-yyyy'), '''Plus One''.', 2311, 1361);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3205, 'External Invitees', 'Liev', 'Kinney', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('18-09-2021', 'dd-mm-yyyy'), 'No Response', 2183, 1007);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3206, 'Immediate Family', 'Tilda', 'Askew', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('27-09-2021', 'dd-mm-yyyy'), 'Declined', 2350, 1043);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3207, 'Extended Family', 'Kevin', 'Winger', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('16-12-2021', 'dd-mm-yyyy'), 'Cancelled', 2090, 1206);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3208, 'External Invitees', 'Rhys', 'Feliciano', to_date('24-01-2021', 'dd-mm-yyyy'), to_date('01-02-2021', 'dd-mm-yyyy'), 'No Response', 2208, 1082);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3209, 'Immediate Family', 'Sydney', 'Pony', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('07-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2075, 1322);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3210, 'External Invitees', 'Marina', 'Hunt', to_date('30-03-2021', 'dd-mm-yyyy'), to_date('12-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2098, 1181);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3211, 'External Invitees', 'Loren', 'Dooley', to_date('24-08-2021', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2013, 1182);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3212, 'Work Colleagues', 'Sharon', 'Hedaya', to_date('04-12-2021', 'dd-mm-yyyy'), to_date('08-08-2021', 'dd-mm-yyyy'), 'Waitlisted', 2203, 1305);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3213, 'External Invitees', 'Ricardo', 'Sedgwick', to_date('29-06-2021', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2040, 1105);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3214, 'Work Colleagues', 'Chuck', 'Begley', to_date('02-12-2021', 'dd-mm-yyyy'), to_date('09-06-2021', 'dd-mm-yyyy'), 'Declined', 2055, 1352);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3215, 'Acquaintances', 'Pete', 'Rapaport', to_date('15-08-2021', 'dd-mm-yyyy'), to_date('02-08-2021', 'dd-mm-yyyy'), 'Waitlisted', 2328, 1191);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3216, 'Neighbors', 'Andrew', 'Martin', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('10-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2308, 1235);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3217, 'Extended Family', 'Howard', 'Theron', to_date('01-02-2021', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2055, 1382);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3218, 'Neighbors', 'Kay', 'Stills', to_date('05-10-2021', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'), 'Cancelled', 2111, 1352);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3219, 'External Invitees', 'Benicio', 'Cassidy', to_date('13-07-2021', 'dd-mm-yyyy'), to_date('14-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2388, 1150);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3220, 'Close Friends', 'Stellan', 'Bridges', to_date('31-03-2021', 'dd-mm-yyyy'), to_date('26-11-2021', 'dd-mm-yyyy'), 'Declined', 2090, 1061);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3221, 'Close Friends', 'Corey', 'Pride', to_date('16-12-2021', 'dd-mm-yyyy'), to_date('02-01-2021', 'dd-mm-yyyy'), 'No Response', 2251, 1161);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3222, 'Friends', 'Harvey', 'Yankovic', to_date('30-04-2021', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 'No Response', 2112, 1159);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3223, 'Immediate Family', 'Trick', 'Roth', to_date('17-03-2021', 'dd-mm-yyyy'), to_date('27-01-2021', 'dd-mm-yyyy'), 'Declined', 2104, 1358);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3224, 'Friends', 'Rosario', 'Heslov', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('19-04-2021', 'dd-mm-yyyy'), 'No Response', 2272, 1151);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3225, 'Acquaintances', 'Wayman', 'Piven', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2116, 1031);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3226, 'Immediate Family', 'Goldie', 'O''Sullivan', to_date('10-05-2021', 'dd-mm-yyyy'), to_date('03-02-2021', 'dd-mm-yyyy'), 'Declined', 2259, 1332);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3227, 'Neighbors', 'Boyd', 'Neill', to_date('28-08-2021', 'dd-mm-yyyy'), to_date('29-10-2021', 'dd-mm-yyyy'), 'No Response', 2341, 1295);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3228, 'Acquaintances', 'Bradley', 'Bonneville', to_date('12-05-2021', 'dd-mm-yyyy'), to_date('13-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2336, 1256);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3229, 'Work Colleagues', 'Sylvester', 'Sweeney', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('01-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2094, 1163);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3230, 'Friends', 'Sally', 'Field', to_date('28-05-2021', 'dd-mm-yyyy'), to_date('09-10-2021', 'dd-mm-yyyy'), '''Plus One''.', 2311, 1014);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3231, 'External Invitees', 'Lena', 'Gertner', to_date('22-10-2021', 'dd-mm-yyyy'), to_date('15-06-2021', 'dd-mm-yyyy'), 'Cancelled', 2122, 1222);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3232, 'Work Colleagues', 'Rachid', 'Shaye', to_date('30-09-2021', 'dd-mm-yyyy'), to_date('18-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2117, 1307);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3233, 'Extended Family', 'Isabella', 'Warden', to_date('27-07-2021', 'dd-mm-yyyy'), to_date('07-08-2021', 'dd-mm-yyyy'), 'Declined', 2385, 1308);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3234, 'Close Friends', 'Benjamin', 'Hoffman', to_date('20-04-2021', 'dd-mm-yyyy'), to_date('01-02-2021', 'dd-mm-yyyy'), 'Confirmed', 2382, 1125);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3235, 'Close Friends', 'Nils', 'Carrey', to_date('29-06-2021', 'dd-mm-yyyy'), to_date('13-02-2021', 'dd-mm-yyyy'), 'Declined', 2225, 1381);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3236, 'Neighbors', 'Oro', 'Lavigne', to_date('29-01-2021', 'dd-mm-yyyy'), to_date('08-12-2021', 'dd-mm-yyyy'), 'Declined', 2208, 1016);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3237, 'Immediate Family', 'First', 'De Almeida', to_date('21-01-2021', 'dd-mm-yyyy'), to_date('28-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2145, 1199);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3238, 'Neighbors', 'Brothers', 'Patillo', to_date('05-09-2021', 'dd-mm-yyyy'), to_date('28-08-2021', 'dd-mm-yyyy'), 'No Response', 2142, 1168);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3239, 'External Invitees', 'Elizabeth', 'Tripplehorn', to_date('24-08-2021', 'dd-mm-yyyy'), to_date('03-01-2021', 'dd-mm-yyyy'), 'No Response', 2384, 1196);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3240, 'Work Colleagues', 'Night', 'Bugnon', to_date('11-04-2021', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2357, 1078);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3241, 'Immediate Family', 'Ned', 'Pantoliano', to_date('31-07-2021', 'dd-mm-yyyy'), to_date('15-09-2021', 'dd-mm-yyyy'), 'No Response', 2289, 1351);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3242, 'Neighbors', 'Roy', 'Vanian', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('12-08-2021', 'dd-mm-yyyy'), 'Declined', 2019, 1230);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3243, 'Extended Family', 'Edwin', 'de Lancie', to_date('12-11-2021', 'dd-mm-yyyy'), to_date('26-04-2021', 'dd-mm-yyyy'), 'No Response', 2091, 1271);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3244, 'Extended Family', 'Earl', 'Rizzo', to_date('10-08-2021', 'dd-mm-yyyy'), to_date('17-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2270, 1168);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3245, 'Neighbors', 'Andrew', 'Underwood', to_date('04-04-2021', 'dd-mm-yyyy'), to_date('12-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2284, 1059);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3246, 'Neighbors', 'Victoria', 'Burke', to_date('18-12-2021', 'dd-mm-yyyy'), to_date('08-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2396, 1174);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3247, 'Neighbors', 'Arnold', 'Diesel', to_date('24-02-2021', 'dd-mm-yyyy'), to_date('07-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2193, 1393);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3248, 'Work Colleagues', 'Rachid', 'Ripley', to_date('17-08-2021', 'dd-mm-yyyy'), to_date('21-06-2021', 'dd-mm-yyyy'), 'Declined', 2007, 1141);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3249, 'Immediate Family', 'Brenda', 'Crowe', to_date('21-12-2021', 'dd-mm-yyyy'), to_date('09-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2156, 1200);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3250, 'Immediate Family', 'Anna', 'Fonda', to_date('06-05-2021', 'dd-mm-yyyy'), to_date('16-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2011, 1049);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3251, 'Friends', 'Garry', 'Rush', to_date('30-09-2021', 'dd-mm-yyyy'), to_date('29-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2093, 1329);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3252, 'External Invitees', 'Jared', 'Levert', to_date('29-01-2021', 'dd-mm-yyyy'), to_date('16-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2387, 1036);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3253, 'Neighbors', 'Wendy', 'Heston', to_date('21-02-2021', 'dd-mm-yyyy'), to_date('02-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2087, 1031);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3254, 'Close Friends', 'Jim', 'Roundtree', to_date('07-01-2021', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2362, 1082);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3255, 'Immediate Family', 'Boz', 'Frampton', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('02-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2152, 1228);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3256, 'Immediate Family', 'Emily', 'Mazar', to_date('15-01-2021', 'dd-mm-yyyy'), to_date('07-09-2021', 'dd-mm-yyyy'), 'No Response', 2184, 1072);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3257, 'Acquaintances', 'Caroline', 'Biel', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('20-02-2021', 'dd-mm-yyyy'), 'No Response', 2014, 1392);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3258, 'Acquaintances', 'Hector', 'Taha', to_date('01-01-2021', 'dd-mm-yyyy'), to_date('31-12-2021', 'dd-mm-yyyy'), 'No Response', 2099, 1283);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3259, 'Friends', 'Nicolas', 'Vaughn', to_date('06-10-2021', 'dd-mm-yyyy'), to_date('22-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2084, 1219);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3260, 'Neighbors', 'Curtis', 'Newton', to_date('15-05-2021', 'dd-mm-yyyy'), to_date('11-08-2021', 'dd-mm-yyyy'), '''Plus One''.', 2126, 1249);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3261, 'Friends', 'Emm', 'Gore', to_date('17-03-2021', 'dd-mm-yyyy'), to_date('13-02-2021', 'dd-mm-yyyy'), 'Confirmed', 2032, 1104);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3262, 'Neighbors', 'Shawn', 'Cleary', to_date('13-11-2021', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2231, 1042);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3263, 'Friends', 'Russell', 'Hanks', to_date('20-12-2021', 'dd-mm-yyyy'), to_date('05-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2163, 1014);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3264, 'Immediate Family', 'Shirley', 'Margolyes', to_date('26-06-2021', 'dd-mm-yyyy'), to_date('14-11-2021', 'dd-mm-yyyy'), 'Declined', 2101, 1347);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3265, 'Neighbors', 'Larry', 'Borgnine', to_date('12-07-2021', 'dd-mm-yyyy'), to_date('26-05-2021', 'dd-mm-yyyy'), 'No Response', 2391, 1367);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3266, 'Friends', 'Praga', 'Donelly', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'), '''Plus One''.', 2122, 1133);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3267, 'Extended Family', 'Judi', 'Avalon', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('26-02-2021', 'dd-mm-yyyy'), 'Waitlisted', 2016, 1104);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3268, 'Immediate Family', 'Roger', 'Flanagan', to_date('07-01-2021', 'dd-mm-yyyy'), to_date('11-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2351, 1330);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3269, 'Work Colleagues', 'Gaby', 'Peterson', to_date('24-01-2021', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 'No Response', 2297, 1365);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3270, 'External Invitees', 'Penelope', 'Weiland', to_date('24-10-2021', 'dd-mm-yyyy'), to_date('18-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2293, 1307);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3271, 'Extended Family', 'Wendy', 'Tripplehorn', to_date('29-09-2021', 'dd-mm-yyyy'), to_date('22-04-2021', 'dd-mm-yyyy'), 'Declined', 2229, 1164);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3272, 'Friends', 'Heather', 'Zappacosta', to_date('23-03-2021', 'dd-mm-yyyy'), to_date('03-11-2021', 'dd-mm-yyyy'), 'Waitlisted', 2274, 1342);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3273, 'Close Friends', 'Grace', 'Feuerstein', to_date('07-09-2021', 'dd-mm-yyyy'), to_date('23-01-2021', 'dd-mm-yyyy'), 'Waitlisted', 2314, 1063);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3274, 'Extended Family', 'Gilbert', 'de Lancie', to_date('24-03-2021', 'dd-mm-yyyy'), to_date('30-03-2021', 'dd-mm-yyyy'), 'Cancelled', 2020, 1101);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3275, 'Close Friends', 'Whoopi', 'Pepper', to_date('05-04-2021', 'dd-mm-yyyy'), to_date('13-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2342, 1248);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3276, 'Work Colleagues', 'Penelope', 'Tempest', to_date('08-05-2021', 'dd-mm-yyyy'), to_date('26-07-2021', 'dd-mm-yyyy'), 'Waitlisted', 2027, 1308);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3277, 'External Invitees', 'Pablo', 'Milsap', to_date('29-04-2021', 'dd-mm-yyyy'), to_date('05-08-2021', 'dd-mm-yyyy'), 'Declined', 2361, 1205);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3278, 'Friends', 'Steve', 'Cartlidge', to_date('19-01-2021', 'dd-mm-yyyy'), to_date('21-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2138, 1028);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3279, 'Neighbors', 'Jude', 'Oszajca', to_date('16-01-2021', 'dd-mm-yyyy'), to_date('05-09-2021', 'dd-mm-yyyy'), 'Confirmed', 2053, 1393);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3280, 'External Invitees', 'Terri', 'Hedaya', to_date('13-12-2021', 'dd-mm-yyyy'), to_date('28-08-2021', 'dd-mm-yyyy'), 'Declined', 2119, 1334);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3281, 'Close Friends', 'Rutger', 'Arkin', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('20-09-2021', 'dd-mm-yyyy'), 'Declined', 2112, 1319);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3282, 'Close Friends', 'Laurie', 'Tinsley', to_date('26-01-2021', 'dd-mm-yyyy'), to_date('11-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2235, 1387);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3283, 'External Invitees', 'Rene', 'Salonga', to_date('21-07-2021', 'dd-mm-yyyy'), to_date('06-08-2021', 'dd-mm-yyyy'), 'No Response', 2015, 1215);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3284, 'Extended Family', 'Owen', 'Belle', to_date('09-10-2021', 'dd-mm-yyyy'), to_date('29-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2219, 1308);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3285, 'Extended Family', 'Humberto', 'Loggia', to_date('28-02-2021', 'dd-mm-yyyy'), to_date('21-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2199, 1312);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3286, 'External Invitees', 'Gavin', 'Thomson', to_date('04-02-2021', 'dd-mm-yyyy'), to_date('16-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2257, 1055);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3287, 'Work Colleagues', 'Kurtwood', 'Navarro', to_date('26-02-2021', 'dd-mm-yyyy'), to_date('26-02-2021', 'dd-mm-yyyy'), 'No Response', 2237, 1114);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3288, 'Close Friends', 'Ryan', 'Lyonne', to_date('26-08-2021', 'dd-mm-yyyy'), to_date('18-08-2021', 'dd-mm-yyyy'), 'Waitlisted', 2351, 1298);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3289, 'Neighbors', 'Jude', 'Savage', to_date('22-09-2021', 'dd-mm-yyyy'), to_date('21-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2211, 1073);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3290, 'Immediate Family', 'Anthony', 'Mollard', to_date('02-09-2021', 'dd-mm-yyyy'), to_date('03-05-2021', 'dd-mm-yyyy'), 'Cancelled', 2105, 1093);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3291, 'Immediate Family', 'Nicholas', 'Imbruglia', to_date('19-12-2021', 'dd-mm-yyyy'), to_date('29-09-2021', 'dd-mm-yyyy'), '''Plus One''.', 2087, 1068);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3292, 'Immediate Family', 'Patrick', 'Peebles', to_date('31-07-2021', 'dd-mm-yyyy'), to_date('27-08-2021', 'dd-mm-yyyy'), 'No Response', 2094, 1156);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3293, 'Acquaintances', 'Johnette', 'Carnes', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('12-11-2021', 'dd-mm-yyyy'), 'Confirmed', 2291, 1274);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3294, 'Immediate Family', 'Grant', 'Plummer', to_date('04-08-2021', 'dd-mm-yyyy'), to_date('30-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2039, 1140);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3295, 'External Invitees', 'Lonnie', 'Belles', to_date('12-10-2021', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2285, 1040);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3296, 'Neighbors', 'Pelvic', 'Jones', to_date('14-05-2021', 'dd-mm-yyyy'), to_date('27-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2185, 1312);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3297, 'Acquaintances', 'Avenged', 'Janney', to_date('14-11-2021', 'dd-mm-yyyy'), to_date('25-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2340, 1365);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3298, 'Work Colleagues', 'Pierce', 'Weber', to_date('05-01-2021', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'), 'No Response', 2272, 1020);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3299, 'Work Colleagues', 'Robert', 'Adams', to_date('17-07-2021', 'dd-mm-yyyy'), to_date('21-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2111, 1371);
commit;
prompt 300 records committed...
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3300, 'Close Friends', 'Aida', 'Wakeling', to_date('23-12-2021', 'dd-mm-yyyy'), to_date('29-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2116, 1178);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3301, 'External Invitees', 'Frankie', 'Gates', to_date('13-03-2021', 'dd-mm-yyyy'), to_date('30-09-2021', 'dd-mm-yyyy'), 'Declined', 2014, 1180);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3302, 'Extended Family', 'Kurtwood', 'Englund', to_date('17-07-2021', 'dd-mm-yyyy'), to_date('05-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2175, 1135);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3303, 'External Invitees', 'Gavin', 'Holm', to_date('09-07-2021', 'dd-mm-yyyy'), to_date('17-10-2021', 'dd-mm-yyyy'), 'No Response', 2199, 1186);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3304, 'External Invitees', 'Julie', 'Herrmann', to_date('06-10-2021', 'dd-mm-yyyy'), to_date('17-07-2021', 'dd-mm-yyyy'), 'Declined', 2135, 1150);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3305, 'Neighbors', 'Lois', 'Ali', to_date('20-07-2021', 'dd-mm-yyyy'), to_date('08-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2326, 1332);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3306, 'Neighbors', 'Ruth', 'Reinhold', to_date('04-02-2021', 'dd-mm-yyyy'), to_date('10-04-2021', 'dd-mm-yyyy'), 'Waitlisted', 2276, 1269);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3307, 'Immediate Family', 'Jay', 'Brock', to_date('06-12-2021', 'dd-mm-yyyy'), to_date('06-09-2021', 'dd-mm-yyyy'), 'Declined', 2140, 1188);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3308, 'Acquaintances', 'Alan', 'Daniels', to_date('13-10-2021', 'dd-mm-yyyy'), to_date('12-05-2021', 'dd-mm-yyyy'), 'Confirmed', 2049, 1001);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3309, 'Immediate Family', 'Linda', 'Gandolfini', to_date('26-06-2021', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 'Confirmed', 2046, 1218);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3310, 'Close Friends', 'Maura', 'Masur', to_date('24-02-2021', 'dd-mm-yyyy'), to_date('26-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2256, 1389);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3311, 'Neighbors', 'Olga', 'Karyo', to_date('03-05-2021', 'dd-mm-yyyy'), to_date('07-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2082, 1264);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3312, 'Immediate Family', 'Collective', 'Torino', to_date('24-01-2021', 'dd-mm-yyyy'), to_date('10-05-2021', 'dd-mm-yyyy'), 'No Response', 2019, 1089);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3313, 'Acquaintances', 'Forest', 'Sainte-Marie', to_date('24-08-2021', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2098, 1014);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3314, 'Acquaintances', 'Nikka', 'Branch', to_date('30-11-2021', 'dd-mm-yyyy'), to_date('23-02-2021', 'dd-mm-yyyy'), 'Declined', 2156, 1241);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3315, 'Work Colleagues', 'Cevin', 'McDonnell', to_date('28-09-2021', 'dd-mm-yyyy'), to_date('12-07-2021', 'dd-mm-yyyy'), 'No Response', 2327, 1282);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3316, 'External Invitees', 'Juan', 'Child', to_date('17-11-2021', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 'Declined', 2161, 1150);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3317, 'Work Colleagues', 'Cate', 'Lovitz', to_date('18-02-2021', 'dd-mm-yyyy'), to_date('07-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2364, 1278);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3318, 'Immediate Family', 'Neneh', 'Russo', to_date('27-03-2021', 'dd-mm-yyyy'), to_date('08-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2371, 1155);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3319, 'Extended Family', 'Vendetta', 'Coolidge', to_date('20-05-2021', 'dd-mm-yyyy'), to_date('18-06-2021', 'dd-mm-yyyy'), 'Cancelled', 2136, 1090);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3320, 'Work Colleagues', 'Clint', 'Reid', to_date('27-07-2021', 'dd-mm-yyyy'), to_date('27-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2149, 1105);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3321, 'Friends', 'Patty', 'Glenn', to_date('17-07-2021', 'dd-mm-yyyy'), to_date('15-03-2021', 'dd-mm-yyyy'), 'Declined', 2082, 1350);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3322, 'Work Colleagues', 'Ann', 'Fiennes', to_date('28-10-2021', 'dd-mm-yyyy'), to_date('16-01-2021', 'dd-mm-yyyy'), '''Plus One''.', 2054, 1238);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3323, 'Work Colleagues', 'Rachel', 'McGovern', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('31-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2125, 1317);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3324, 'Work Colleagues', 'Howie', 'Nightingale', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('09-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2015, 1053);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3325, 'External Invitees', 'Cate', 'Nelson', to_date('05-02-2021', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'), '''Plus One''.', 2246, 1349);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3326, 'Extended Family', 'Allison', 'Hawthorne', to_date('22-11-2021', 'dd-mm-yyyy'), to_date('07-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2311, 1383);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3327, 'Extended Family', 'Jude', 'Sepulveda', to_date('20-09-2021', 'dd-mm-yyyy'), to_date('01-12-2021', 'dd-mm-yyyy'), 'Cancelled', 2265, 1375);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3328, 'External Invitees', 'Beth', 'Wainwright', to_date('10-04-2021', 'dd-mm-yyyy'), to_date('03-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2143, 1275);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3329, 'Immediate Family', 'Mia', 'Koteas', to_date('31-07-2021', 'dd-mm-yyyy'), to_date('14-04-2021', 'dd-mm-yyyy'), 'Declined', 2007, 1377);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3330, 'Acquaintances', 'Phil', 'Williamson', to_date('07-01-2021', 'dd-mm-yyyy'), to_date('01-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2208, 1261);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3331, 'Acquaintances', 'Hank', 'Klugh', to_date('12-12-2021', 'dd-mm-yyyy'), to_date('03-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2285, 1057);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3332, 'Acquaintances', 'Willem', 'Spiner', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('06-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2077, 1034);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3333, 'Acquaintances', 'Vern', 'Masur', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('05-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2271, 1117);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3334, 'Immediate Family', 'Cheryl', 'Brock', to_date('08-02-2021', 'dd-mm-yyyy'), to_date('25-12-2021', 'dd-mm-yyyy'), 'Declined', 2366, 1125);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3335, 'Acquaintances', 'Adam', 'Stamp', to_date('10-09-2021', 'dd-mm-yyyy'), to_date('28-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2070, 1335);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3336, 'Acquaintances', 'Pamela', 'Rifkin', to_date('27-03-2021', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'), 'Declined', 2115, 1374);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3337, 'Acquaintances', 'Anne', 'Donelly', to_date('05-12-2021', 'dd-mm-yyyy'), to_date('06-07-2021', 'dd-mm-yyyy'), 'Confirmed', 2100, 1035);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3338, 'External Invitees', 'Adrien', 'Walken', to_date('29-04-2021', 'dd-mm-yyyy'), to_date('22-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2161, 1010);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3339, 'Extended Family', 'Emm', 'Steenburgen', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('12-03-2021', 'dd-mm-yyyy'), 'No Response', 2061, 1165);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3340, 'Friends', 'Patricia', 'Colman', to_date('15-04-2021', 'dd-mm-yyyy'), to_date('13-08-2021', 'dd-mm-yyyy'), 'Confirmed', 2112, 1121);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3341, 'Neighbors', 'Devon', 'Latifah', to_date('09-10-2021', 'dd-mm-yyyy'), to_date('09-11-2021', 'dd-mm-yyyy'), 'Cancelled', 2315, 1174);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3342, 'Friends', 'Stanley', 'Spector', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('31-07-2021', 'dd-mm-yyyy'), '''Plus One''.', 2126, 1132);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3343, 'External Invitees', 'Joaquim', 'Beck', to_date('28-06-2021', 'dd-mm-yyyy'), to_date('18-06-2021', 'dd-mm-yyyy'), 'Declined', 2055, 1082);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3344, 'External Invitees', 'Dorry', 'Rain', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('05-07-2021', 'dd-mm-yyyy'), 'No Response', 2280, 1280);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3345, 'Friends', 'Colleen', 'Warwick', to_date('30-07-2021', 'dd-mm-yyyy'), to_date('24-06-2021', 'dd-mm-yyyy'), 'Cancelled', 2289, 1161);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3346, 'Extended Family', 'Davey', 'Fichtner', to_date('16-05-2021', 'dd-mm-yyyy'), to_date('05-05-2021', 'dd-mm-yyyy'), 'Declined', 2351, 1087);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3347, 'Friends', 'Beverley', 'Miller', to_date('03-01-2021', 'dd-mm-yyyy'), to_date('23-10-2021', 'dd-mm-yyyy'), 'Waitlisted', 2006, 1205);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3348, 'Close Friends', 'Hal', 'DiCaprio', to_date('24-08-2021', 'dd-mm-yyyy'), to_date('06-12-2021', 'dd-mm-yyyy'), '''Plus One''.', 2386, 1039);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3349, 'Acquaintances', 'Shelby', 'Starr', to_date('30-05-2021', 'dd-mm-yyyy'), to_date('28-09-2021', 'dd-mm-yyyy'), 'No Response', 2356, 1006);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3350, 'Extended Family', 'Dionne', 'Swayze', to_date('08-02-2021', 'dd-mm-yyyy'), to_date('23-12-2021', 'dd-mm-yyyy'), 'No Response', 2081, 1055);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3351, 'Extended Family', 'Annie', 'Harrison', to_date('25-08-2021', 'dd-mm-yyyy'), to_date('11-11-2021', 'dd-mm-yyyy'), 'Waitlisted', 2023, 1231);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3352, 'Work Colleagues', 'Willie', 'Moriarty', to_date('02-04-2021', 'dd-mm-yyyy'), to_date('14-12-2021', 'dd-mm-yyyy'), 'Waitlisted', 2154, 1367);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3353, 'Work Colleagues', 'Loreena', 'Chandler', to_date('21-04-2021', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2202, 1096);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3354, 'Immediate Family', 'Armand', 'Gugino', to_date('24-10-2021', 'dd-mm-yyyy'), to_date('21-01-2021', 'dd-mm-yyyy'), 'Confirmed', 2119, 1394);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3355, 'Neighbors', 'Lloyd', 'Sisto', to_date('08-02-2021', 'dd-mm-yyyy'), to_date('04-04-2021', 'dd-mm-yyyy'), 'Declined', 2372, 1241);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3356, 'Work Colleagues', 'Sharon', 'Weller', to_date('05-02-2021', 'dd-mm-yyyy'), to_date('23-02-2021', 'dd-mm-yyyy'), 'Waitlisted', 2064, 1015);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3357, 'Immediate Family', 'Wade', 'Gates', to_date('22-09-2021', 'dd-mm-yyyy'), to_date('21-09-2021', 'dd-mm-yyyy'), 'Confirmed', 2072, 1003);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3358, 'Acquaintances', 'Lance', 'Neill', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('02-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2022, 1045);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3359, 'Extended Family', 'Debra', 'Broderick', to_date('27-07-2021', 'dd-mm-yyyy'), to_date('23-08-2021', 'dd-mm-yyyy'), 'No Response', 2276, 1295);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3360, 'Work Colleagues', 'Lee', 'Karyo', to_date('22-11-2021', 'dd-mm-yyyy'), to_date('10-08-2021', 'dd-mm-yyyy'), 'Cancelled', 2152, 1313);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3361, 'Acquaintances', 'Aaron', 'Morrison', to_date('10-06-2021', 'dd-mm-yyyy'), to_date('30-03-2021', 'dd-mm-yyyy'), 'No Response', 2367, 1078);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3362, 'Work Colleagues', 'Jeanne', 'Rankin', to_date('28-07-2021', 'dd-mm-yyyy'), to_date('31-05-2021', 'dd-mm-yyyy'), 'No Response', 2106, 1131);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3363, 'Work Colleagues', 'Selma', 'Torino', to_date('30-03-2021', 'dd-mm-yyyy'), to_date('09-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2313, 1036);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3364, 'Extended Family', 'Jimmy', 'Klugh', to_date('21-08-2021', 'dd-mm-yyyy'), to_date('12-12-2021', 'dd-mm-yyyy'), 'No Response', 2010, 1374);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3365, 'Immediate Family', 'Tyrone', 'Smurfit', to_date('12-01-2021', 'dd-mm-yyyy'), to_date('06-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2042, 1253);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3366, 'Extended Family', 'First', 'Simpson', to_date('13-06-2021', 'dd-mm-yyyy'), to_date('29-05-2021', 'dd-mm-yyyy'), 'Waitlisted', 2239, 1354);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3367, 'Immediate Family', 'Nancy', 'Paquin', to_date('25-03-2021', 'dd-mm-yyyy'), to_date('29-01-2021', 'dd-mm-yyyy'), 'Cancelled', 2017, 1288);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3368, 'Work Colleagues', 'Rhys', 'Leto', to_date('12-10-2021', 'dd-mm-yyyy'), to_date('15-04-2021', 'dd-mm-yyyy'), 'Declined', 2388, 1292);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3369, 'Extended Family', 'Jeremy', 'Jovovich', to_date('29-12-2021', 'dd-mm-yyyy'), to_date('25-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2210, 1044);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3370, 'Work Colleagues', 'Kirsten', 'Dillane', to_date('17-07-2021', 'dd-mm-yyyy'), to_date('14-04-2021', 'dd-mm-yyyy'), 'No Response', 2250, 1199);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3371, 'Friends', 'Derrick', 'Jackman', to_date('25-07-2021', 'dd-mm-yyyy'), to_date('06-07-2021', 'dd-mm-yyyy'), 'Declined', 2280, 1254);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3372, 'Friends', 'Marie', 'Crouch', to_date('15-06-2021', 'dd-mm-yyyy'), to_date('08-04-2021', 'dd-mm-yyyy'), 'Confirmed', 2391, 1343);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3373, 'Immediate Family', 'Jared', 'Matarazzo', to_date('01-07-2021', 'dd-mm-yyyy'), to_date('03-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2142, 1146);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3374, 'Close Friends', 'Gavin', 'Hudson', to_date('21-07-2021', 'dd-mm-yyyy'), to_date('11-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2322, 1132);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3375, 'Acquaintances', 'Harvey', 'Stuart', to_date('22-02-2021', 'dd-mm-yyyy'), to_date('14-09-2021', 'dd-mm-yyyy'), 'Declined', 2148, 1322);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3376, 'Close Friends', 'Roberta', 'Flatts', to_date('09-07-2021', 'dd-mm-yyyy'), to_date('18-01-2021', 'dd-mm-yyyy'), 'No Response', 2279, 1183);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3377, 'Acquaintances', 'Claude', 'Visnjic', to_date('23-10-2021', 'dd-mm-yyyy'), to_date('29-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2061, 1035);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3378, 'External Invitees', 'Pete', 'Williamson', to_date('02-12-2021', 'dd-mm-yyyy'), to_date('17-10-2021', 'dd-mm-yyyy'), 'No Response', 2194, 1000);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3379, 'Acquaintances', 'Ethan', 'Fishburne', to_date('27-07-2021', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), '''Plus One''.', 2026, 1059);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3380, 'Friends', 'Beverley', 'Richards', to_date('27-03-2021', 'dd-mm-yyyy'), to_date('19-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2271, 1048);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3381, 'Friends', 'Ernest', 'Walken', to_date('08-04-2021', 'dd-mm-yyyy'), to_date('01-09-2021', 'dd-mm-yyyy'), 'Cancelled', 2350, 1369);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3382, 'Immediate Family', 'Miki', 'Morrison', to_date('26-11-2021', 'dd-mm-yyyy'), to_date('09-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2361, 1231);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3383, 'Neighbors', 'Junior', 'Parish', to_date('12-05-2021', 'dd-mm-yyyy'), to_date('18-04-2021', 'dd-mm-yyyy'), '''Plus One''.', 2073, 1213);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3384, 'Close Friends', 'Vienna', 'Miles', to_date('18-11-2021', 'dd-mm-yyyy'), to_date('16-03-2021', 'dd-mm-yyyy'), 'Confirmed', 2140, 1360);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3385, 'External Invitees', 'Nicky', 'Moorer', to_date('15-08-2021', 'dd-mm-yyyy'), to_date('16-08-2021', 'dd-mm-yyyy'), 'No Response', 2346, 1188);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3386, 'Friends', 'Rade', 'Duke', to_date('03-07-2021', 'dd-mm-yyyy'), to_date('25-04-2021', 'dd-mm-yyyy'), 'Cancelled', 2077, 1234);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3387, 'External Invitees', 'Sal', 'Michael', to_date('13-11-2021', 'dd-mm-yyyy'), to_date('16-03-2021', 'dd-mm-yyyy'), '''Plus One''.', 2205, 1315);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3388, 'Extended Family', 'Roscoe', 'Berenger', to_date('04-09-2021', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 'Confirmed', 2016, 1116);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3389, 'Immediate Family', 'Moe', 'Nelson', to_date('01-03-2021', 'dd-mm-yyyy'), to_date('17-09-2021', 'dd-mm-yyyy'), 'Waitlisted', 2344, 1112);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3390, 'Immediate Family', 'Louise', 'Tempest', to_date('31-03-2021', 'dd-mm-yyyy'), to_date('21-02-2021', 'dd-mm-yyyy'), '''Plus One''.', 2147, 1002);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3391, 'Friends', 'Juliette', 'Garcia', to_date('20-06-2021', 'dd-mm-yyyy'), to_date('20-11-2021', 'dd-mm-yyyy'), 'No Response', 2094, 1274);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3392, 'External Invitees', 'Selma', 'Jessee', to_date('10-10-2021', 'dd-mm-yyyy'), to_date('27-04-2021', 'dd-mm-yyyy'), 'Declined', 2385, 1099);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3393, 'Work Colleagues', 'Richie', 'Foxx', to_date('08-11-2021', 'dd-mm-yyyy'), to_date('20-06-2021', 'dd-mm-yyyy'), 'No Response', 2394, 1343);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3394, 'Friends', 'Julianne', 'Paul', to_date('25-03-2021', 'dd-mm-yyyy'), to_date('22-06-2021', 'dd-mm-yyyy'), 'Declined', 2138, 1104);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3395, 'Extended Family', 'Victoria', 'Price', to_date('29-04-2021', 'dd-mm-yyyy'), to_date('18-02-2021', 'dd-mm-yyyy'), 'Declined', 2369, 1384);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3396, 'Friends', 'Bo', 'Dourif', to_date('29-05-2021', 'dd-mm-yyyy'), to_date('24-06-2021', 'dd-mm-yyyy'), 'Declined', 2090, 1072);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3397, 'Acquaintances', 'Vondie', 'McGoohan', to_date('16-07-2021', 'dd-mm-yyyy'), to_date('10-06-2021', 'dd-mm-yyyy'), 'Waitlisted', 2302, 1263);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3398, 'Neighbors', 'Mika', 'Visnjic', to_date('12-11-2021', 'dd-mm-yyyy'), to_date('22-07-2021', 'dd-mm-yyyy'), 'Cancelled', 2370, 1095);
insert into GUSTS (gustid, relationshiplevel, firstname, lastname, invitationdate, confirmationdate, rsvpstatus, eventid, customerid)
values (3399, 'Friends', 'Ben', 'Foxx', to_date('23-08-2021', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'), 'Confirmed', 2214, 1118);
commit;
prompt 400 records loaded
prompt Loading HAS_CATERING...
insert into HAS_CATERING (cateringid, eventid)
values (1, 2158);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2186);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2228);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2249);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2296);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2310);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2355);
insert into HAS_CATERING (cateringid, eventid)
values (1, 2386);
insert into HAS_CATERING (cateringid, eventid)
values (2, 2013);
insert into HAS_CATERING (cateringid, eventid)
values (2, 2333);
insert into HAS_CATERING (cateringid, eventid)
values (2, 2397);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2062);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2158);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2177);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2195);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2305);
insert into HAS_CATERING (cateringid, eventid)
values (3, 2342);
insert into HAS_CATERING (cateringid, eventid)
values (4, 2073);
insert into HAS_CATERING (cateringid, eventid)
values (4, 2115);
insert into HAS_CATERING (cateringid, eventid)
values (4, 2256);
insert into HAS_CATERING (cateringid, eventid)
values (4, 2330);
insert into HAS_CATERING (cateringid, eventid)
values (5, 2214);
insert into HAS_CATERING (cateringid, eventid)
values (5, 2336);
insert into HAS_CATERING (cateringid, eventid)
values (5, 2347);
insert into HAS_CATERING (cateringid, eventid)
values (6, 2129);
insert into HAS_CATERING (cateringid, eventid)
values (6, 2152);
insert into HAS_CATERING (cateringid, eventid)
values (6, 2214);
insert into HAS_CATERING (cateringid, eventid)
values (7, 2021);
insert into HAS_CATERING (cateringid, eventid)
values (7, 2298);
insert into HAS_CATERING (cateringid, eventid)
values (7, 2302);
insert into HAS_CATERING (cateringid, eventid)
values (7, 2321);
insert into HAS_CATERING (cateringid, eventid)
values (8, 2195);
insert into HAS_CATERING (cateringid, eventid)
values (8, 2218);
insert into HAS_CATERING (cateringid, eventid)
values (8, 2317);
insert into HAS_CATERING (cateringid, eventid)
values (9, 2087);
insert into HAS_CATERING (cateringid, eventid)
values (9, 2140);
insert into HAS_CATERING (cateringid, eventid)
values (9, 2240);
insert into HAS_CATERING (cateringid, eventid)
values (10, 2216);
insert into HAS_CATERING (cateringid, eventid)
values (11, 2159);
insert into HAS_CATERING (cateringid, eventid)
values (11, 2234);
insert into HAS_CATERING (cateringid, eventid)
values (11, 2331);
insert into HAS_CATERING (cateringid, eventid)
values (11, 2382);
insert into HAS_CATERING (cateringid, eventid)
values (12, 2095);
insert into HAS_CATERING (cateringid, eventid)
values (12, 2135);
insert into HAS_CATERING (cateringid, eventid)
values (12, 2396);
insert into HAS_CATERING (cateringid, eventid)
values (13, 2113);
insert into HAS_CATERING (cateringid, eventid)
values (13, 2257);
insert into HAS_CATERING (cateringid, eventid)
values (13, 2389);
insert into HAS_CATERING (cateringid, eventid)
values (14, 2065);
insert into HAS_CATERING (cateringid, eventid)
values (14, 2280);
insert into HAS_CATERING (cateringid, eventid)
values (15, 2021);
insert into HAS_CATERING (cateringid, eventid)
values (16, 2003);
insert into HAS_CATERING (cateringid, eventid)
values (16, 2008);
insert into HAS_CATERING (cateringid, eventid)
values (16, 2344);
insert into HAS_CATERING (cateringid, eventid)
values (17, 2071);
insert into HAS_CATERING (cateringid, eventid)
values (17, 2148);
insert into HAS_CATERING (cateringid, eventid)
values (18, 2185);
insert into HAS_CATERING (cateringid, eventid)
values (18, 2208);
insert into HAS_CATERING (cateringid, eventid)
values (18, 2365);
insert into HAS_CATERING (cateringid, eventid)
values (19, 2058);
insert into HAS_CATERING (cateringid, eventid)
values (20, 2024);
insert into HAS_CATERING (cateringid, eventid)
values (20, 2060);
insert into HAS_CATERING (cateringid, eventid)
values (20, 2104);
insert into HAS_CATERING (cateringid, eventid)
values (20, 2179);
insert into HAS_CATERING (cateringid, eventid)
values (21, 2215);
insert into HAS_CATERING (cateringid, eventid)
values (21, 2291);
insert into HAS_CATERING (cateringid, eventid)
values (21, 2333);
insert into HAS_CATERING (cateringid, eventid)
values (21, 2357);
insert into HAS_CATERING (cateringid, eventid)
values (21, 2358);
insert into HAS_CATERING (cateringid, eventid)
values (22, 2057);
insert into HAS_CATERING (cateringid, eventid)
values (22, 2137);
insert into HAS_CATERING (cateringid, eventid)
values (22, 2265);
insert into HAS_CATERING (cateringid, eventid)
values (23, 2208);
insert into HAS_CATERING (cateringid, eventid)
values (23, 2307);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2049);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2054);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2064);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2087);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2169);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2189);
insert into HAS_CATERING (cateringid, eventid)
values (24, 2274);
insert into HAS_CATERING (cateringid, eventid)
values (25, 2107);
insert into HAS_CATERING (cateringid, eventid)
values (25, 2122);
insert into HAS_CATERING (cateringid, eventid)
values (25, 2299);
insert into HAS_CATERING (cateringid, eventid)
values (26, 2168);
insert into HAS_CATERING (cateringid, eventid)
values (26, 2208);
insert into HAS_CATERING (cateringid, eventid)
values (26, 2313);
insert into HAS_CATERING (cateringid, eventid)
values (27, 2139);
insert into HAS_CATERING (cateringid, eventid)
values (27, 2234);
insert into HAS_CATERING (cateringid, eventid)
values (28, 2112);
insert into HAS_CATERING (cateringid, eventid)
values (28, 2125);
insert into HAS_CATERING (cateringid, eventid)
values (28, 2295);
insert into HAS_CATERING (cateringid, eventid)
values (29, 2358);
insert into HAS_CATERING (cateringid, eventid)
values (30, 2251);
insert into HAS_CATERING (cateringid, eventid)
values (30, 2294);
insert into HAS_CATERING (cateringid, eventid)
values (1000, 2022);
insert into HAS_CATERING (cateringid, eventid)
values (1000, 2070);
insert into HAS_CATERING (cateringid, eventid)
values (2000, 2108);
insert into HAS_CATERING (cateringid, eventid)
values (2000, 2286);
insert into HAS_CATERING (cateringid, eventid)
values (2000, 2319);
commit;
prompt 100 records loaded
prompt Loading LOAN...
insert into LOAN (loanid, numofpaymet, loansum)
values (1, 12, 600000);
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
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('18-10-1991', 'dd-mm-yyyy'), 0, 288, 1);
commit;
prompt 100 records committed...
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
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('17-06-1995', 'dd-mm-yyyy'), 1, 173, 2);
commit;
prompt 200 records committed...
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
insert into LOANTOACCOUNT (loandate, returnedornot, loanid, accountid)
values (to_date('03-05-1981', 'dd-mm-yyyy'), 0, 260, 4);
commit;
prompt 300 records committed...
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
prompt 353 records loaded
prompt Enabling foreign key constraints for ACOUNT...
alter table ACOUNT enable constraint SYS_C007110;
prompt Enabling foreign key constraints for EVENTS_...
alter table EVENTS_ enable constraint SYS_C007470;
alter table EVENTS_ enable constraint SYS_C007492;
prompt Enabling foreign key constraints for PAYMENTS...
alter table PAYMENTS enable constraint SYS_C007491;
prompt Enabling foreign key constraints for ACTIONSTOPAYMENTS...
alter table ACTIONSTOPAYMENTS enable constraint SYS_C007565;
alter table ACTIONSTOPAYMENTS enable constraint SYS_C007566;
prompt Enabling foreign key constraints for ACTIVITY...
alter table ACTIVITY enable constraint SYS_C007122;
alter table ACTIVITY enable constraint SYS_C007123;
alter table ACTIVITY enable constraint SYS_C007124;
alter table ACTIVITY enable constraint SYS_C007579;
prompt Enabling foreign key constraints for CUSTOMERSTOCLIENT...
alter table CUSTOMERSTOCLIENT enable constraint SYS_C007548;
alter table CUSTOMERSTOCLIENT enable constraint SYS_C007549;
prompt Enabling foreign key constraints for GUSTS...
alter table GUSTS enable constraint SYS_C007479;
prompt Enabling foreign key constraints for HAS_CATERING...
alter table HAS_CATERING enable constraint SYS_C007483;
alter table HAS_CATERING enable constraint SYS_C007484;
prompt Enabling foreign key constraints for LOANTOACCOUNT...
alter table LOANTOACCOUNT enable constraint SYS_C007135;
alter table LOANTOACCOUNT enable constraint SYS_C007136;
prompt Enabling triggers for BRANCH...
alter table BRANCH enable all triggers;
prompt Enabling triggers for ACOUNT...
alter table ACOUNT enable all triggers;
prompt Enabling triggers for ACTIONS...
alter table ACTIONS enable all triggers;
prompt Enabling triggers for CUSTOMERS...
alter table CUSTOMERS enable all triggers;
prompt Enabling triggers for VENUES...
alter table VENUES enable all triggers;
prompt Enabling triggers for EVENTS_...
alter table EVENTS_ enable all triggers;
prompt Enabling triggers for PAYMENTS...
alter table PAYMENTS enable all triggers;
prompt Enabling triggers for ACTIONSTOPAYMENTS...
alter table ACTIONSTOPAYMENTS enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for ACTIVITY...
alter table ACTIVITY enable all triggers;
prompt Enabling triggers for CATERING...
alter table CATERING enable all triggers;
prompt Enabling triggers for CUSTOMERSTOCLIENT...
alter table CUSTOMERSTOCLIENT enable all triggers;
prompt Enabling triggers for GUSTS...
alter table GUSTS enable all triggers;
prompt Enabling triggers for HAS_CATERING...
alter table HAS_CATERING enable all triggers;
prompt Enabling triggers for LOAN...
alter table LOAN enable all triggers;
prompt Enabling triggers for LOANTOACCOUNT...
alter table LOANTOACCOUNT enable all triggers;
set feedback on
set define on
prompt Done.
