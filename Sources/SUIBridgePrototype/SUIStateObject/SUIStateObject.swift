//
//  SUIStateObject.swift
//
//
//  Created by Guillaume Coquard on 22/03/24.
//

import UIKit

public protocol SUIStateObject: Identifiable where Root : UIView, ID == Root.ID {
    associatedtype Root
    typealias BridgedRoot = SUIBridgePrototypeRoot<Root>
    typealias RootConfiguration = SUIConfiguration<Root>

    var insert: Bool { get }
    var root: BridgedRoot? { get }
    var checker: [AnyHashable:Any?]? { get set }
    var configurations: RootConfiguration? { get set }

    func set(root: BridgedRoot)
}
