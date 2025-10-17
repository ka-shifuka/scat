---@class Enum.options
---@field isSkipValue boolean

---@class Enum
local Enum = {}

---@generic T
---@param name string The enum name
---@param values T The enum values
---@param options? Enum.options
---@return T
Enum.new = function(name, values, options)
	options = options or {}

	local list = {}
	local reverseLookup = {}

	local isSkipValue = options.isSkipValue or false

	--- Make key -> value and value -> key pairs
	for key, value in pairs(values) do
		assert(type(key) == "string", "Enum key must be string")

		if not isSkipValue then
			assert(type(value) == "string", "Enum Value must be string")
			assert(key == value, "Enum key and value must be same")
		end

		table.insert(list, value)
		reverseLookup[value] = key
	end

	return setmetatable(values, {
		__index = function(_, k)
			if k == "_enums" then
				return list
			end

			if rawget(values, k) then
				return rawget(values, k)
			end

			if reverseLookup[k] then
				return reverseLookup[k]
			end

			return error(string.format("There are no match in enum %s : %s", name, k))
		end,
		--- Makesure enum cannot be modified
		__newindex = function(_, k, v)
			return error(string.format("Connot modified enum %s : %s -> %s", name, k, v))
		end
	})
end

return Enum
