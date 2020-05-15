class EnvironmentDataSource < ::Nanoc::DataSource
  identifier :environment

  # XXX Load environment here.
  def environment
    {
      name: "Demo cluster",
      organisation_name: "Demo site",
      contacts: [
        { name: 'Bob', email: 'bob@bob.com', },
        { name: 'Kate', email: 'kate@kate.com', },
      ],
      logo_url: "https://s3.eu-west-2.amazonaws.com/alces-flight-center/logos/Alces_flight_logo_horiz.png",
      description: <<~EOF
        Demonstration on-premise HPC cluster site for the new openflightHPC
        landing page.

        This description supports *Markdown*, including:

          - Lists.
          - *Emphasised text*.
          - *Bold text*.
          - and more...
      EOF
    }
  end

  def items
    item = new_item(
      environment[:description],
      environment.merge(kind: 'environment'),
      Nanoc::Identifier.new('/__environment__')
    )

    [item]
  end
end
