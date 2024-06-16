-- מחיקת הרשומות המקושרות בטבלת activity
DELETE FROM activity 
WHERE ActionId IN (
    SELECT ac.ActionId
    FROM Actions ac
    JOIN Acount a ON ac.ActionId = a.AccountId
    JOIN Branch b ON a.BranchId = b.BranchId
    WHERE ac.ActionDate < TO_DATE('01/01/1980', 'dd/mm/yyyy')
);

-- מחיקת הרשומות בטבלת Actions
DELETE FROM Actions 
WHERE ActionDate < TO_DATE('01/01/1980', 'dd/mm/yyyy');

