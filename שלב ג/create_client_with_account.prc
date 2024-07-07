CREATE OR REPLACE PROCEDURE create_client_with_account(p_client_name      VARCHAR2,
                                                       p_client_last_name VARCHAR2,
                                                       p_client_address   VARCHAR2,
                                                       p_initial_balance  INT,
                                                       p_branch_id        NUMERIC) IS
  v_client_id  NUMERIC;
  v_account_id NUMERIC;
  v_exists     NUMERIC;
BEGIN

  v_exists := 0;
  begin
    select 1
      into v_exists
      from Client
     where ClientName = p_client_name
       and ClientLastName = p_client_last_name
       and rownum = 1;
  
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  end;

  if v_exists = 0 then
  
    -- Generate a new client ID
    SELECT NVL(MAX(ClientId), 0) + 1 INTO v_client_id FROM Client;
  
    -- Insert a new client record
    INSERT INTO Client
      (ClientId, ClientName, ClientLastName, ClientAddress)
    VALUES
      (v_client_id, p_client_name, p_client_last_name, p_client_address);
  
    -- Generate a new account ID
    SELECT NVL(MAX(AccountId), 0) + 1 INTO v_account_id FROM Acount;
  
    -- Insert a new account record for the client
    INSERT INTO Acount
      (AccountId, Balance, AccountNumber, BranchId)
    VALUES
      (v_account_id, p_initial_balance, v_account_id + 1000, p_branch_id);
  
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Client ' || p_client_name || ' ' ||
                         p_client_last_name ||
                         ' has been created with a new account.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Client already exists.');
  end if;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    ROLLBACK;
END;

