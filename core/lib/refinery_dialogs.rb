Refinery::Plugin.register do |plugin|
  plugin.title = "Dialogs"
  plugin.name = "refinery_dialogs"
  plugin.description = "Refinery Dialogs plugin"
  plugin.version = 1.0
  plugin.hide_from_menu = true
  plugin.always_allow_access = true
  plugin.menu_match = /(refinery|admin)\/(refinery_)?dialogs$/
  # plugin.directory = directory
end
