//
// DraggableScrollView.swift
//

import Cocoa

class DraggableScrollView: NSScrollView {

	var inDrag: Bool = false
	var downOrigin: NSPoint! = nil
	var downPoint: NSPoint! = nil
	
	override func mouseDown(with event: NSEvent) {
		self.downOrigin = self.contentView.visibleRect.origin
		self.downPoint = event.locationInWindow
		
		self.inDrag = true
		self.window?.invalidateCursorRects(for: self)
	}
	
	override func mouseUp(with event: NSEvent) {
		self.inDrag = false
		self.window?.invalidateCursorRects(for: self)
	}
	
	override func mouseDragged(with event: NSEvent) {
		let currentPoint: NSPoint = event.locationInWindow
		let deltaX: CGFloat = currentPoint.x - downPoint.x
		let deltaY: CGFloat = currentPoint.y - downPoint.y
		let draggedPoint: NSPoint = NSPoint(x: self.downOrigin.x - deltaX, y: self.downOrigin.y + deltaY)
		
		self.contentView.scroll(draggedPoint)
	}
	
	override func resetCursorRects() {
		super.resetCursorRects()
		
		if self.inDrag {
			self.addCursorRect(self.bounds, cursor: NSCursor.closedHand)
		}
	}
	
}
