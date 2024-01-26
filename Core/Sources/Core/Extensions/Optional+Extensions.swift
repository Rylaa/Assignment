//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit

// swiftlint:disable all
public extension Optional where Wrapped == Int {
    var toIntValueOrZero: Int {
        return self ?? .zero
    }

    var toCGFloatValueOrZero: CGFloat {
        return CGFloat(toIntValueOrZero)
    }

    var toStringValueOrZero: String {
        return "\(self ?? .zero)"
    }
}

public extension Optional where Wrapped == Bool {
    var toBoolValueOrFalse: Bool {
        return self ?? false
    }
}

public extension Optional where Wrapped == CGFloat {
    var toCGFloatValueOrZero: CGFloat {
        return self ?? .zero
    }
}

public extension Optional where Wrapped == Double {
    var toDoubleValueOrZero: Double {
        return self ?? .zero
    }
}

public extension Optional where Wrapped == Decimal {
    var toDecimalValueOrZero: Decimal {
        return self ?? .zero
    }
}

public extension Optional where Wrapped == String {
    var toStringValueOrEmpty: String {
        return self ?? ""
    }

    var toIntValueOrZero: Int {
        return Int(toStringValueOrEmpty) ?? .zero
    }

    var toDoubleValueOrZero: Double {
        return Double(toStringValueOrEmpty) ?? .zero
    }
}

public extension Optional {
    func unwrap() -> Wrapped? {
        switch self {
        case let .some(value):
            return value
        case .none:
            return nil
        }
    }
}
