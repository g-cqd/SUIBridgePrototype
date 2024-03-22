//
//  SUIState.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

@Observable
open class SUIState<Root>: SUIStateObject where Root : IdentifiableUIView {

    public typealias ID = Root.ID
    public typealias BridgedRoot = SUIBridgeRoot<Root>

    @ObservationIgnored
    public var values: [Int:Int] = [:]
    public var configurations: [Int:BridgedRoot.Configuration] = [:]
    public var insert: Bool = false

    public private(set) var root: BridgedRoot? = nil {
        didSet {
            if let root = self.root {
                self.id = root.id
                if self.insert {
                    AnySUIState.insert(self)
                }
            }
        }
    }
    public var id: ID!

    public init(insert: Bool = false) {
        self.insert = insert
    }

    public func set(root: BridgedRoot) {
        self.root = root
    }

}
