//
//  SUICoordinatorObject.swift
//  SUIBridge
//
//
//  Created by Guillaume Coquard on 22/03/24.
//

import UIKit
import OSLog

protocol SUICoordinatorObject: NSObject, Identifiable where Root : IdentifiableUIView, ID == Root.ID {

    associatedtype Root
    typealias BridgedRoot = SUIBridgeRoot

    var root: BridgedRoot<Root> { get }

}
