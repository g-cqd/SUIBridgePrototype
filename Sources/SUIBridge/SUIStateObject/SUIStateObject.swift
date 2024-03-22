//
//  SUIStateObject.swift
//
//
//  Created by Guillaume Coquard on 22/03/24.
//

import Foundation

public protocol SUIStateObject: Identifiable where Root : IdentifiableUIView {
    associatedtype Root
    typealias BridgedRoot = SUIBridgeRoot<Root>

    var insert: Bool { get }
    var root: BridgedRoot? { get }
    var values: [Int:Int] { get set }
    var configurations: [Int:BridgedRoot.Configuration] { get set }

    func set(root: BridgedRoot)
}
