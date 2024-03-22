//
//  SUIBridgeRoot.swift
//  SUIBridge
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI

public struct SUIBridgeRoot<Root>: SUIBridgeRootObject where Root : IdentifiableUIView {

    public typealias UIViewType = Root
    public typealias StateType = SUIState<UIViewType>
    public typealias Coordinator = SUICoordinator<UIViewType>
    public typealias ID = Root.ID

    internal var uiView: Root
    internal var state: Binding<StateType>
    internal var unwrapped: StateType { self.state.wrappedValue }

    public let id: ID

    public init(_ state: Binding<StateType>) {
        let view = UIViewType(frame: .zero)
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
        self.state.wrappedValue.set(root: self)
    }

    public init(_ state: Binding<StateType>, _ view: UIViewType = .init(frame: .zero)) {
        let id = view.id
        self.uiView = view
        self.id = id
        self.state = state
        self.state.wrappedValue.set(root: self)
    }

}
