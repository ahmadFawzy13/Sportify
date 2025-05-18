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
    
    static func isNetworkAvailable() -> Bool {
        switch reachability.connection {
        case .unavailable:
            AlertManager.showErrorAlert(title: "Network Issue", bodyContent: "Ops! There seems to be a network issue. Please try again later or check your connectivity", buttonTitle: "Retry") { _ in

            }
            return false
        case .wifi:
            print("Network Available")
            return true
        case .cellular:
            print("Network Available")
            return true
        }
    }
    
}
