//
//  +Hashable.swift
//  SUIBridge
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

// MARK: - Hashable
extension SUIBridgeRoot: Hashable {
    static public func == (lhs: SUIBridgeRoot, rhs: SUIBridgeRoot) -> Bool {
        lhs.uiView == rhs.uiView
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.uiView)
    }
}
