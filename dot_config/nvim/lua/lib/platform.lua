local osname = 'Windows'; -- Only non-POSIX OSes won't work with the detection method
local fh = io.popen('uname 2>/dev/null', 'r');
if fh then
	osname = fh:read();
end

return osname
