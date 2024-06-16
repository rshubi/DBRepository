SELECT ClientName, ClientLastName
FROM Client
WHERE ClientId IN (
    SELECT ClientId
    FROM activity
    JOIN Acount ON activity.AccountId = Acount.AccountId
    WHERE Acount.Balance > 0
);
