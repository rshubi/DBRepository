
[General]
Version=1

[Preferences]
Username=
Password=2377
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=ACOUNT
Count=400

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=5
Data=Sequence(5)
Master=

[Record]
Name=BALANCE
Type=NUMBER
Size=
Data=Random(0, 1000000)
Master=

[Record]
Name=ACCOUNTNUMBER
Type=NUMBER
Size=
Data=Random(100000, 999999)
Master=

[Record]
Name=BRANCHID
Type=NUMBER
Size=5
Data=List(select BranchId from Branch)
Master=

