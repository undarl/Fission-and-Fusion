std = "lua52c"

max_line_length = false

read_globals = {
  log = {},
  serpent = {
    fields = {
      'block',
      'line'
    }
  },
  table = {
    fields = {
      'deepcopy'
    }
  },
  util = {
    fields = {
      'combine_icons',
      'parse_energy',
      'by_pixel'
    }
  },
  settings = {
    fields = {
      'startup',
      'global'
    }
  },
  'mods',
  'defines'
}

local data_settings = {
  read_globals = {
    data = {
      fields = {
        raw = {
          read_only = false,
          other_fields = true
        },
        'extend'
      }
    },
    'accumulator_picture'
  },
  globals = {
    'HighlyDerivative',
    'heat_glow_tint',
    'pipecoverspictures'
  }
}

local control_settings = {
  read_globals = {
    'game',
    'defines',
    'script',
    'remote'
  },
  globals = {
    'global',
  }
}

files["migration_helper/control.lua"] = control_settings

files["control.lua"] = control_settings
files["scripts/**/*.lua"] = control_settings

files["settings.lua"] = data_settings
files["data.lua"] = data_settings
files["data-updates.lua"] = data_settings
files["data-final-fixes.lua"] = data_settings
files["prototypes/**/*.lua"] = data_settings
files["integrations/**/*.lua"] = data_settings
