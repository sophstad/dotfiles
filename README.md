# dotfiles

Much of this is cribbed from [Zach Holman](https://github.com/holman/dotfiles) and [Kirby Kohlmorgen](https://github.com/kirbyk/dotfiles).

Something I found useful was implementing Docker to create testing environments. Implementation details were found in [this closed PR from Zach Holman's dotfiles](https://github.com/holman/dotfiles/pull/259/). However, this approach is limited in its ability to replicate macOS-specific configs.

## Other setup stuff
- Download Font Bureau's [Input](http://input.fontbureau.com)
- Configure macOS Terminal theme:
  - [Tomorrow Night Theme](https://github.com/chriskempson/tomorrow-theme)
  - Font: InputMono Light 12 pt.
- Set up Sublime:
  - [Flatland Dark Theme](https://github.com/thinkpixellab/flatland)
  - Configure user preferences

```
{
	"color_scheme": "Packages/User/SublimeLinter/Flatland Dark (SL).tmTheme",
	"font_face": "Input Sans",
	"font_size": 12,
	"ignored_packages":
	[
		"CSS"
	],
	"tab_size": 2,
	"theme": "Flatland Dark.sublime-theme",
	"translate_tabs_to_spaces": true
}
```
