SELECT 
    c.ClientName, 
    c.ClientLastName, 
    a.AccountNumber, 
    b.BranchAddress, 
    ac.ActionName, 
    ac.ActionSum, 
    ac.ActionDate, 
    w.WorkerName
FROM 
    Client c
JOIN 
    activity act ON c.ClientId = act.ClientId
JOIN 
    Acount a ON act.AccountId = a.AccountId
JOIN 
    Branch b ON a.BranchId = b.BranchId
JOIN 
    Actions ac ON act.ActionId = ac.ActionId
JOIN 
    Worker w ON act.WorkerId = w.WorkerId
WHERE 
    ac.ActionDate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD')
ORDER BY 
    ac.ActionDate DESC;

