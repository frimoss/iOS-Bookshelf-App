//  BookStatusButton.swift
//  Created by user on 01/02/2025.

import SwiftUI

struct BookStatusButton: View {
    
    var status: BookStatus
    var action: () -> Void
    
    private var btnText: String
    
    init(status: BookStatus, action: @escaping () -> Void) {
        self.status = status
        self.action = action
        
        switch status {
        case .willRead:
            self.btnText = "Прочитать"
        case .read:
            self.btnText = "Читаю"
        case .didRead:
            self.btnText = "Прочитал"
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(btnText)
                .font(type: .bold, size: 13)
                .padding(.vertical, 4)
                .padding(.horizontal, 17)
                //.frame(width: 80, height: 26)
                .foregroundStyle(.white)
                .background(btnColor())
                .clipShape(Capsule())
        }
    }
    
    func btnColor() -> Color {
        switch status {
        case .willRead:
            return Color.appOrange
        case .read:
            return Color.statusRead
        case .didRead:
            return Color.statusDidRead
        }
    }
}


