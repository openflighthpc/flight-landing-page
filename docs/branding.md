# Branding

Flight Landing Page has extensive support for custom branding.  How to add
custom branding depends on your use case.  Below you will find instructions
for a number of different branding use cases along with instructions for
compiling the landing page after changes have been made.

## Add environment or organisation name

If you wish to change the environment or organisation name you can
do so by editing the `environment.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/environment.yaml overridden/content/data/
$EDITOR overridden/content/data/environment.yaml
```

## Customise navigation bar and landing page content

### Useful links

The optional 'Useful links' section on the landing page can be populated with
links that are suited to your users by editing the `links.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/links.yaml overridden/content/data/
$EDITOR overridden/content/data/links.yaml
```

Your link can be given a custom icon using the `icon` property. Provide the name of 
any icon that is available for free with Font Awesome version 6.5.1.

### Contact information

The optional 'Contacts' section on the landing page can be populated with
contact information by editing the `contacts.yaml` file.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/contacts.yaml overridden/content/data/
$EDITOR overridden/content/data/contacts.yaml
```

### Other customisation options

Flight Web Suite supports several more options for customising the navigation bar 
and landing page content in the `branding.yaml` file. See the comments in the file
for details on how to make the desired changes.

```sh
cd /opt/flight/opt/www/landing-page
mkdir overridden/content/data/
cp -a default/content/data/branding.yaml overridden/content/data/
$EDITOR overridden/content/data/branding.yaml
```

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
