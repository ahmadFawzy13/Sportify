//
//  NetworkMonitor.swift
//  Sportify
//
//  Created by Abdullah Raed on 18/05/2025.
//

import Foundation
import Reachability

class NetworkMonitor {
    
    private static let reachability = try! Reachability()
    
    static func checkNetworkStatus() {
        switch reachability.connection {
        case .unavailable:
            <#code#>
        case .wifi:
            <#code#>
        case .cellular:
            <#code#>
        }
    }
    
}
