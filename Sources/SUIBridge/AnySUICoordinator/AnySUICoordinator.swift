//
//  AnySUICoordinator.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import UIKit

public final class AnySUICoordinator: NSObject, SUICoordinatorObject {

    public typealias Root = UIView
    public typealias BridgedRoot = SUIBridgeRoot<Root>

    public private(set) var id: ID!

    public var root: BridgedRoot = .init(.constant(.init()))
    private override init() {
        super.init()
        self.id = .init(self)
    }

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
