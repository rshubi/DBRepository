PL/SQL Developer Test script 3.0
28
DECLARE
  v_branch_id NUMERIC := 65;  -- Example branch ID
  v_average_balance NUMBER;
  v_client_name VARCHAR2(30) := 'Reut';  -- Example client name
  v_client_last_name VARCHAR2(30) := 'Agam';  -- Example client last name
  v_client_address VARCHAR2(100) := 'simchoni 1, Bney Brak';  -- Example client address
  v_initial_balance INT := 20000;  -- Example initial balance
  v_branch_id_create NUMERIC := 2;  -- Branch ID for account creation

BEGIN
  -- Calling the function to get the average balance by branch
  v_average_balance := get_average_balance_by_branch(v_branch_id);
  DBMS_OUTPUT.PUT_LINE('Average balance for branch ' || v_branch_id || ' is: ' || v_average_balance);

  -- Calling the procedure to create a new client with an account
  create_client_with_account(
    p_client_name => v_client_name,
    p_client_last_name => v_client_last_name,
    p_client_address => v_client_address,
    p_initial_balance => v_initial_balance,
    p_branch_id => v_branch_id_create
  );
  DBMS_OUTPUT.PUT_LINE('Client ' || v_client_name || ' ' || v_client_last_name || ' has been created with a new account.');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
0
0
