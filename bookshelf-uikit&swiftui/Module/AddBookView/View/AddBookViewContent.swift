//  AddBookViewContent.swift
//  Created by user on 01/02/2025.

import SwiftUI

enum NavDirection {
    case to(String), back
}

struct AddBookViewContent: View {
    
    @State var bookName: String = ""
    var completion: (NavDirection) -> Void
    
    var body: some View {
        VStack {
            NavHeader(title: "Добавить книгу") {
                //MARK: Go back Btn
                completion(.back)
            }
            .foregroundStyle(.white)
            
            Spacer()
            
            BaseTextView(placeholder: "название книги", text: $bookName)
                
            Spacer()
            
            OrangeButton(title: "Далее") {
                //MARK: Запрос
                completion(.to(bookName))
            }
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.bgMain)
    }
}

//#Preview {
//    AddBookViewContent(bookName: "")
//}
