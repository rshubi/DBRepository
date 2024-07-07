CREATE OR REPLACE PROCEDURE update_account_balance (
  p_account_id NUMERIC,
  p_action_name VARCHAR2,
  p_action_sum INT
)
IS
  v_balance INT;
BEGIN
  -- Retrieve the current account balance
  SELECT Balance INTO v_balance
  FROM Acount
  WHERE AccountId = p_account_id;
  
  -- Process the action and update the balance
  IF p_action_name = 'Deposit' THEN
    v_balance := v_balance + p_action_sum;
  ELSIF p_action_name = 'Withdrawing' THEN
    IF v_balance >= p_action_sum THEN
      v_balance := v_balance - p_action_sum;
    ELSE
      RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance for withdrawal.');
    END IF;
  ELSE
    RAISE_APPLICATION_ERROR(-20002, 'Invalid action name.');
  END IF;
  
  -- Update the account balance
  UPDATE Acount
  SET Balance = v_balance
  WHERE AccountId = p_account_id;
  
  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Account not found.');
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    ROLLBACK;
END;
/
