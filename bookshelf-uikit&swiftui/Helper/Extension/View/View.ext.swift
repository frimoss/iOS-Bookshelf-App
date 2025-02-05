//  View.ext.swift
//  Created by user on 22/01/2025.

import SwiftUI

extension View {
    // Наша кастомная функция "font", чтобы использовать наш шрифт!
    /// `Наш Jost Font`, по умолчанию:
    /// `type: regular`;
    /// `size: 14`;
    func font(type: FontType = .regular, size: CGFloat = 14) -> some View {
        modifier(CustomFont(font: type, size: size))
    }
}
