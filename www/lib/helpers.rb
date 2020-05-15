use_helper Nanoc::Helpers::Rendering

def installed_apps
  @_installed_apps ||= items.select { |i| i[:kind] == 'app' }
end

def environment
  @_environment ||= items.detect { |i| i[:kind] == 'environment' }
end
