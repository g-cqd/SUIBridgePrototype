//
//  File.swift
//  
//
//  Created by Guillaume Coquard on 22/03/24.
//

import SwiftUI

protocol SUIBridgeRootObject: UIViewRepresentable, Identifiable
    where Root : IdentifiableUIView,
          UIViewType == Root,
          Coordinator == SUICoordinator<UIViewType>,
          ID == Root.ID
{

    associatedtype Root

    typealias StateType = SUIState<Root>

    var uiView: UIViewType { get }
    var state: Binding<StateType> { get }
    var unwrapped: StateType { get }

}
