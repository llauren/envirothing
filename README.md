envirothing
===========

envirothing is what i call an Arduino Nano connected over USB to an TP-Link TL-WR703N running OpenWRT.
Or possibly a Raspberry Pi connected to an Arduino, since i haven't got anything talking with the TP-Link. Probably some USB driver that won't cooperate.

Project goals are that they eventually be pollable over SNMP to report on temperature, illumination and 
the likes to a monitoring server. The hack should also be able to push data using MQTT.

If i get that to work, the next step would be to make it also take input (as SNMP or MQTT), make it
not-totally-insecure, and perhaps even reliable.

But don't hold your breath. It's been a year, and nothing much has happened during that time. Save for some frustration.
