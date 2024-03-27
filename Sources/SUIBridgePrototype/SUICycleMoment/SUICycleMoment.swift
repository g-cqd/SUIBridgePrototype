//
//  SUICycleMoment.swift
//
//
//  Created by Guillaume Coquard on 25/03/24.
//

import Foundation

public struct SUICycleMoment: OptionSet {

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public let rawValue: Int

    public static let initialization   = SUICycleMoment(rawValue: 1 << 0)
    public static let making           = SUICycleMoment(rawValue: 1 << 1)
    public static let updating         = SUICycleMoment(rawValue: 1 << 2)

    public static let all: SUICycleMoment = [.initialization,.making,.updating]
    public static let none: SUICycleMoment = []
}
