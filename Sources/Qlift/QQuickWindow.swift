//
// QQuickWindow.swift
//
//
// Created by Dmitriy Borovikov on 06.12.2021.
//

import CQlift

open class QQuickWindow: QWindow {

    // MARK: Init/deinit

    public override init(parent: QWindow? = nil) {
        super.init(ptr: QQuickWindow_new(parent?.ptr))
    }

    public override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        checkDeleteQtObj()
    }

    // MARK: Propeties

    public var color: QColor {
        get { .init(ptr: QQuickWindow_color(ptr)) }
        set { QQuickWindow_setColor(ptr, newValue.ptr) }
    }

    // MARK: Functions
    public func beginExternalCommands() {
        QQuickWindow_beginExternalCommands(ptr)
    }
    public func endExternalCommands() {
        QQuickWindow_endExternalCommands(ptr)
    }
    public func setPersistentSceneGraph(persistent: Bool) {
        QQuickWindow_setPersistentSceneGraph(ptr, persistent)
    }
    public func isPersistentSceneGraph() {
        QQuickWindow_isPersistentSceneGraph(ptr)
    }
    public func isSceneGraphInitialized() {
        QQuickWindow_isSceneGraphInitialized(ptr)
    }
    public func grabWindow() -> QImage {
        .init(ptr: QQuickWindow_grabWindow(ptr))
    }
    public func effectiveDevicePixelRatio() -> Double {
        QQuickWindow_effectiveDevicePixelRatio(ptr)
    }
}
