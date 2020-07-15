# Flight Landing Page

A landing page for use with openflightHPC clusters.

## Overview

Flight landing page provides a web dashboard for use with openflightHPC
clusters.  It can be configured with details about the environment and its
installed applications.

## Installation

### From source

Flight Landing Page requires a recent version of Ruby and `bundler`.

The following will install from source using `git`:

```
git clone https://github.com/openflighthpc/flight-landing-page.git
cd flight-landing-page
bundle install --path=vendor
```

Once installed, the landing page can be compiled by running the following:

```
cd flight-landing-page/landing-page
bundle exec nanoc compile
```

The output will be in the directory `flight-landing-page/landing-page/output`.
You will need to install and configure a web server to serve static files from
that directory.

### Installing with Flight Runway

Flight Runway provides a Ruby environment and command-line helpers for
running openflightHPC tools.  Flight Landing Page integrates with Flight
Runway to provide an easy way to install and run the tool.

Flight Landing Page is packaged as part of the `flight-www` RPM.  Installing
`flight-www` will automatically install Flight Landing Page and configure it
for use.

To install Flight Runway, see the [Flight Runway installation
docs](https://github.com/openflighthpc/flight-runway#installation).

These instructions assume that `flight-runway` has been installed from the
openflightHPC yum repository and that either [system-wide
integration](https://github.com/openflighthpc/flight-runway#system-wide-integration)
has been enabled or the
[`flight-starter`](https://github.com/openflighthpc/flight-starter) tool has
been installed and the environment activated with the `flight start` command.

 * Enable the Alces Flight RPM repository:

    ```
    yum install https://repo.openflighthpc.org/openflight/centos/7/x86_64/openflighthpc-release-2-1.noarch.rpm
    ```

 * Rebuild your `yum` cache:

    ```
    yum makecache
    ```

 * Install the `flight-www` RPM:

    ```
    [root@myhost ~]# yum install flight-www
    ```

## Configuration

This configuration section assumes that Flight Landing Page has been installed
with Flight Runway.  If it has been installed from source, the paths given
below will depend on where it was installed to.

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
mkdir overridden/content/
cp -a default/content/links.yaml overridden/content/
$EDITOR overridden/content/links.yaml
```

Whilst the following would change the environment details:

```
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/
cp -a default/content/environment.md overridden/content/
$EDITOR overridden/content/environment.md
```

The default layouts can also be overridden in a similar manner.

Files worth mentioning are:

 - `landing-page/default/content/contacts.yaml`: the list of contacts to show
   in the sidebar.
 - `landing-page/default/content/links.yaml`: the list of links to show in the
   sidebar.
 - `landing-page/default/content/environment.md`: the environment details
   including
   some metadata.

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
