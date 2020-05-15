class AppsDataSource < ::Nanoc::DataSource
  identifier :apps

  # XXX Load apps here based on what has been installed.  We need to
  #
  #  - Provide a location where installed apps can drop a YAML file.
  #  - Provide a command to recompile the landing page when an app is
  #    installed / uninstalled. 
  def apps
    [
      {
        title: 'Flight Console Service',
        subtitle: 'Access interactive console sessions',
        path: '/console',
        description: <<~EOF
          The *Flight Console Service* allows you to access an interactive
          terminal console session running on your cluster from the comfort of
          your browser.
        EOF
      },
      {
        title: 'Flight Desktop Access Service',
        subtitle: 'Access interactive GUI desktop sessions',
        path: '/desktop',
        description: <<~EOF
          The *Flight Desktop Access Service* allows you to access interactive
          GUI (graphical user interface) desktop sessions running on your
          cluster from the comfort of your browser.

          Powered by the Flight Desktop tool, part of the OpenFlightHPC user
          suite, this app allows you to launch, manage and connect to GUI
          desktop sessions that operate within your OpenFlightHPC environment.
        EOF
      }
    ]
  end

  def items
    items = apps.map do |app|
      new_item(
        app[:description],
        app.merge(kind: 'app'),
        Nanoc::Identifier.new("/__app__#{app[:path]}"),
      )
    end

    items
  end
end
