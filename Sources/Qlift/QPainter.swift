//
//  QPainter.swift
//
//
//  Created by Dmitriy Borovikov on 10.05.2021.
//

import CQlift

public class QPainter {
    public var ptr: UnsafeMutableRawPointer!

    public init(pixmap: QPixmap) {
        self.ptr = QPainter_new_device(pixmap.ptr)
    }

    public init(image: QImage) {
        self.ptr = QPainter_new_device(image.ptr)
    }

    deinit {
        if self.ptr != nil {
            QPainter_delete(self.ptr)
            self.ptr = nil
        }
    }

    public func setPen(_ pen: QPen) {
        QPainter_setPen(ptr, pen.ptr)
    }

    public func setbrush(_ brush: QBrush) {
        QPainter_setbrush(ptr, brush.ptr)
    }

    public func setBackground(_ brush: QBrush) {
        QPainter_setBackground(ptr, brush.ptr)
    }

    public func setOpacity(_ opacity: Double) {
        QPainter_setOpacity(ptr, opacity)
    }

    public func drawLine(x1: Int32, y1: Int32, x2: Int32, y2: Int32) {
        QPainter_drawLine(ptr, x1, y1, x2, y2)
    }

    public func drawLineP(p1: QPoint, p2: QPoint) {
        QPainter_drawLineP(ptr, p1.ptr, p2.ptr)
    }

    public func drawRect(x1: Int32, y1: Int32, w: Int32, h: Int32) {
        QPainter_drawRectxy(ptr, x1, y1, w, h)
    }

    public func drawRect(rect: QRect) {
        QPainter_drawRect(ptr, rect.ptr)
    }

    public func drawEllipse(rect: QRect) {
        QPainter_drawEllipse(ptr, rect.ptr)
    }

    public func fillRect(rect: QRect, brush: QBrush) {
        QPainter_fillRectBrush(ptr, rect.ptr, brush.ptr)
    }

    public func fillRect(rect: QRect, color: QColor) {
        QPainter_fillRectColor(ptr, rect.ptr, color.ptr)
    }

    public func end() {
        QPainter_end(ptr)
    }
    
    public func drawText(position: QPoint, text: String) {
        QPainter_drawText(ptr, position.ptr, text)
    }
    public func drawText(x: Int32, y: Int32, text: String) {
        QPainter_drawText1(ptr, x, y, text)
    }
    public func drawText(rectangle: QRect, flags: Qt.Alignment, text: String, boundingRect: QRect? = nil) {
        QPainter_drawText2(ptr, rectangle.ptr, flags.rawValue, text, boundingRect?.ptr)
    }
    public func drawText(x: Int32, y: Int32, width: Int32, height: Int32, flags: Qt.Alignment, text: String, boundingRect: QRect? = nil) {
        QPainter_drawText3(ptr, x, y, width, height, flags.rawValue, text, boundingRect?.ptr)
    }
    public func setFont(_ font: QFont) {
        QPainter_setFont(ptr, font.ptr)
    }
}
