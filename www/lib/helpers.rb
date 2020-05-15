use_helper Nanoc::Helpers::Rendering

def installed_apps
  @_installed_apps ||= items
    .select { |i| i[:kind] == 'app' }
    .sort { |a, b|
      if a[:order] && b[:order]
        [ a[:order], a.identifier ] <=> [ b[:order], b.identifier ]
      elsif a[:order].nil? && b[:order].nil?
        a.identifier <=> b.identifier
      else
        a[:order] ? -1 : 1
      end
    }
end

def environment
  @_environment ||= items.detect { |i| i[:kind] == 'environment' }
end
