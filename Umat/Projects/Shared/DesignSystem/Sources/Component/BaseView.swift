//
//  BaseView.swift
//  DesignSystem
//
//  Created by 지준용 on 2/12/24.
//  Copyright © 2024 KYUNG MIN CHOI. All rights reserved.
//

import SwiftUI

public struct BaseView<Header: View, Content: View, Footer: View>: View {
    private let header: Header
    private let content: Content
    private let footer: Footer
    
    public init(header: () -> Header = {EmptyView()},
                content: () -> Content,
                footer: () -> Footer = {EmptyView()}) {
        self.header = header()
        self.content = content()
        self.footer = footer()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            header
            
            content
            
            footer
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
