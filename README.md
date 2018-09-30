# Browser Picker

[![CI Status](http://img.shields.io/travis/ealeksandrov/BrowserPicker.svg)](https://travis-ci.org/ealeksandrov/BrowserPicker)
[![Latest Release](https://img.shields.io/github/release/ealeksandrov/BrowserPicker.svg)](https://github.com/ealeksandrov/BrowserPicker/releases/latest)
[![License](https://img.shields.io/github/license/ealeksandrov/BrowserPicker.svg)](LICENSE.md)
![Platform](https://img.shields.io/badge/platform-macos-lightgrey.svg)

Browser Picker opens links in different browsers as specified, according to rules. For example, initial setup will launch Firefox for `meet.google.com` and Safari for the rest of links.

2 types of rules are set up in `plist` file - hostnames list and substrings list to match in opened URL. Also there are settings for default and alternative browsers.

There is no UI or easy way to extend rule set - but you can update Swift code and recompile for yourself. For other fully-featured solutions, check [alternatives](#alternatives) section.

## Installation

* Download dmg from [releases page](https://github.com/ealeksandrov/BrowserPicker/releases/latest);
* Or clone this repo and build it from source;
* Run app at least once;
* Set `BrowserPicker.app` as default web browser in `System Preferences` -> `General`.

### Rules setup

* Open `BrowserPicker.app/Contents/Resources/Config.plist` and setup desired browsers and rules;
* For advanced users - manually update `launchBrowser(for:)` function in `AppDelegate.swift` (rebuilt from source needed).

## Alternatives

* [Choosy](https://www.choosyosx.com)
* [Browser Fairy](http://www.browserfairy.com)

## Author

Created and maintained by Evgeny Aleksandrov ([@ealeksandrov](https://twitter.com/ealeksandrov)).

## License

`Browser Picker` is available under the MIT license. See the [LICENSE.md](LICENSE.md) file for more info.
