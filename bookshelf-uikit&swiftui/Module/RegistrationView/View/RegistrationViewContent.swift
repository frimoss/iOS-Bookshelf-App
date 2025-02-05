//  RegistrationViewContent.swift
//  Created by user on 22/01/2025.

import SwiftUI

struct RegistrationViewContent: View {
    
    @State private var nameField = "" // Сохраняем Имя в @State переменную
    var btnAction: (String) -> Void // Передаем Имя в "RegistrationView.swift"
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Добро пожаловать")
                    .font(type: .black, size: 22)
                    .foregroundStyle(.white)
                
                Spacer()
                
                BaseTextView(placeholder: "Ваше имя", text: $nameField)
                
                Spacer()
                
                OrangeButton(title: "Далее") {
                    btnAction(nameField)
                }
                
            }
            .padding(.horizontal, 30)
        }
        .padding(.vertical, 10) // Мой отступ снизу и сверху
        .background(.bgMain)
    }
}

