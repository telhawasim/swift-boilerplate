//
//  View+Ext.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation
import SwiftUI

extension View {
    
    //MARK: - CUSTOM FONT -
    func customFont(_ font: FontType = .poppins, _ fontWeight: FontWeight, _ fontSize: FontSize) -> some View {
        self.modifier(CustomFontModifier(font: font, fontWeight: fontWeight, fontSize: fontSize))
    }
}
