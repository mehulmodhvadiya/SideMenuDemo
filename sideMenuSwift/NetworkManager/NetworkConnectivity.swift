//
//  NetworkConnectivity.swift
//  Abc
//
//  Created by Vishal Nandoriya on 2/21/18.
//  Copyright © 2018 Abc. All rights reserved.
//

import Foundation
import Alamofire

class NetworkConnectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
