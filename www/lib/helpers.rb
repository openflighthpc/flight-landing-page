use_helper Nanoc::Helpers::Rendering

def installed_apps
  @_installed_apps ||= items.select { |i| i.attributes[:__app__] }
end

def environment
  @_environment ||= items.detect { |i| i.attributes[:__environment__] }
end
