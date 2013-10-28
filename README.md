envirothing
===========

envirothing is what i call the Arduino Nano connected over USB to an TP-Link TL-WR703N running OpenWRT.
Or possibly a Raspberry Pi connected to an Arduino, if the former proves unpractical.

Project goals are that they eventually be pollable over SNMP to report on temperature, illumination and 
the likes to a monitoring server. The hack should also be able to push data using MQTT.

If i get that to work, the next step would be to make it also take input (as SNMP or MQTT), make it
not-totally-insecure, and perhaps even reliable.

But don't hold your breath.
