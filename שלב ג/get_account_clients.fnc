CREATE OR REPLACE FUNCTION get_account_clients(p_account_id NUMERIC)
RETURN VARCHAR2
IS
  -- Define a record type to hold client details
  TYPE client_record IS RECORD (
    client_id NUMERIC(5),
    client_name VARCHAR2(30),
    client_last_name VARCHAR2(30)
  );

  -- Initialize an empty string to accumulate client names
  v_client_list VARCHAR2(4000) := '';

  -- Declare a variable of the defined record type
  v_client client_record;

  -- Declare a cursor to fetch client details
  v_cursor SYS_REFCURSOR;

BEGIN
  -- Open the cursor to select clients associated with the specified account ID
  OPEN v_cursor FOR
    SELECT c.ClientId, c.ClientName, c.ClientLastName
    FROM Client c
    JOIN activity a ON c.ClientId = a.ClientId
    WHERE a.AccountId = p_account_id;

  -- Loop through the fetched client records
  LOOP
    FETCH v_cursor INTO v_client;

    -- Exit the loop if no more records are found
    EXIT WHEN v_cursor%NOTFOUND;

    -- Append the client names to the list, separated by commas
    IF v_client_list IS NOT NULL THEN
      v_client_list := v_client_list || ', ';
    END IF;
    v_client_list := v_client_list || v_client.client_name || ' ' || v_client.client_last_name;
  END LOOP;

  -- Close the cursor
  CLOSE v_cursor;

  -- Return the comma-separated list of client names
  RETURN v_client_list;

EXCEPTION
  -- Handle exceptions by closing the cursor if it is still open
  WHEN OTHERS THEN
    IF v_cursor%ISOPEN THEN
      CLOSE v_cursor;
    END IF;

    -- Return NULL in case of any error
    RETURN NULL;
END;
/
