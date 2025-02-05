//  CustomFont.swift
//  Created by user on 22/01/2025.

import SwiftUI

// Struct для нашего CustomFont
struct CustomFont: ViewModifier {
    
    var font: FontType // Принимаем шрифт из нашего enum "FontManager" ;)
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(font.rawValue, size: size))
    }
}
