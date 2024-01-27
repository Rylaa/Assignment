//
//  Context.swift
//  Teknasyon-Assignment
//
//  Created by Yusuf Demirkoparan on 26.01.2024.
//

import UIKit
import Network
import Core

protocol Context {
    var network: NetworkClientService { get set }
}

class DependencyContainer: Context {
    var network: NetworkClientService
    
    init() {
        let networkClient = NetworkClient()
        networkClient.initializeSessionManagers()
        
        network = networkClient
    }
}
