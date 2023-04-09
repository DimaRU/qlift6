//
//  QEnterEvent.swift
//  
//
//  Created by Dmitriy Borovikov on 29.01.2022.
//

import CQlift

public class QEnterEvent: QInputEvent {
    override init(ptr: UnsafeMutableRawPointer) {
        super.init(ptr: ptr)
    }

    deinit {
        checkDeleteQtObj()
    }
}
