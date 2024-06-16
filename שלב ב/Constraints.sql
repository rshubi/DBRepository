ALTER TABLE Client
ADD CONSTRAINT chk_client_name CHECK (LENGTH(ClientName) > 1);

-- הוספת אילוץ DEFAULT לטבלת Acount
ALTER TABLE Acount
MODIFY Balance DEFAULT 0;

ALTER TABLE Actions
MODIFY ActionDate DEFAULT SYSDATE;
