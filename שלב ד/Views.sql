CREATE VIEW ClientAccountDetails AS
SELECT 
    c.ClientId,
    c.ClientName,
    c.ClientLastName,
    a.AccountId,
    a.AccountNumber,
    a.Balance,
    b.BranchAddress,
    w.WorkerName AS ManagerName
FROM 
    Client c
JOIN 
    activity act ON c.ClientId = act.ClientId
JOIN 
    Acount a ON act.AccountId = a.AccountId
JOIN 
    Branch b ON a.BranchId = b.BranchId
JOIN 
    Worker w ON b.BranchManager = w.WorkerName;

---
SELECT 
    ClientId,
    ClientName,
    ClientLastName,
    AccountId,
    AccountNumber,
    Balance,
    BranchAddress,
    ManagerName
FROM 
    ClientAccountDetails;
---
SELECT 
    ClientId,
    ClientName,
    ClientLastName,
    AccountId,
    AccountNumber,
    Balance,
    BranchAddress,
    ManagerName
FROM 
    ClientAccountDetails
WHERE 
    Balance > 700000;
---
CREATE VIEW EventDetails AS
SELECT *
  FROM 
    EVENTS_ a
--- DECEMBER 22
SELECT *
FROM EventDetails
WHERE EventDate BETWEEN TO_DATE('2022-12-01', 'YYYY-MM-DD') AND TO_DATE('2022-12-31', 'YYYY-MM-DD');
