import CQlift


open class QToolButton: QAbstractButton {

    public enum ToolButtonStyle: Int32 {
        case ToolButtonIconOnly = 0
        case ToolButtonTextOnly
        case ToolButtonTextBesideIcon
        case ToolButtonTextUnderIcon
        case ToolButtonFollowStyle
    }

    public var style: ToolButtonStyle {
        get { .init(rawValue: QToolButton_toolButtonStyle(ptr)) ?? .ToolButtonFollowStyle }
        set { QToolButton_setToolButtonStyle(ptr, newValue.rawValue) }
    }
    
    // Icon not supported at the moment
    public init(parent: QWidget? = nil) {
        super.init(ptr: QToolButton_new(parent?.ptr))

        let rawSelf = Unmanaged.passUnretained(self).toOpaque()

        QToolButton_mousePressEvent_Override(self.ptr, rawSelf) { context, mouseEvent in
            let _self = Unmanaged<QToolButton>.fromOpaque(context!).takeUnretainedValue()
            _self.mousePressEvent(event: QMouseEvent(ptr: mouseEvent!))
        }
    }

    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        QToolButton_swiftHookCleanup(ptr);
        checkDeleteQtObj()
    }

    open override func mousePressEvent(event: QMouseEvent) {
        QToolButton_mousePressEvent(self.ptr, event.ptr)
    }
}
