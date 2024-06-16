UPDATE Loan
SET LoanSum = &newLoanSum, NumOfPaymet = &newNumOfPaymet
WHERE LoanId = &<name="LoanIdToUpdate"
list="select LoanId, to_char(LoanId) || ' - ' || to_char(LoanSum) as display_value from Loan order by LoanId"
description="yes" restricted="yes" >;


