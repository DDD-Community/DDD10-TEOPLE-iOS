//
//  Logger.swift
//  Utility
//
//  Created by Gordon Choi on 2/21/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

public enum Logger {
    public static func print(_ items: Any, file: String = #fileID, function: String = #function, line: Int = #line) {
        #if DEBUG
        Swift.print()
        Swift.print("🟩 Log at \(file)")
        Swift.print("🟩 Function: \(function), line: \(line)")
        Swift.print("🟩")
        Swift.print("🟩", items)
        Swift.print()
        #endif
    }
    
    public static func printArray(_ array: [Any], file: String = #fileID, function: String = #function, line: Int = #line) {
        #if DEBUG
        Swift.print()
        Swift.print("🟩 Log at \(file)")
        Swift.print("🟩 Function: \(function), line: \(line)")
        Swift.print("🟩")
        for item in array {
            Swift.print("🟩", item)
        }
        Swift.print()
        #endif
    }
}
