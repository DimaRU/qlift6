#pragma once

#include <stdbool.h>

#ifdef __cplusplus
#define LIBRARY_API [[maybe_unused]]
#else
#define LIBRARY_API
#endif

typedef unsigned short ushort;

#if __has_attribute(enum_extensibility)
# define CLOSED_ENUM_ATTR __attribute__((enum_extensibility(closed)))
# define OPEN_ENUM_ATTR __attribute__((enum_extensibility(open)))
#else
# define CLOSED_ENUM_ATTR
# define OPEN_ENUM_ATTR
#endif

#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum OPEN_ENUM_ATTR _name : _type _name; enum OPEN_ENUM_ATTR _name : _type
#endif
#ifndef NS_CLOSED_ENUM
#define NS_CLOSED_ENUM(_type, _name) enum CLOSED_ENUM_ATTR _name : _type _name; enum CLOSED_ENUM_ATTR _name : _type
#endif


#if __has_attribute(swift_name)
# define CF_SWIFT_NAME(_name) __attribute__((swift_name(#_name)))
#else
# define CF_SWIFT_NAME(_name)
#endif


#pragma clang assume_nonnull begin
typedef struct {
    const ushort * utf16;
    const long long size;
} CQString;
#pragma clang assume_nonnull end

typedef enum {
    CQactionEvent,
    CQchangeEvent,
    CQcloseEvent,
    CQcontextMenuEvent,
    CQdragEnterEvent,
    CQdragLeaveEvent,
    CQdragMoveEvent,
    CQdropEvent,
    CQenterEvent,
    CQfocusInEvent,
    CQfocusOutEvent,
    CQhideEvent,
    CQkeyPressEvent,
    CQkeyReleaseEvent,
    CQleaveEvent,
    CQmouseDoubleClickEvent,
    CQmouseMoveEvent,
    CQmousePressEvent,
    CQmouseReleaseEvent,
    CQmoveEvent,
    CQpaintEvent,
    CQresizeEvent,
    CQshowEvent,
    CQtabletEvent,
    CQwheelEvent,
    CQEvent
} CQTEventType;
