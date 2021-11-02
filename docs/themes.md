# Themes

This repository contains two example themes, in the `types/` directory; `red-theme` and `green-theme`.

Each of the example theme directories contain a directory tree leading to a single file, resembling the following:
```

└── types
    └── red-theme
        └── content
            └── styles
                └── branding.css

```

The `branding.css` file contains the stylesheet that can be edited at the site admin's discretion to match their desired custom branding.

## Example themes

The example themes are each split into sections indicating which parts of the Landing Page they will affect. For example, the key to change the background colour of the main page content is `background-color` under `body` in the `Generic branding` section. Please note that when changing keys with an existing `!important` flag, the flag must be kept to ensure that the new styles are used.

## Creating a new theme

To create a new theme, it is recommended to duplicate one of the included example themes as a basis and modify the included keys.

To duplicate one of the themes, you should copy one of the example themes from this repo; you may then begin editing the `branding.css` file under the newly created directory.

## Applying a theme

To apply a theme, it is recommended to use the `overridden` directory. For example, to apply the newly created `alternative-theme`:

```
cd /opt/flight/opt/www/landing-page
mkdir -p overridden/content/styles
ln -s /path/to/alternative-theme/branding.css /opt/flight/opt/www/landing-page/overridden/content/styles/branding.css`
```

This creates a symbolic link in the `overridden/content/styles` directory pointing to the newly created `branding.css` file in the `alternative-theme` directory. To switch themes, simply delete and recreate the symbolic link for the desired theme.

After creating the symbolic link, the Landing Page must be recompiled:

_via Flight Runway_

```
flight start
flight landing-page compile
```

_from source_

```
cd /opt/flight/opt/www/landing-page
bundle exec nanoc compile
```
