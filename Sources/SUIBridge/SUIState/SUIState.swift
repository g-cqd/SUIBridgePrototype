//
//  SUIState.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

@Observable
public final class SUIState<Root>: SUIStateObject where Root : IdentifiableUIView {

    public typealias ID = Root.ID
    public typealias BridgedRoot = SUIBridgeRoot<Root>

    @ObservationIgnored
    internal var values: [Int:Int] = [:]
    internal var configurations: [Int:BridgedRoot.Configuration] = [:]
    internal var insert: Bool = false

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

    internal func set(root: BridgedRoot) {
        self.root = root
    }

}
