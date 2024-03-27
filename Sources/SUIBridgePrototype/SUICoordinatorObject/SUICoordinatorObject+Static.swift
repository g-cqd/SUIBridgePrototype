//
//  SUICoordinatorObject+Static.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import Foundation

extension SUICoordinatorObject {
    @discardableResult static public func insert(_ coordinator: any SUICoordinatorObject) -> Bool {
        AnySUICoordinator.insert(coordinator)
    }

    @discardableResult static public func remove(_ id: ID) -> Bool {
        AnySUICoordinator.remove(id)
    }

    static public func get(for id: ID) -> (any SUICoordinatorObject)? {
        AnySUICoordinator.get(for: id)
    }
}
