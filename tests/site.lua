-- Deployment-boundary checks, independent of the private generator.
local root = arg[1] or "public"
local function quote(s) return "'" .. s:gsub("'", "'\\''") .. "'" end
local expected = {
	["index.html"] = true, ["coverage/index.html"] = true,
	["assets/site.css"] = true, ["assets/site.js"] = true,
	["CNAME"] = true, ["sitemap.xml"] = true, [".nojekyll"] = true,
}
local locales = "am ar az bg bn bs da de el es fa fi fil fr ha he hi hr hu id ig is it ja km ko mk nb nl pa pl ps pt-br ro ru sl sq sr sv sw ta th tr uk ur vi yo zh-hans zh-hant"
for lang in locales:gmatch("%S+") do
	expected[lang .. "/index.html"] = true
	expected[lang .. "/coverage/index.html"] = true
end
local errors = {}
local function check(ok, message) if not ok then errors[#errors+1] = message end end
local function read(path)
	local f = io.open(root .. "/" .. path, "rb")
	if not f then return nil end
	local s = f:read("*a"); f:close(); return s
end
local cmd = "find " .. quote(root) .. " -mindepth 1 ! -type d -printf '%P\\n'"
local p = assert(io.popen(cmd))
local actual = {}
for path in p:lines() do
	actual[path] = true
	check(expected[path], "Unexpected public path: " .. path)
end
local ok = p:close()
check(ok, "Unable to enumerate public tree")
local links = assert(io.popen("find " .. quote(root) .. " -mindepth 1 ! -type d ! -type f -print"))
check(links:read("*a") == "", "Public tree contains a non-regular file")
links:close()
if #errors > 0 then
	io.stderr:write(table.concat(errors, "\n"), "\n")
	os.exit(1)
end
local pages = 0
for path in pairs(expected) do
	check(actual[path], "Missing public path: " .. path)
	local body = read(path)
	if body and path:match("%.html$") then
		pages = pages + 1
		check(body:find("<html", 1, true), "Not HTML: " .. path)
		check(not body:find("https://github.com/pmarreck/validate\"", 1, true), "Private repo link: " .. path)
		check(not body:find("mega.nz/", 1, true), "Expired legacy download URL: " .. path)
		for key, value in body:gmatch('([%w-]+)="([^"]*)"') do
			if key == "href" or key == "src" then
				local target = value:gsub("^https://validate%.pics", ""):match("^(/[^?#]*)")
				if target and not target:match("^//") then
					target = target:sub(2)
					if target == "" or target:sub(-1) == "/" then target = target .. "index.html" end
					check(expected[target], "Missing local link in " .. path .. ": " .. value)
				end
			end
		end
	end
end
check(pages == 100, "Expected 50 home pages and 50 coverage pages")
check(read("CNAME") == "validate.pics\n", "Wrong custom domain")
if #errors > 0 then
	io.stderr:write(table.concat(errors, "\n"), "\n")
	os.exit(1)
end
print("PASS: 100 pages, exact public file boundary, local links, domain, and legacy-link checks")
