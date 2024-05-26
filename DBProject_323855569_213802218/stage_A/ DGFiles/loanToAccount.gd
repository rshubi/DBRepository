
[General]
Version=1

[Preferences]
Username=
Password=2939
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=LOANTOACCOUNT
Count=10..20

[Record]
Name=LOANDATE
Type=DATE
Size=
Data=Random(1/1/1970,1/1/2025)
Master=

[Record]
Name=RETURNEDORNOT
Type=NUMBER
Size=5
Data=Random(0, 1)
Master=

[Record]
Name=LOANID
Type=NUMBER
Size=5
Data=List(select LoanId from Loan)
Master=

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=5
Data=List(select AccountId from Acount)
Master=

