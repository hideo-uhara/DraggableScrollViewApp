//
// WindowController.swift
//

import Cocoa

class WindowController: NSWindowController {
	
	override func windowDidLoad() {
		super.windowDidLoad()
	}
}

extension WindowController: NSWindowDelegate {
	
	func window(_ window: NSWindow, willUseFullScreenPresentationOptions proposedOptions: NSApplication.PresentationOptions = []) -> NSApplication.PresentationOptions {
		
		var proposedOptions: NSApplication.PresentationOptions = proposedOptions
		
		// フルスクリーン時ツールバー自動非表示を追加
		proposedOptions.insert(.autoHideToolbar)
		
		return proposedOptions
	}
	
}
