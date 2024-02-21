//
//  Logger.swift
//  Utility
//
//  Created by Gordon Choi on 2/21/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation

/// Log 기록에 사용되는 Logger입니다. Debug 타겟에서만 작동합니다.
public enum Logger {
    /// print, debugPrint 대신 사용할 수 있는 print 메서드입니다.
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
    
    /// 배열 아이템을 출력하는 print 메서드입니다.
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
