
[General]
Version=1

[Preferences]
Username=
Password=2303
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=ACTIVITY
Count=400

[Record]
Name=ACTIVITYID
Type=NUMBER
Size=5
Data=Sequence(1)
Master=

[Record]
Name=CLIENTID
Type=NUMBER
Size=5
Data=List(select ClientId from Client)
Master=

[Record]
Name=ACTIONID
Type=NUMBER
Size=5
Data=List(select ActionId from Actions)
Master=

[Record]
Name=ACCOUNTID
Type=NUMBER
Size=5
Data=List(select AccountId from Acount)
Master=

[Record]
Name=WORKERID
Type=NUMBER
Size=5
Data=List(select WorkerId from Worker)
Master=

