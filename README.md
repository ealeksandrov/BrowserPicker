# Browser Picker

[![License](https://img.shields.io/github/license/ealeksandrov/BrowserPicker.svg)](LICENSE.md)
![Platform](https://img.shields.io/badge/platform-macos-lightgrey.svg)

Browser Picker opens links in different browsers as specified, according to rules. For example - initial setup will launch Firefox for `meet.google.com` and Safari for the rest of links.

There is no UI or easy way to define rule set - you should update Swift code and recompile for yourself. For good reliable solutions, check [alternatives](#alternatives) section.

## Installation

* Clone this repo and build it from source;
* Run app at least once;
* Set `BrowserPicker.app` as default web browser in `System Preferences` -> `General`.

### Rules setup

Manually update `launchBrowser(for:)` function in `AppDelegate.swift`.

## Alternatives

* [Choosy](https://www.choosyosx.com)
* [Browser Fairy](http://www.browserfairy.com)

## Author

Created and maintained by Evgeny Aleksandrov ([@ealeksandrov](https://twitter.com/ealeksandrov)).

## License

`Browser Picker` is available under the MIT license. See the [LICENSE.md](LICENSE.md) file for more info.
