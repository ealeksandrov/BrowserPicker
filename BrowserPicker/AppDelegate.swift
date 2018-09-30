//
//  AppDelegate.swift
//  BrowserPicker
//
//  Copyright © 2018 Evgeny Aleksandrov. All rights reserved.

import Cocoa

class Config: Decodable {
    typealias BrowserBundleId = String

    struct Browser: Decodable {
        enum CodingKeys: String, CodingKey {
            case `default`
            case alternative
        }

        let `default`: BrowserBundleId
        let alternative: BrowserBundleId
    }

    struct Rules: Decodable {
        enum CodingKeys: String, CodingKey {
            case hosts
            case substrings
        }

        let hosts: [String]
        let substrings: [String]
    }

    let browsers: Browser
    let rules: Rules
}

class AppDelegate: NSObject, NSApplicationDelegate {

    let config: Config = {
        let configUrl = Bundle.main.url(forResource: "Config", withExtension: "plist")!
        let configData = try! Data(contentsOf: configUrl)
        let cfg = try! PropertyListDecoder().decode(Config.self, from: configData)
        return cfg
    }()

    func applicationWillFinishLaunching(_ aNotification: Notification) {
        let em = NSAppleEventManager.shared()
        em.setEventHandler(self,
                           andSelector: #selector(getUrl(event:with:)),
                           forEventClass: AEEventClass(kInternetEventClass),
                           andEventID: AEEventID(kAEGetURL))

        NSApp.perform(#selector(NSApp.terminate(_:)), with: nil, afterDelay: 3)
    }

    @objc func getUrl(event: NSAppleEventDescriptor, with replyEvent: NSAppleEventDescriptor) {
        defer {
            NSApp.terminate(self)
        }

        guard let urlString = event.paramDescriptor(forKeyword: keyDirectObject)?.stringValue,
            let url = URL(string: urlString) else { return }

        launchBrowser(for: url)
    }

    func launchBrowser(for url: URL) {
        if let hostToCheck = url.host, config.rules.hosts.contains(hostToCheck) {
            open(url: url, in: config.browsers.alternative)
        } else if config.rules.substrings.first(where: { url.absoluteString.contains($0) }) != nil {
            open(url: url, in: config.browsers.alternative)
        } else {
            open(url: url, in: config.browsers.default)
        }
    }

    func open(url: URL, in browser: Config.BrowserBundleId) {
        let success = NSWorkspace.shared.open([url],
                                              withAppBundleIdentifier: browser,
                                              options: [],
                                              additionalEventParamDescriptor: nil,
                                              launchIdentifiers: nil)
        if !success {
            openInSafari(url)
        }
    }

    func openInSafari(_ url: URL) {
        NSWorkspace.shared.open([url],
                                withAppBundleIdentifier: "com.apple.Safari",
                                options: [],
                                additionalEventParamDescriptor: nil,
                                launchIdentifiers: nil)
    }
}
