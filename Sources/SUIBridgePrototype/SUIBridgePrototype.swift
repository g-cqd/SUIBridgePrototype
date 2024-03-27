//
//  SUIBridgePrototype.swift
//  SUIBridgePrototype
//
//  Created by Guillaume Coquard on 20/03/24.
//

import SwiftUI

public struct SUIBridgePrototype<Root>: View where Root : UIView {

    public typealias BridgedRoot = SUIBridgePrototypeRoot<Root>
    public typealias RootConfiguration = SUIConfiguration<Root>
    public typealias StateType = SUIState<Root>

    @State public var state: StateType

    public init(_ state: StateType = .init()) {
        self.state = state
    }

    public var body: some View {
        BridgedRoot($state)
    }
}

extension SUIBridgePrototype {

    
    public func set<A:Hashable>(
        _ path: ReferenceWritableKeyPath<Root,A>,
        to value: A,
        during moment: SUICycleMoment = .all
    ) -> Self {
        let pathHash = path.hashValue
        let maybe = self.state.checker![pathHash]
        if (maybe == nil || maybe! as! A != value) && value != nil {
            self.state.checker!.updateValue(value, forKey: pathHash)
            self.state.configurations!.set(
                { (view: Root?) in view?[keyPath: path] = value },
                forKey: pathHash,
                at: moment
            )
        }
        return self
    }
    
    public func set<A:Hashable, B:Hashable>(
        _ path: ReferenceWritableKeyPath<Root,B>,
        during moment: SUICycleMoment = .all,
        computing action: @escaping (A?) -> B?
    ) -> Self {
        let pathHash = path.hashValue
        let value: B? = action(state.root?.uiView[keyPath: path] as? A)
        let maybe = self.state.checker![pathHash]
        if (maybe == nil || maybe! as? B != value) && value != nil {
            self.state.checker!.updateValue(value, forKey: pathHash)
            self.state.configurations!.set(
                ({ (view: Root?) in view?[keyPath: path] = value! }) as! BridgedRoot.Configuration,
                forKey: pathHash,
                at: moment
            )
        }
        return self
    }
}
