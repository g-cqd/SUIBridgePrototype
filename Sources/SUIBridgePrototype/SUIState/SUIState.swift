//
//  SUIState.swift
//  SUIBridgePrototype
//
//  Created by Guillaume Coquard on 19/03/24.
//

import UIKit

@Observable
open class SUIState<Root>: SUIStateObject where Root : UIView {

    public typealias ID = Root.ID
    public typealias BridgedRoot = SUIBridgePrototypeRoot<Root>
    public typealias RootConfiguration = SUIConfiguration<Root>

    @ObservationIgnored
    public var checker: [AnyHashable : Any?]? = [:]
    public var configurations: RootConfiguration? = .init()
    public var insert: Bool = false

    private(set) public var root: BridgedRoot? = nil {
        didSet {
            if let root = self.root {
                self.id = root.id
                if self.insert {
                    AnySUIState.insert(self)
                }
            }
        }
    }
    private(set) var id: ID!

    public init(insert: Bool = false) {
        self.insert = insert
    }

    public func set(root: BridgedRoot) {
        self.root = root
    }

}
