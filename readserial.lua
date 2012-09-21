while true do

	s = io.open("/dev/ttyUSB0", "r")

	repeat
		trash = s:read()
	until (trash == nil)

	for i = 0,29 do
		print( i )
		d = s:read(a)
		if (d ~= nil) then
			f = io.open("envir.json", "w")			
			for k,v = string.gmatch(d, "(%w+) (.*)") do
				f:write('{"id":"' .. k .. '","current_value":"' .. v .. '"},\n')
			end
			f:close()
		end
		os.execute("sleep 10")
	end
	s:close()

end
