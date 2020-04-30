//
//  LogStore.swift
//  LogStoreDevelopment
//
//  Created by Andreas Eckerle on 29.04.20.
//  Copyright © 2020 Andreas Eckerle. All rights reserved.
//

import Foundation

struct LogStore {
    static var log: [String] = []
}

public func printLog(_ string: String) {
    print(string)
    
    LogStore.log.append(string)
}
