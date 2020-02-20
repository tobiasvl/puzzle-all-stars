function compareLOVEVersion(maj, min, rev)
	if love._version_major > maj then
		return 1
	elseif love._version_major < maj then
		return -1
	elseif min then
		if love._version_minor > min then
			return 1
		elseif love._version_minor < min then
			return -1
		elseif rev then
			if love._version_revision > rev then
				return 1
			elseif love._version_revision < rev then
				return -1
			end
		end
	end
	-- equal
	return 0
end

function love.conf(t)
  t.window.title = "Soko All-Stars"
  --t.window.icon = "vinnie.png"
  t.identity = "soko-all-stars"
  t.window.width = 800
  t.window.height = 600
  t.modules.joystick = false
  t.modules.physics = false
  t.version = compareLOVEVersion(0, 11, 0) >= 0 and love._version or "0.11.0"
  t.console = false
end
