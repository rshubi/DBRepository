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
WHERE
    ac.ActionDate BETWEEN &<name=StartDate type=date> AND &<name=EndDate type=date>
GROUP BY 
    b.BranchAddress, 
    w.WorkerName
ORDER BY 
    TotalActions DESC;
    


SELECT DISTINCT a.AccountId, a.AccountNumber, a.Balance
FROM Acount a
LEFT JOIN activity act ON a.AccountId = act.AccountId
LEFT JOIN Actions ac ON act.ActionId = ac.ActionId
WHERE a.BranchId = &<name="ListBranch"
 list="select BranchId,BranchId || ' - ' || BranchAddress as display_value from Branch order by BranchId"
 description="yes" restricted="yes" >
AND (ac.ActionId IS NULL OR ac.ActionDate < ADD_MONTHS(SYSDATE, -12));


SELECT b.BranchId, b.BranchAddress, SUM(l.LoanSum) AS TotalLoanSum
FROM Branch b
JOIN Acount acc ON b.BranchId = acc.BranchId
JOIN LoanToAccount lta ON lta.accountid=acc.accountid
JOIN Loan l ON lta.LoanId = l.LoanId
WHERE l.LoanSum>&<name="LoanSumHigherFrom" hint="enter num between 100000 to 999999" type="integer">
GROUP BY b.BranchId, b.BranchAddress;

SELECT a.AccountId, ac.ActionId, ac.ActionName, ac.ActionSum, ac.ActionDate
FROM Acount a
JOIN activity act ON a.AccountId = act.AccountId
JOIN Actions ac ON act.ActionId = ac.ActionId
WHERE a.AccountId =&<name="ListOfAccountId"
list="select AccountId, to_char(AccountId) || ' - ' || to_char(AccountNumber) as display_value from Acount order by AccountId"  >
AND TO_CHAR(ac.ActionDate, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM');
