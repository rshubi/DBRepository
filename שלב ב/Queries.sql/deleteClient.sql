

DELETE FROM Actions
WHERE ActionId IN (
SELECT ActionId
FROM activity
WHERE ClientId =&<name="Client"
list="select ClientId, to_char(ClientId) || ' - ' || to_char(ClientName) as display_value from Client order by ClientId"
description="yes" restricted="yes" >
);
DELETE FROM activity
WHERE ClientId = &<name="Client"
list="select ClientId, to_char(ClientId) || ' - ' || to_char(ClientName) as display_value from Client order by ClientId"
description="yes" restricted="yes" >;

DELETE FROM Client
WHERE ClientId =&<name="Client"
list="select ClientId, to_char(ClientId) || ' - ' || to_char(ClientName) as display_value from Client order by ClientId"
description="yes" restricted="yes" >;




