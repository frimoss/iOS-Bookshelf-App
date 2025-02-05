//  BaseTextView.swift
//  Created by user on 29/01/2025.

import SwiftUI

struct BaseTextView: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.appGray)) // Мой fix
        //TextField(placeholder, text: $text) // Не работает цвет для "placeholder" :с
            .font(type: .regular, size: 14) // Наш кастомный шрифт
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .padding(.horizontal, 22)
            .background(.bgDark)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10)) // cornerRadius
    }
}
