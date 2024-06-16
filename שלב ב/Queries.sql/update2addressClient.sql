UPDATE Client
SET ClientAddress = &newClientAddress
WHERE ClientId = &<name="ClientIdToUpdate"
list="select ClientId, ClientName || ' ' || ClientLastName as display_value from Client order by ClientId"
description="yes" restricted="yes" >;
