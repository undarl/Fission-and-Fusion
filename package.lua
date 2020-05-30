-- to package the mod, given that it has files that include spaces.
local name = io.popen('jq -r .name info.json'):read()
local version = io.popen('jq -r .version info.json'):read()

function printf(...)
  print(string.format(...))
end

function die(...)
  printf(...)
  os.exit(false)
end

function readOrDie(filename)
  local fh, error = io.open(filename, "rb")
  if not fh then
    die("couldn't read from %s: %s", filename, error)
  end
  local data = fh:read("*a")
  fh:close()
  return data
end

function writeOrDie(filename, data)
  local fh, error = io.open(filename, "wb")
  if not fh then
    die("couldn't open %s for writing: %s", filename, error)
  end
  local ok, error = fh:write(data)
  if not ok then
    die("couldn't write to %s: %s", filename, error)
  end
  fh:close()
end

printf('Packaging %s version %s', name, version)

local output_name = name .. '_' .. version
local output_dir = 'build/' .. output_name

function escape(string)
  return string:gsub("'","'\''")
end

local eoutput_dir = escape(output_dir)

function system(command)
  if not os.execute(command) then
    os.exit(false)
  end
end

function dirname(filename)
  local index = filename:reverse():find('/', 1, true)
  if index then
    return filename:sub(1,-index - 1)
  end
end

local mkdir_p_done = {}

function mkdir_p(dir)
  if not dir then return end
  if mkdir_p_done[dir] then return end
  -- install and not mkdir because install is available everywhere that also has git.
  system(string.format("install -d '%s/%s'", eoutput_dir, escape(dir)))
  mkdir_p_done[dir] = true
end

function copy(filename)
  mkdir_p(dirname(filename))
  writeOrDie(output_dir .. '/' .. filename, readOrDie(filename))
  printf('%s: copied ok', filename)
end

function substituteAndCopy(filename)
  mkdir_p(dirname(filename))
  local data = readOrDie(filename)
  data = data:gsub("{{MOD_NAME}}", name)
  data = data:gsub("{{VERSION}}", version)
  writeOrDie(output_dir .. '/' .. filename, data)
  printf('%s: copied ok', filename)
  return data
end

function processLua(filename)
  data = substituteAndCopy(filename)
  ok, error = loadstring(data, filename)
  if not ok then
    print(error)
    os.exit(false)
  end
  printf('%s: syntax ok', filename)
end

local files = io.popen('find . -type f -not -path "./build/*')

for filename in files:lines() do
  filename = filename:sub(3) -- strip off the leading './'
  local filename_lower = filename:lower()
  if (filename_lower:sub(-3) == '.md') then
    substituteAndCopy(filename)
  else
    local last4 = filename_lower:sub(-4)
    if last4 == '.lua' then
      if filename == 'package.lua' then
        goto next
      end
      processLua(filename)
    elseif last4 == '.png' then
      copy(filename)
    elseif last4 == '.cfg' then
      copy(filename)
    else
      if filename_lower:sub(-5) == '.json' then
        substituteAndCopy(filename)
      else
        if filename_lower == 'changelog.txt' then
          copy(filename)
        end
      end
    end
  end
  ::next::
end
