//
//  qlift-QQuickWindow.cpp
//  
//
//  Created by Dmitriy Borovikov on 06.12.2021.
//

#include "qlift-QQuickWindow.h"
#include <QQuickWindow>

[[maybe_unused]] void *QQuickWindow_new(void * _Nullable parent) {
    return new QQuickWindow(static_cast<QWindow *>(parent));
}
#if (QT_VERSION >= QT_VERSION_CHECK(5, 15, 0))
[[maybe_unused]] void QQuickWindow_beginExternalCommands(void *window) {
    static_cast<QQuickWindow *>(window)->beginExternalCommands();
}
[[maybe_unused]] void QQuickWindow_endExternalCommands(void *window) {
    static_cast<QQuickWindow *>(window)->endExternalCommands();
}
#endif
[[maybe_unused]] void QQuickWindow_setColor(void *window, const void *color) {
    static_cast<QQuickWindow *>(window)->setColor(*static_cast<const QColor *>(color));
}
[[maybe_unused]] void QQuickWindow_setPersistentSceneGraph(void *window, bool persistent) {
    static_cast<QQuickWindow *>(window)->setPersistentSceneGraph(persistent);
}
[[maybe_unused]] void *QQuickWindow_color(void *window) {
    auto r = static_cast<QQuickWindow *>(window)->color();
    return new QColor(r);
}
[[maybe_unused]] void *QQuickWindow_grabWindow(void *window) {
    auto r = static_cast<QQuickWindow *>(window)->grabWindow();
    return new QImage(r);
}
[[maybe_unused]] double QQuickWindow_effectiveDevicePixelRatio(void *window) {
    return static_cast<QQuickWindow *>(window)->effectiveDevicePixelRatio();
}
[[maybe_unused]] bool QQuickWindow_isPersistentSceneGraph(void *window) {
    return static_cast<QQuickWindow *>(window)->isPersistentSceneGraph();
}
[[maybe_unused]] bool QQuickWindow_isSceneGraphInitialized(void *window) {
    return static_cast<QQuickWindow *>(window)->isSceneGraphInitialized();
}
