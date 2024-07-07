CREATE OR REPLACE FUNCTION get_average_balance_by_branch (p_branch_id NUMERIC)
RETURN NUMBER
IS
  -- Initialize variables for total balance, account count, individual balance, and average balance
  v_total_balance NUMBER := 0;
  v_account_count NUMBER := 0;
  v_balance NUMBER;
  v_average_balance NUMBER;

  -- Declare a cursor to fetch balances of accounts in the specified branch
  CURSOR c_accounts IS
    SELECT Balance
    FROM Acount
    WHERE BranchId = p_branch_id;
BEGIN
  -- Open the cursor and loop through the fetched records
  OPEN c_accounts;
  LOOP
    FETCH c_accounts INTO v_balance;
    EXIT WHEN c_accounts%NOTFOUND;
    -- Accumulate the total balance and count the number of accounts
    v_total_balance := v_total_balance + v_balance;
    v_account_count := v_account_count + 1;
  END LOOP;
  -- Close the cursor
  CLOSE c_accounts;
  
  -- Calculate the average balance
  IF v_account_count > 0 THEN
    v_average_balance := v_total_balance / v_account_count;
  ELSE
    v_average_balance := 0;
  END IF;
  
  -- Return the average balance
  RETURN v_average_balance;
EXCEPTION
  -- Handle exceptions and return 0 in case of any error
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN 0;
END;
/
