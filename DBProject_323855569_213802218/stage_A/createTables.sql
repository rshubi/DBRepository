CREATE TABLE Client
(
  ClientId NUMERIC(5) NOT NULL,
  ClientName VARCHAR(30) NOT NULL,
  ClientAddress VARCHAR(30) NOT NULL,
  ClientLastName VARCHAR(30) NOT NULL,
  PRIMARY KEY (ClientId)
);

CREATE TABLE Worker
(
  WorkerId INT NOT NULL,
  WorkerName VARCHAR2(30) NOT NULL,
  WorkerBirthDate DATE,
  WorkerRole VARCHAR2(30) NOT NULL,
  PRIMARY KEY (WorkerId)
);

CREATE TABLE Branch
(
  BranchId NUMERIC(5) NOT NULL,
  BranchAddress VARCHAR(30) NOT NULL,
  BranchManager VARCHAR(30) NOT NULL,
  PRIMARY KEY (BranchId)
);

CREATE TABLE Acount
(
  AccountId NUMERIC(5) NOT NULL,
  Balance INT NOT NULL,
  AccountNumber INT NOT NULL,
  BranchId NUMERIC(5) NOT NULL,
  PRIMARY KEY (AccountId),
  FOREIGN KEY (BranchId) REFERENCES Branch(BranchId)
);

CREATE TABLE Actions
(
  ActionId NUMERIC(5) NOT NULL,
  ActionName VARCHAR(30) NOT NULL,
  ActionSum INT NOT NULL,
  ActionDate DATE NOT NULL,
  PRIMARY KEY (ActionId)
);

CREATE TABLE activity
(
  ActivityId NUMERIC(5) NOT NULL,
  ClientId NUMERIC(5) NOT NULL,
  ActionId NUMERIC(5) NOT NULL,
  AccountId NUMERIC(5) NOT NULL,
  WorkerId INT NOT NULL,
  PRIMARY KEY (ActivityId),
  FOREIGN KEY (ClientId) REFERENCES Client(ClientId),
  FOREIGN KEY (ActionId) REFERENCES Actions(ActionId),
  FOREIGN KEY (AccountId) REFERENCES Acount(AccountId),
  FOREIGN KEY (WorkerId) REFERENCES Worker(WorkerId)
);

CREATE TABLE Loan
(
  LoanId NUMERIC(5) NOT NULL,
  NumOfPaymet NUMERIC(5) NOT NULL,
  LoanSum INT NOT NULL,
  PRIMARY KEY (LoanId)
);

CREATE TABLE LoanToAccount
(
  LoanDate DATE NOT NULL,
  returnedOrNot NUMERIC(5) NOT NULL,
  LoanId NUMERIC(5) NOT NULL,
  AccountId NUMERIC(5) NOT NULL,
  PRIMARY KEY (LoanId, AccountId),
  FOREIGN KEY (LoanId) REFERENCES Loan(LoanId),
  FOREIGN KEY (AccountId) REFERENCES Acount(AccountId)
);
