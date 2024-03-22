//
//  SUIStateObject.swift
//
//
//  Created by Guillaume Coquard on 22/03/24.
//

import Foundation

protocol SUIStateObject: Identifiable where Root : IdentifiableUIView {
    associatedtype Root
    typealias BridgedRoot = SUIBridgedViewRoot<Root>

    var insert: Bool { get }
    var root: BridgedRoot? { get }
    var values: [Int:Int] { get set }
    var configurations: [Int:BridgedRoot.Configuration] { get set }

    func set(root: BridgedRoot)
}
