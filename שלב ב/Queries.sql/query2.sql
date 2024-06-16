SELECT 
    c.ClientName,
    c.ClientLastName,
    a.AccountNumber,
    a.Balance,
    l.LoanSum,
    l.NumOfPaymet,
    lt.LoanDate,
    lt.returnedOrNot
FROM 
    Client c
JOIN 
    activity act ON c.ClientId = act.ClientId
JOIN 
    Acount a ON act.AccountId = a.AccountId
JOIN 
    LoanToAccount lt ON a.AccountId = lt.AccountId
JOIN 
    Loan l ON lt.LoanId = l.LoanId
WHERE 
    a.Balance > 1000
    AND lt.returnedOrNot = 0
ORDER BY 
    a.Balance DESC;
