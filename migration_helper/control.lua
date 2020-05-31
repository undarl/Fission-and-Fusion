remote.add_interface(
  "Fission and Fusion",
  {
    read_global = function()
      return global
    end,
    mark_migrated = function()
      for k in pairs(global) do
        global[k] = nil
      end
      global.migrated = true
    end
  }
)
