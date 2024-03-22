//
//  +Hashable.swift
//  SUIBridgedView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import Foundation

// MARK: - Hashable
extension SUIBridgedViewRoot: Hashable {
    static public func == (lhs: SUIBridgedViewRoot, rhs: SUIBridgedViewRoot) -> Bool {
        lhs.uiView == rhs.uiView
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.uiView)
    }
}
