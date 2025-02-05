//  BookListViewContent.swift
//  Created by user on 01/02/2025.

import SwiftUI

struct BookListViewContent: View {
    
    let books: [BookModelItem]
    
    var body: some View {
        ZStack(alignment: .top) {
            NavHeader(title: "Мартин Иден") {
                //go back
            }
            .foregroundStyle(.white)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Результаты поиска")
                        .foregroundStyle(.white)
                        .font(size: 16)
                        .padding(.horizontal, 21)
                    
                    // List Books
                    VStack(spacing: 23) {
                        
                        ForEach(books, id: \.self) { book in
                            BookListItem(book: book) {
                                //
                            }
                        }
                        
                    }
                }
                
            }
            .padding(.top, 45)
            
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bgMain)
    }
}

struct BookListItem: View {
    
    var book: BookModelItem
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(alignment: .top, spacing: 13) {
                Image(.cover) // URL(string: "https://covers.openlibrary.org/b/id/\(book.cover_i)-M.jpg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 110)
                    .clipShape(.rect(cornerRadius: 3))
                
                VStack(alignment: .leading) {
                    Text(book.title ?? "-")
                        .font(type: .bold, size: 16)
                        .foregroundStyle(.white)
                    Text(book.author_name?.first ?? "-")
                        .font(type: .medium, size: 14)
                        .foregroundStyle(.appGray)
                }
                .padding(.top, 10)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .padding(.top, 13)
            }
        }
    }
}
