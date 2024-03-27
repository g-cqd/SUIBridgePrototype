//
//  UIEdgeInsets.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 21/03/24.
//

import UIKit

extension UIEdgeInsets: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(top)
        hasher.combine(bottom)
        hasher.combine(left)
        hasher.combine(right)
    }
}
