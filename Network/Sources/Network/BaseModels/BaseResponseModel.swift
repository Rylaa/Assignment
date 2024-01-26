//
//  File.swift
//
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import Foundation

public struct BaseResponse<T: Codable>: Codable {
    public let status: Bool
    public var data: T?
    public var message: String?
}
