//
//  +UIViewRepresentable.swift
//  SUIWebView
//
//  Created by Guillaume Coquard on 19/03/24.
//

import SwiftUI

// MARK: - UIViewRepresentable
extension SUIBridgedViewRoot: UIViewRepresentable {
    
    public typealias Configuration = (UIViewType?) -> Void

    private func composeConfiguration(_ functions: [Configuration]) -> Configuration {
        ({ (value: UIViewType?) in
            for function in functions {
                function( value )
            }
        })
    }

    private func configure(_ uiView: UIViewType?) {
        composeConfiguration(Array(unwrapped.configurations.values))(uiView)
    }

    public func makeUIView(context: Context) -> UIViewType {
        configure(self.uiView)
        return self.uiView
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        configure(uiView)
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
