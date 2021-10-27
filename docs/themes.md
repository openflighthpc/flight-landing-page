# Themes

Themes are located in the [types/](landing-page/types) directory. Two examples are included in this repo: `red-theme` and `green-theme`.
Each of the directories contains a directory tree leading to a single file, resembling the following:
```

└── types
    └── red-theme
        └── content
            └── styles
                └── branding.css

```
and recompiling the Landing Page with:

_Flight Runway_

```
flight start
flight landing-page compile
```

_Source_

```
cd /opt/flight/opt/www/landing-page
bundle exec nanoc compile
```

will result in the Landing Page being compiled with the theme you created a symbolic link to.

## Example themes

The example themes are each split into sections indicating which parts of the Landing Page they will affect. For example, the key to change the background colour of the main page content is `background-color` under `body` in the `Generic branding` section. Please note that when changing keys with an existing `!important` flag, the flag must be kept to ensure that the new styles are used.

## Creating a new theme

To create a new theme, it is recommended to duplicate one of the included example themes as a basis and modify the included keys.

To duplicate one of the themes, you should copy the directory and its contents into the `types/` directory with a new name. You may then begin editing the `branding.css` file under the newly created directory.

For example, the following would create a new theme named `alternative-theme`:

```
cd /opt/flight/opt/www/landing-page
cp -a types/red-theme/ types/alternative-theme/
$EDITOR types/alternative-theme/content/styles/branding.css
```

## Applying a theme

To apply a theme, it is recommended to use the `overridden` directory. For example, to apply the newly created `alternative-theme`:

```
cd /opt/flight/opt/www/landing-page
mkdir -p overridden/content/styles
ln -s types/alternative-theme/content/styles/branding.css overridden/content/styles/branding.css`
```

This creates a symbolic link link in the `overridden/content/styles` directory pointing to the newly created `branding.css` file in the `alternative-theme` directory. To switch themes, simply delete and recreate the symbolic link for the desired theme.
