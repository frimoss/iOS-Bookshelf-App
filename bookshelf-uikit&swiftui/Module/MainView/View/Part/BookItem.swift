//  BookItem.swift
//  Created by user on 05/02/2025.

import SwiftUI

/// Наш `BookItem - willRead/didRead`
struct BookItem: View {
    //TODO: Получать книгу + Обложку по ("bookId/cover.jpeg")?
    //var book: Book
    
    var body: some View {
        HStack(spacing: 13) {
            Image(.cover)
                .resizable()
                .frame(width: 64, height: 94)
                .clipShape(.rect(cornerRadius: 3))
            
            VStack(alignment: .leading, spacing: 9) {
                VStack(alignment: .leading) {
                    Text("Война и Мир") // Title
                        .font(type: .bold)
                    Text("Лев Толстой") // Author
                        .font(type: .medium, size: 12)
                        .foregroundStyle(.appGray)
                }
                // Description
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ...")
                    .font(size: 12)
            }
            .foregroundStyle(.white)
        }
    }
}

