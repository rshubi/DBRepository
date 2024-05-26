
[General]
Version=1

[Preferences]
Username=
Password=2151
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=ACTIONS
Count=400

[Record]
Name=ACTIONID
Type=NUMBER
Size=5
Data=Sequence(5)
Master=

[Record]
Name=ACTIONNAME
Type=VARCHAR2
Size=30
Data=List('deposit', 'Withdrawing Funds', 'Transferring Funds')
Master=

[Record]
Name=ACTIONSUM
Type=NUMBER
Size=
Data=Random(50, 1000000)
Master=

[Record]
Name=ACTIONDATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2025)
Master=

