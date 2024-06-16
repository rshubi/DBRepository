SELECT 
    b.BranchAddress, 
    w.WorkerName, 
    COUNT(act.ActivityId) AS TotalActions, 
    SUM(ac.ActionSum) AS TotalSum
FROM 
    Branch b
JOIN 
    Acount a ON b.BranchId = a.BranchId
JOIN 
    activity act ON a.AccountId = act.AccountId
JOIN 
    Actions ac ON act.ActionId = ac.ActionId
JOIN 
    Worker w ON act.WorkerId = w.WorkerId
GROUP BY 
    b.BranchAddress, 
    w.WorkerName
ORDER BY 
    TotalActions DESC;
