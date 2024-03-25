//
//  AnySUIState.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import UIKit

public final class AnySUIState: NSObject, Identifiable, SUIStateObject {

    public typealias Root = UIView
    public typealias BridgedRoot = SUIBridgeRoot<Root>

    static fileprivate private(set) var states: [ID: any SUIStateObject] = [:]

    public var insert: Bool = false
    public var root: BridgedRoot? = nil
    public var configurations: RootConfiguration? = nil
    public var checker: [AnyHashable : Any?]? = nil

    @discardableResult
    static public func insert(_ state: any SUIStateObject) -> Bool {
        Self.states.updateValue(state, forKey: state.id) != nil
    }

    @discardableResult
    static public func remove(_ id: ID) -> Bool {
        Self.states.removeValue(forKey: id) != nil
    }

    static public func get(for id: ID) -> (any SUIStateObject)? {
        Self.states[id]
    }

    public func set(root: BridgedRoot) {
        self.root = root
    }
}
