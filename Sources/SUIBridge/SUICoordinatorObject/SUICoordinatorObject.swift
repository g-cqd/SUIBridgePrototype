//
//  SUICoordinatorObject.swift
//  SUIBridge
//
//
//  Created by Guillaume Coquard on 22/03/24.
//

import UIKit
import OSLog

public protocol SUICoordinatorObject: NSObject, Identifiable where Root : UIView, ID == Root.ID {
    associatedtype Root
    typealias BridgedRoot = SUIBridgeRoot<Root>
    var id: BridgedRoot.ID { get }
    var root: BridgedRoot { get }
}
