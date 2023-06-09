import CQlift


open class QPushButton: QAbstractButton {
    public init(text: String = "", parent: QWidget? = nil) {
        super.init(ptr: QPushButton_new(nil, text, parent?.ptr))

        let rawSelf = Unmanaged.passUnretained(self).toOpaque()
        QPushButton_mousePressEvent_Override(self.ptr, rawSelf) { context, mouseEvent in
            let _self = Unmanaged<QPushButton>.fromOpaque(context!).takeUnretainedValue()
            _self.mousePressEvent(event: QMouseEvent(ptr: mouseEvent!))
        }
    }

    public init(icon: QIcon, text: String = "", parent: QWidget? = nil) {
        super.init(ptr: QPushButton_new(icon.ptr, text, parent?.ptr))

        let rawSelf = Unmanaged.passUnretained(self).toOpaque()
        QPushButton_mousePressEvent_Override(self.ptr, rawSelf) { context, mouseEvent in
            let _self = Unmanaged<QPushButton>.fromOpaque(context!).takeUnretainedValue()
            _self.mousePressEvent(event: QMouseEvent(ptr: mouseEvent!))
        }
    }

    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        QPushButton_swiftHookCleanup(ptr)
        checkDeleteQtObj()
    }

    open override func mousePressEvent(event: QMouseEvent) {
        QPushButton_mousePressEvent(self.ptr, event.ptr)
    }

    public var isFlat: Bool {
        get { QPushButton_isFlat(ptr) }
        set { QPushButton_setFlat(ptr, newValue) }
    }
}
