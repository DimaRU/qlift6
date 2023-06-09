import CQlift


open class QBoxLayout: QLayout {
    public init(direction: Int32 = 0, parent: QWidget? = nil) {
        super.init(ptr: QBoxLayout_new(direction, parent?.ptr))
    }

    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        checkDeleteQtObj()
    }

    public var geometry: QRect? {
        get { QRect(ptr: QBoxLayout_geometry(self.ptr)) }
        set { QBoxLayout_setGeometry(self.ptr, newValue?.ptr) }
    }

    public override func add(item: QLayoutItem) {
        QBoxLayout_addItem(self.ptr, item.qtPtr)
        item.swiftOwership = false
    }

    public func add(layout: QLayout, stretch: Int32 = 0) {
        QBoxLayout_addLayout(self.ptr, layout.qtPtr, stretch)
    }

    public func add(widget: QWidget, stretch: Int32 = 0, alignment: Qt.Alignment = Qt.Alignment(rawValue: 0)) {
        QBoxLayout_addWidget(self.ptr, widget.ptr, stretch, alignment.rawValue)
    }

    public override func add(widget: QWidget) {
        self.add(widget: widget, stretch: 0)
    }

    public func setStretch(index: Int32, stretch: Int32) {
        QBoxLayout_setStretch(ptr, index, stretch)
    }

    public func stretch(index: Int32) -> Int32 {
        QBoxLayout_stretch(ptr, index)
    }

    public func count() -> Int32 {
        QBoxLayout_count(ptr)
    }

    public func insertItem(index: Int32, item: QLayoutItem) {
        QBoxLayout_insertItem(ptr, index, item.qtPtr)
        item.swiftOwership = false
    }

    public func insertLayout(index: Int32, layout: QLayout, stretch: Int32 = 0) {
        QBoxLayout_insertLayout(ptr, index, layout.ptr, stretch)
    }

    public func insertSpacerItem(index: Int32, spacerItem: QSpacerItem) {
        QBoxLayout_insertSpacerItem(ptr, index, spacerItem.ptr)
    }

    public func insertSpacing(index: Int32, size: Int32) {
        QBoxLayout_insertSpacing(ptr, index, size)
    }

    public func insertStretch(index: Int32, stretch: Int32 = 0) {
        QBoxLayout_insertStretch(ptr, index, stretch)
    }

    public func insertWidget(index: Int32, widget: QWidget, stretch: Int32 = 0, alignment: Qt.Alignment = []) {
        QBoxLayout_insertWidget(ptr, index, widget.ptr, stretch, alignment.rawValue)
    }
}
