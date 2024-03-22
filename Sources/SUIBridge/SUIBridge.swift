//
//  SUIBridge.swift
//  SUIBridge
//
//  Created by Guillaume Coquard on 20/03/24.
//

import SwiftUI

public struct SUIBridge<Root>: View where Root : IdentifiableUIView {

    public typealias BridgedRoot = SUIBridgeRoot<Root>
    public typealias StateType = SUIState<Root>

    @State public var state: StateType

    public init(_ state: StateType = .init()) {
        self.state = state
    }

    public var body: some View {
        BridgedRoot($state)
    }
}

extension SUIBridge {
    public func set<A:Hashable>(
        _ path: ReferenceWritableKeyPath<Root,A>,
        to value: A
    ) -> Self {
        let pathHash = path.hashValue
        let valueHash = value.hashValue
        let maybe = self.state.values[pathHash]
        if maybe == nil || maybe! != valueHash {
            self.state.values.updateValue(valueHash, forKey: pathHash)
            self.state.configurations
                .updateValue({
                    (view: Root?) in
                    view?[keyPath: path] = value
                }, forKey: pathHash)
        }
        return self
    }
    
    public func set<A:Hashable, B:Hashable>(
        _ path: ReferenceWritableKeyPath<Root,B>,
        computing action: @escaping (A?) -> B?
    ) -> Self {
        let pathHash = path.hashValue
        let value: B? = action(state.root?.uiView[keyPath: path] as? A)
        let valueHash = value.hashValue
        let maybe = self.state.values[pathHash]
        if (maybe == nil || maybe! != valueHash) && value != nil {
            self.state.values.updateValue(valueHash, forKey: pathHash)
            self.state.configurations
                .updateValue({ (view: Root?) in view?[keyPath: path] = value! }, forKey: pathHash)
        }
        return self
    }
}
