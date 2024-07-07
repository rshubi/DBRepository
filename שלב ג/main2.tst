
DECLARE
  v_account_id NUMERIC := 15;  -- Example account ID
  v_client_list VARCHAR2(4000);
  v_action_name VARCHAR2(15) := 'Withdrawing';  -- Example action
  v_action_sum INT := 1500;  -- Example action sum
  v_update_account_id NUMERIC := 105;  -- Example account ID for update

BEGIN
  -- Calling the function to get account clients
  v_client_list := get_account_clients(v_account_id);
  DBMS_OUTPUT.PUT_LINE('Clients for account ' || v_account_id || ': ' || v_client_list);

  -- Calling the procedure to update account balance
  update_account_balance(p_account_id => v_update_account_id, p_action_name => v_action_name, p_action_sum => v_action_sum);
  DBMS_OUTPUT.PUT_LINE('Account ' || v_update_account_id || ' has been updated successfully.');

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

