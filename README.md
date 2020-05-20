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
git clone https://github.com/openflighthpc/openflight-landing-page.git
cd openflight-landing-page
bundle install --path=vendor
```

Compile the landing page by running the following:

```
cd openflight-landing-page/www
bundle exec nanoc compile
```

### Installing with Flight Runway

Flight Runway provides a Ruby environment and command-line helpers for
running openflightHPC tools.  Flight Landing Page integrates with Flight
Runway to provide an easy way to install and run the tool.

To install Flight Runway, see the [Flight Runway installation
docs](https://github.com/openflighthpc/flight-runway#installation).

These instructions assume that `flight-runway` has been installed from
the openflightHPC yum repository and that either [system-wide
integration](https://github.com/openflighthpc/flight-runway#system-wide-integration) has been enabled or the
[`flight-starter`](https://github.com/openflighthpc/flight-starter) tool has been
installed and the environment activated with the `flight start` command.

 * Enable the Alces Flight RPM repository:

    ```
    yum install https://repo.openflighthpc.org/openflight/centos/7/x86_64/openflighthpc-release-2-1.noarch.rpm
    ```

 * Rebuild your `yum` cache:

    ```
    yum makecache
    ```
    
 * Install the `flight-landing-page` RPM:

    ```
    [root@myhost ~]# yum install flight-landing-page
    ```

Flight Landing Page is now available via the `flight` tool:

```
[root@myhost ~]# flight landing-page
Usage: flight landing-page compile
Compile the landing page
```

## Configuration

XXX TBC

 - XXX Installing some web apps will add change content.  Recompilation
   needed.
 - XXX Environment details.
 - XXX Content can be overridden.
 - XXX Layouts can be overridden.

Making changes to the default configuration is optional.

## Operation

XXX TBC

See the `help` command for further details and information about other commands.

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
