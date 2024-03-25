//
//  SUIConfigurations.swift
//
//
//  Created by Guillaume Coquard on 25/03/24.
//

import UIKit

open class SUIConfiguration<Root> where Root : UIView {

    typealias BridgedRoot = SUIBridgeRoot<Root>
    typealias Key = AnyHashable
    typealias Value = BridgedRoot.Configuration
    typealias Moment = SUICycleMoment

    var configurations: [Key:Value] = [:]
    var moments: [Key:SUICycleMoment] = [:]

    func updateValue(_ value: @escaping Value, forKey key: Key) -> Void {
            self.configurations.updateValue(value, forKey: key)
    }

    func set(_ value: @escaping Value, forKey key: Key, at moment: Moment) -> Void {
            self.updateValue(value, forKey: key)
            self.moments.updateValue(moment, forKey: key)
    }

    func get(for moment: Moment) -> any Sequence<Value> {
        self.moments
            .filter { $0.value.contains(moment) }
            .keys
            .compactMap { self.configurations[$0] }
    }

}
