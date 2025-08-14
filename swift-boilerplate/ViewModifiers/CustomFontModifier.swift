//
//  CustomFontModifier.swift
//  swift-boilerplate
//
//  Created by Telha Wasim on 14/08/2025.
//

import Foundation
import SwiftUI

struct CustomFontModifier: ViewModifier {
    
    //MARK: - PROPERTIES -
    
    //Normal
    let font: FontType
    let fontWeight: FontWeight
    let fontSize: FontSize
    
    //MARK: - BODY -
    func body(content: Content) -> some View {
        content
            .font(.custom(self.getFont(), size: self.fontSize.rawValue))
    }
}

//MARK: - FUNCTIONS -
extension CustomFontModifier {
    
    //MARK: - GET FONT -
    private func getFont() -> String {
        switch self.font {
        case .poppins:
            if (self.fontWeight == .regular) {
                return "Poppins-Regular"
            } else if (self.fontWeight == .medium) {
                return "Poppins-Medium"
            } else if (self.fontWeight == .semibold) {
                return "Poppins-SemiBold"
            } else if (self.fontWeight == .bold) {
                return "Poppins-Bold"
            } else {
                return "Poppins-Black"
            }
        }
    }
}
