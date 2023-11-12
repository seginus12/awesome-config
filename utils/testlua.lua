table = {
	one = "1",
	two = "2",
	three = {
		three_dot_three = "3.3",
		three_dot_four = "3.4"
	},
	fun = function(string)
		print(string)
	end
}
function serialize(table, depth)
	tab = string.rep("\t", depth - 1)
	io.write(tab .. "\n{")
	for key, value in pairs(table) do
		if type(value) == "table" then
			serialize(value, depth + 1)
		elseif type(value) == "function" then
			io.write(tab .. "\n\t" .. key .. " = " .. "some function")
		else
			io.write(tab .. "\n\t" .. key .. " = " .. value)
		end
	end
	io.write(tab .. "\n}")
end
local file = io.open("testfile", "w+")
io.output(file)
serialize(table, 1, file)
file.close(file)

