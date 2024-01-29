//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation
// swiftlint:disable all
public let Log = Logger(service: "-Assignment")

public final class Logger {
    /// Status Types to declare success and failure scenarios.
    private struct Status {
        static let debug = "🐛🐛 DEBUG 🐛🐛"
        static let error = "🛑 ERROR 🛑"
        static let info = "ℹ️ INFO ℹ️"
        static let warning = "⚠️ WARNING ⚠️"
    }

    private var name: String

    public init(service: String) {
        name = service
    }

    public func error(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.error)
    }

    public func debug(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.debug)
    }

    public func info(file: String = #file, line: Int = #line, function: String = #function, _ message: String) {
        toConsole(file: file, line: line, function: function, message: message, level: Logger.Status.info)
    }
}

// MARK: - Private Functions

private extension Logger {
    func toConsole(file: String = #file, line: Int = #line, function: String = #function, message: String?, level: String) {
        #if DEBUG
            var text = "[\(name)]"
            text += "[\(fileName(with: file)).\(function)] \(level)"
            if let msg = message {
                text += ": \(msg)"
            }
            print(text)
        #endif
    }

    func fileName(with path: String) -> String {
        let parser = path.split(separator: "/")
        if let fileName = String(parser.last ?? "").split(separator: ".").first {
            return String(fileName)
        }
        return ""
    }
}

func notImplemented(file: StaticString = #file, function: StaticString = #function, line: UInt = #line) -> Never {
    fail("Method not implemented.", file: file, function: function, line: line)
}

func fail(_ logMessage: String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line) -> Never {
    Log.error(logMessage)
    fatalError(logMessage, file: file, line: line)
}
