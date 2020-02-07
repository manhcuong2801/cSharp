SELECT        Usage.usageID, Usage.studentID, Dom.domName, Room.roomName, UsageType.typeName, Usage.time, Usage.numOfMeter
FROM            Dom INNER JOIN
                         Room ON Dom.domID = Room.domID INNER JOIN
                         Usage ON Dom.domID = Usage.domID AND Room.roomID = Usage.roomID INNER JOIN
                         UsageType ON Usage.typeID = UsageType.typeID

SELECT        Dom.domName, Room.roomName, UsageType.typeName
FROM            Dom INNER JOIN
                         Room ON Dom.domID = Room.domID CROSS JOIN
                         UsageType
INSERT INTO Usage(studentID, domID, roomID, typeID, time, numOfMeter)
select 'HE130181', Dom.domID, Room.roomID, UsageType.typeID, CONVERT(date, '4/4/2018'), 123
FROM            Dom INNER JOIN
                         Room ON Dom.domID = Room.domID CROSS JOIN
                         UsageType
where Dom.domName = 'Dom C' and Room.roomName = '101' and UsageType.typeName = 'Water' 
						 
INSERT INTO Usage(studentID, domID, roomID, typeID, time, numOfMeter) 
select '1', Dom.domID, Room.roomID, UsageType.typeID, CONVERT(date, 'Water'), 10 FROM Dom INNER JOIN Room ON Dom.domID = Room.domID CROSS JOIN UsageType where Dom.domName ='HE130181' and Room.roomName = 'Dom C' and UsageType.typeName = '101'INSERT INTO Usage(studentID, domID, roomID, typeID, time, numOfMeter) select '2', Dom.domID, Room.roomID, UsageType.typeID, CONVERT(date, 'Water'), 10 FROM Dom INNER JOIN Room ON Dom.domID = Room.domID CROSS JOIN UsageType where Dom.domName ='HE130072' and Room.roomName = 'Dom C' and UsageType.typeName = '103'INSERT INTO Usage(studentID, domID, roomID, typeID, time, numOfMeter) select '3', Dom.domID, Room.roomID, UsageType.typeID, CONVERT(date, 'Electricity'), 10 FROM Dom INNER JOIN Room ON Dom.domID = Room.domID CROSS JOIN UsageType where Dom.domName ='HE130021' and Room.roomName = 'Dom A' and UsageType.typeName = '102'

select * from Usage