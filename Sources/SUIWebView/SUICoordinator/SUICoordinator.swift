//
//  SUICoordinator.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import WebKit
import SwiftUI

@Observable
public class SUICoordinator<Root>: NSObject, Identifiable, SUICoordinatorObject where Root : IdentifiableUIView {

    public typealias BridgedRoot = SUIBridgedViewRoot<Root>

    public private(set) var id: BridgedRoot.ID

    internal var root: BridgedRoot

    required init(_ root: BridgedRoot) {
        self.id = root.id
        self.root = root
        super.init()
        Self.insert(self)
    }
}
