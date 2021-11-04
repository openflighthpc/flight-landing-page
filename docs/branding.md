# Branding

Flight Landing Page has extensive support for custom branding.  How to add
custom branding depends on your use case.  Below you will find instructions
for a number of different branding use cases along with instructions for
compiling the landing page after changes have been made.

## Add environment or organisation name to the sidebar

If you wish to add the environment or organisation name to the sidebar you can
do so by editing the `environment.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/environment.yaml overridden/content/data/
$EDITOR overridden/content/data/environment.yaml
```

## Customise logos and brandbar text

If you wish to adjust the logo's used in the brandbar or the main content of
the dashboard; or if you wish to change the "home" link in the brandbar you
can do so by editing the `branding.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/branding.yaml overridden/content/data/
$EDITOR overridden/content/data/branding.yaml
```

The `branding.yaml` file is well documented.  It should be straight forward to
make the desired changes.

Once the desired changes have been made the landing page needs to be
recompiled.  See below for instructions on how to do so.

## Customise the content of the landing page

The content of the landing page itself can be customised by.  This is done by
editing the `blurb.md` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/
cp -a default/content/blurb.md overridden/content/
$EDITOR overridden/content/blurb.md
```

The file is written in markdown.  If you are unfamiliar with markdown you can
following this [guide to markdown
syntax](https://www.markdownguide.org/basic-syntax/).

Once the desired changes have been made the landing page needs to be
recompiled.  See below for instructions on how to do so.

## Change the CSS to apply a custom theme

More extensive changes can be made by changing the CSS.  This is done by
creating a `branding.css` file.

This repository contains two example themes
[red-theme](/landing-page/types/red-theme/content/styles/branding.css) and
[green-theme](/landing-page/types/green-theme/content/styles/branding.css).
Which you may wish to use as a starting point for your own branding; or you
could compare the differences between them and the [default
branding](/landing-page/types/headnode/content/styles/branding.css).

The example themes are each split into sections indicating which parts of the
Landing Page they will affect. For example, the key to change the background
colour of the main page content is `background-color` under `body` in the
`Generic branding` section. Please note that when changing keys with an
existing `!important` flag, the flag must be kept to ensure that the new
styles are used.

Once you have the `branding.css` file you wish to use a starting point copy it
to `overridden/content/styles/branding.css` and edit it to suit your needs.
To use the default `branding.css` file as your starting point you would

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/styles/
cp -a default/content/styles/branding.css overridden/content/styles/
$EDITOR overridden/content/styles/branding.css
```

Once the desired changes have been made the landing page needs to be
recompiled.  See below for instructions on how to do so.

## Recompiling the landing page

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
