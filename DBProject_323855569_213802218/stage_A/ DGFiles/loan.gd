
[General]
Version=1

[Preferences]
Username=
Password=2299
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=LOAN
Count=400

[Record]
Name=LOANID
Type=NUMBER
Size=5
Data=Sequence(1)
Master=

[Record]
Name=NUMOFPAYMET
Type=NUMBER
Size=5
Data=Random(1, 12)
Master=

[Record]
Name=LOANSUM
Type=NUMBER
Size=
Data=Random(1000, 1000000)
Master=

