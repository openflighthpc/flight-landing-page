# Flight Landing Page

A landing page for use with openflightHPC clusters.

## Overview

Flight landing page provides a web dashboard for use with openflightHPC
clusters.  It can be configured with details about the environment and its
installed applications.

## Installation

### Installing with the OpenFlight package repos

Flight Landing Page is available as part of the *Flight Web Suite*.  This is
the easiest method for installing Flight Landing Page and all its
dependencies.  It is documented in [the OpenFlight
Documentation](https://use.openflighthpc.org/installing-web-suite/install.html#installing-flight-web-suite).


### Manual Installation

#### Prerequisites

Flight Landing Page is developed and tested with Ruby version `2.7.1` and
`bundler` `2.1.4`.  Other versions may work but currently are not officially
supported.

#### Install Flight Landing Page

The following will install from source using `git`.  The `master` branch is
the current development version and may not be appropriate for a production
installation. Instead a tagged version should be checked out.

```
git clone https://github.com/alces-flight/flight-landing-page.git
cd flight-landing-page
git checkout <tag>
bundle config set --local with default
bundle config set --local without development
bundle install
```

Once installed, the landing page can be compiled by running the following:

```
cd flight-landing-page/landing-page
bundle exec nanoc compile
```

The output will be in the directory `flight-landing-page/landing-page/output`.
You will need to install and configure a web server to serve static files from
that directory.

## Configuration

This configuration section assumes that Flight Landing Page has been installed
with Flight Runway.  If it has been installed from source, the paths given
below will depend on where it was installed.

By default, Flight landing page installs a generic landing page suitable for
any openflightHPC environment.  The default content is automatically updated
when openflightHPC web apps such as
[`flight-console-webapp`](https://github.com/openflighthpc/flight-console-webapp)
or
[`flight-desktop-webapp`](https://github.com/openflighthpc/flight-desktop-webapp)
are installed.

If more configuration is required this can be accomplished by overriding any
of the default content or layout files.  The default content files are found
in `/opt/flight/opt/www/landing-page/default/content/` and the default layout
files found in `/opt/flight/opt/www/landing-page/default/layouts/`.  They can
be overridden by creating an identically named file in
`/opt/flight/opt/www/landing-page/overridden/content/` or
`/opt/flight/opt/www/landing-page/overridden/layouts/` respectively.

For example, the following would change the links shown in the sidebar:

```
cd /opt/flight/opt/www/landing-page
mkdir -p overridden/content/data
cp -a default/content/data/links.yaml overridden/content/data/
$EDITOR overridden/content/data/links.yaml
```

The default layouts can also be overridden in a similar manner.

Files worth mentioning are:

 - `landing-page/default/content/data/contacts.yaml`: the list of contacts to show
   in the sidebar.
 - `landing-page/default/content/data/links.yaml`: the list of links to show in the
   sidebar.
 - `landing-page/default/content/data/environment.yaml`: details about the
   environment.

You can also change the text shown on the landing page.  This is detailed in
the [branding documentation](docs/branding.md).

Once any changes have been made, make sure to compile the site.  The command
to do that depends on the installation method.

*When installed with Flight Runway*

```
flight start
flight landing-page compile
```

*When installed from source*

```
cd flight-landing-page/landing-page
bundle exec nanoc compile
```

## Branding

Flight Landing Page has extensive support for custom branding which is
detailed in the [branding documentation](docs/branding.md).

## Operation

Once compiled (see above), the landing page is a set of static HTML files to
be served by a suitably configured web server.  If installed via Flight
Runway, a suitable web server will be configured as part of the installation.

See the `help` command for further details and information about other
commands.

# Contributing

Fork the project. Make your feature addition or bug fix. Send a pull
request. Bonus points for topic branches.

Read [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

# Copyright and License

Eclipse Public License 2.0, see [LICENSE.txt](LICENSE.txt) for details.

Copyright (C) 2019-present Alces Flight Ltd.

This program and the accompanying materials are made available under
the terms of the Eclipse Public License 2.0 which is available at
[https://www.eclipse.org/legal/epl-2.0](https://www.eclipse.org/legal/epl-2.0),
or alternative license terms made available by Alces Flight Ltd -
please direct inquiries about licensing to
[licensing@alces-flight.com](mailto:licensing@alces-flight.com).

Flight Landing Page is distributed in the hope that it will be
useful, but WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, EITHER
EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OR
CONDITIONS OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR
A PARTICULAR PURPOSE. See the [Eclipse Public License 2.0](https://opensource.org/licenses/EPL-2.0) for more
details.
