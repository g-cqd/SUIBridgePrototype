//
//  AnySUICoordinator.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import Foundation

final class AnySUICoordinator: NSObject, SUICoordinatorObject {

    public typealias Root = IdentifiableUIView
    public typealias BridgedRoot = SUIBridgedViewRoot<Root>

    internal var root: BridgedRoot = .init(.constant(.init()))
    private override init() { super.init() }

    static fileprivate private(set) var coordinators: [ID:any SUICoordinatorObject] = [:]

    @discardableResult static public func insert(_ coordinator: any SUICoordinatorObject) -> Bool {
        Self.coordinators.updateValue(coordinator, forKey: coordinator.id) != nil
    }

    @discardableResult static public func remove(_ id: ID) -> Bool {
        Self.coordinators.removeValue(forKey: id) != nil
    }

    static public func get(for id: ID) -> (any SUICoordinatorObject)? {
        Self.coordinators[id]
    }
}
