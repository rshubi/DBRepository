
[General]
Version=1

[Preferences]
Username=
Password=2863
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=RENANA
Name=WORKER
Count=400

[Record]
Name=WORKERID
Type=NUMBER
Size=
Data=Sequence(5)
Master=

[Record]
Name=WORKERNAME
Type=VARCHAR2
Size=30
Data=FirstName
Master=

[Record]
Name=WORKERBIRTHDATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/1/2025)
Master=

[Record]
Name=WORKERROLE
Type=VARCHAR2
Size=30
Data=List('Teller', 'Investment Advisor', 'Business Account Manager', 'Credit Analyst', 'Financial Advisor','Customer Service Representative')
Master=

