//
//  +Hashable.swift
//  SUIBridgePrototype
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

// MARK: - Hashable
extension SUIBridgePrototypeRoot: Hashable {
    static public func == (lhs: SUIBridgePrototypeRoot, rhs: SUIBridgePrototypeRoot) -> Bool {
        lhs.uiView == rhs.uiView
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.uiView)
    }
}
