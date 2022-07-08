//
// ViewController.swift
//

import Cocoa

class ViewController: NSViewController {
	
	@IBOutlet var scrollView: NSScrollView!
	@IBOutlet var imageView: NSImageView!
	@IBOutlet var largeView: NSView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let origImage: NSImage = NSImage(named: "IMG_3802.jpeg")!
		
		// dpiを無視
		let imageRep: NSImageRep = origImage.representations.first!
		let imageSize: NSSize = NSSize(width: imageRep.pixelsWide, height: imageRep.pixelsHigh)
		let image: NSImage = NSImage(size: imageSize)
		
		image.addRepresentation(imageRep)
		self.imageView.image = image
		self.imageView.imageScaling = .scaleNone
		self.imageView.setFrameSize(self.imageView.image!.size)
		
		self.scrollView.documentView = self.imageView
	}
	
	@IBAction func segmentedControlAction(_ sender: NSSegmentedControl) {
		
		switch sender.selectedSegment {
		case 0:
			self.scrollView.documentView = self.imageView
		case 1:
			self.scrollView.documentView = self.largeView
		default:
			break
		}
	}

	override var representedObject: Any? {
		didSet {
		}
	}
}

