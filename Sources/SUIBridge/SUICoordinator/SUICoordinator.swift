//
//  SUICoordinator.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit
import SwiftUI

@Observable
open class SUICoordinator<Root>: NSObject, Identifiable, SUICoordinatorObject where Root : UIView {

    public typealias BridgedRoot = SUIBridgeRoot<Root>
    public typealias ID = BridgedRoot.ID

    public private(set) var id: ID!

    public var root: BridgedRoot

    required public init(_ root: BridgedRoot) {
        self.id = root.id
        self.root = root
        super.init()
        Self.insert(self)
    }
}
