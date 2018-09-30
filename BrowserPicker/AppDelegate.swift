//
//  AppDelegate.swift
//  BrowserPicker
//
//  Copyright © 2018 Evgeny Aleksandrov. All rights reserved.

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

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
        if url.host == "meet.google.com" {
            openInFirefox(url)
        } else {
            openInSafari(url)
        }
    }

    func openInSafari(_ url: URL) {
        NSWorkspace.shared.open([url],
                                withAppBundleIdentifier:"com.apple.Safari",
                                options: [],
                                additionalEventParamDescriptor: nil,
                                launchIdentifiers: nil)
    }

    func openInFirefox(_ url: URL) {
        let success = NSWorkspace.shared.open([url],
                                             withAppBundleIdentifier:"org.mozilla.firefox",
                                             options: [],
                                             additionalEventParamDescriptor: nil,
                                             launchIdentifiers: nil)
        if !success {
            openInSafari(url)
        }
    }
}
