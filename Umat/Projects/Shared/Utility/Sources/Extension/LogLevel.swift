//
//  LogLevel.swift
//  Utility
//
//  Created by 서원지 on 3/1/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import Foundation
import OSLog

public struct Log {
    public init(){}
    
    public enum LogLevel {
        /// 디버깅 로그
        case debug
        /// 문제 해결 정보
        case info
        /// 네트워크 로그
        case network
        /// 오류 로그
        case error
        case custom(category: String)
        
        fileprivate var category: String {
            switch self {
            case .debug:
                return "🟡 DEBUG"
            case .info:
                return "🟠 INFO"
            case .network:
                return "🔵 NETWORK"
            case .error:
                return "🔴 ERROR"
            case .custom(let category):
                return "🟢 \(category)"
            }
        }
        
        fileprivate var osLog: OSLog {
            switch self {
            case .debug:
                return OSLog.debug
            case .info:
                return OSLog.info
            case .network:
                return OSLog.network
            case .error:
                return OSLog.error
            case .custom:
                return OSLog.debug
            }
        }
        
        fileprivate var osLogType: OSLogType {
            switch self {
            case .debug:
                return .debug
            case .info:
                return .info
            case .network:
                return .default
            case .error:
                return .error
            case .custom:
                return .debug
            }
        }
        
        
    }
    
    
    static func log(_ message: Any, _ arguments: [Any], level: LogLevel) {
        #if DEBUG
        let extraMessage: String = arguments.map({ String(describing: $0) }).joined(separator: " ")
        os_log("%{public}@", log: level.osLog, type: level.osLogType, "\(message) \(extraMessage)")
        #endif
    }
}

