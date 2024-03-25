//
//  +UIViewRepresentable.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI

// MARK: - UIViewRepresentable
extension SUIBridgeRoot: UIViewRepresentable {
    
    public typealias Configuration = (UIViewType?) -> Void

    internal func composeConfiguration(_ functions: any Sequence<Configuration>) -> Configuration {
        ({ (value: UIViewType?) in
            for function in functions {
                function( value )
            }
        })
    }

    internal func configure(_ uiView: UIViewType?, at moment: SUICycleMoment = .all) {
        composeConfiguration(unwrapped.configurations!.get(for: moment))(uiView)
    }

    public func makeUIView(context: Context) -> UIViewType {
        configure(self.uiView, at: .making)
        return self.uiView
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        configure(self.uiView, at: .updating)
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
