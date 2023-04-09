//
//  qlift-QEnterEvent.cpp
//  
//
//  Created by Dmitriy Borovikov on 29.01.2022.
//

#include <QEnterEvent>
#include "qlift-QEnterEvent.h"

[[maybe_unused]] void QEnterEvent_delete(void *enterEvent) {
    delete static_cast<QEnterEvent *>(enterEvent);
}

