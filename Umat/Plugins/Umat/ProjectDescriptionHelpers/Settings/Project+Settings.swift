//
//  Project+Settings.swift
//  MyPlugin
//
//  Created by Gordon Choi on 1/24/24.
//

import ProjectDescription

public extension Settings {
    static let appMainSettings: Settings = .settings(
        base: [
            "PRODUCT_NAME": .string(Project.Environment.appName),
            "CFBundleDisplayName": .string(Project.Environment.appName),
            "MARKETING_VERSION": .string(.appVersion()),
            "AS_AUTHENTICATION_SERVICES_ENABLED": "YES",
            //            "PUSH_NOTIFICATIONS_ENABLED": "YES", // 푸시 구현시 활성화
            //            "ENABLE_BACKGROUND_MODES": "YES", // 백그라운드 모드 구현시 활성화
            //            "BACKGROUND_MODES": "remote-notification", // 푸시 구현시 활성화
            "CURRENT_PROJECT_VERSION": .string(.appBuildVersion()),
            "CODE_SIGN_IDENTITY": "iPhone Developer",
//            "CODE_SIGN_STYLE": "Automatic", // 인증서 공유 후 이 부분 비활성화
            "DEVELOPMENT_TEAM": .string(Project.Environment.organizationTeamId),
            "VERSIONING_SYSTEM": "apple-generic",
            "DEBUG_INFORMATION_FORMAT": "DWARF with dSYM File",
            "DEVELOPMENT_ASSET_PATH": "\"Resources/Preview Content\""
        ],
        configurations: [
            .debug(name: .debug, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "DISPLAY_NAME": .string(Project.Environment.appName),
                "PROVISIONING_PROFILE_SPECIFIER": "Umai",
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ]),
            .release(name: .release, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "DISPLAY_NAME": .string(Project.Environment.appName),
                "PROVISIONING_PROFILE_SPECIFIER": "Umai",
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ])
        ],
        defaultSettings: .recommended
    )
    
    static let appDemoSettings: Settings = .settings(
        base: [
            "PRODUCT_NAME": .string(Project.Environment.appName),
            "CFBundleDisplayName": .string(Project.Environment.appName),
            "MARKETING_VERSION": .string(.appVersion()),
            "AS_AUTHENTICATION_SERVICES_ENABLED": "YES",
            "CURRENT_PROJECT_VERSION": .string(.appBuildVersion()),
            "CODE_SIGN_IDENTITY": "iPhone Developer",
            "DEVELOPMENT_TEAM": .string(Project.Environment.organizationTeamId),
            "VERSIONING_SYSTEM": "apple-generic",
            "DEBUG_INFORMATION_FORMAT": "DWARF with dSYM File",
            "DEVELOPMENT_ASSET_PATH": "\"Resources/Preview Content\""
        ],
        configurations: [
            .debug(name: .debug, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "DISPLAY_NAME": .string(Project.Environment.appName),
                "PROVISIONING_PROFILE_SPECIFIER": "UmaiDemo",
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ]),
            .release(name: .release, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "DISPLAY_NAME": .string(Project.Environment.appName),
                "PROVISIONING_PROFILE_SPECIFIER": "UmaiDemo",
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ])
        ],
        defaultSettings: .recommended
    )
    
    static let appBaseSettings: Settings = .settings(
        base: [
            "PRODUCT_NAME": .string(Project.Environment.appName),
            "MARKETING_VERSION": .string(.appVersion()),
            "CURRENT_PROJECT_VERSION": .string(.appBuildVersion()),
            "CODE_SIGN_IDENTITY": "iPhone Developer",
            "CODE_SIGN_STYLE": "Automatic",
            "DEVELOPMENT_TEAM": .string(Project.Environment.organizationTeamId),
            "VERSIONING_SYSTEM": "apple-generic",
            "DEBUG_INFORMATION_FORMAT": "DWARF with dSYM File",
        ],
        configurations: [
            .debug(name: .debug, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ]),
            .release(name: .release, settings: [
                "PRODUCT_NAME": .string(Project.Environment.appName),
                "OTHER_LDFLAGS": [
                    "-all_load"
                ],
                "STRIP_STYLE": [
                    "non-global"
                ]
            ])
        ]
    )
}
