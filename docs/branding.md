# Branding

Flight Landing Page has extensive support for custom branding.  How to add
custom branding depends on your use case.  Below you will find instructions
for a number of different branding use cases along with instructions for
compiling the landing page after changes have been made.

## Add environment or organisation name to the sidebar

If you wish to change the environment or organisation name you can
do so by editing the `environment.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/environment.yaml overridden/content/data/
$EDITOR overridden/content/data/environment.yaml
```

## Customise logos and brandbar text

If you wish to adjust the logo used in the brandbar; or if you wish to 
change the "home" link in the brandbar you can do so by editing the 
`branding.yaml` file.

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

## Change the CSS to apply a custom theme

More extensive changes can be made by changing the CSS. This is done by
creating a `branding.css` stylesheet.

The default styling is in [this stylesheet](/landing-page/types/default/content/styles/branding.css).
To make changes, copy the default `branding.css` file to `overridden/content/styles/branding.css`
and edit it to suit your needs.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/styles/
cp -a default/content/styles/branding.css overridden/content/styles/
$EDITOR overridden/content/styles/branding.css
```

The colour scheme can be changed by editing the variables in the 
`Colours` section at the top of the stylesheet. For example, to 
change the background colour of the navigation bar, change the 
`--navbar-bg-color` variable. 

More advanced styling and layout changes can be made by editing 
other sections of the stylesheet. Please note that when changing keys 
with an existing `!important` flag, the flag must be kept to ensure 
that the new styles are used.

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
