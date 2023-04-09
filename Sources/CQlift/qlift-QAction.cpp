#include <QAction>

#include "qlift-QAction.h"

[[maybe_unused]] void *
QAction_new(void *icon, const char *text, void *parent) {
    if (icon != nullptr) {
// QAction::QAction(const QIcon &icon, const QString &text, QObject *parent = nullptr)
// QAction::QAction(const QIcon &icon, const QString &text, QObject *parent = nullptr)
        return static_cast<void *>(
            new QAction{*static_cast<QIcon *>(icon),
                        text,
                        static_cast<QObject *>(parent)});
    }

    if (text != nullptr) {
        return static_cast<void *>(
            new QAction{text, static_cast<QObject *>(parent)});
    }

    return static_cast<void *>(new QAction{static_cast<QObject *>(parent)});
}

[[maybe_unused]] CQString QAction_text(void *action) {
    auto text = static_cast<QAction *>(action)->text();
    return CQString { text.utf16(), text.size() };
}

[[maybe_unused]] void QAction_setText(void *action, const char *text) {
    static_cast<QAction *>(action)->setText(text);
}

[[maybe_unused]] void QAction_triggered_connect(void *action,
                                                void *receiver,
                                                void *context,
                                                void (*slot_ptr)(void *,
                                                                 bool)) {
    QObject::connect(
        static_cast<QAction *>(action),
        &QAction::triggered,
        static_cast<QObject *>(receiver),
        [context, slot_ptr](bool checked) { (*slot_ptr)(context, checked); });
}
