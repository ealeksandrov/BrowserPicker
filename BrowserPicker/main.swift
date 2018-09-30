//
//  main.swift
//  BrowserPicker
//
//  Copyright © 2018 Evgeny Aleksandrov. All rights reserved.

import Cocoa

let app = NSApplication.shared
let appDelegate = AppDelegate()
app.setActivationPolicy(.prohibited)
app.delegate = appDelegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
