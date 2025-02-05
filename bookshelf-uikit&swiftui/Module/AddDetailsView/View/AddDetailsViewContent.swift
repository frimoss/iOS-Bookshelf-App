//  AddDetailsViewContent.swift
//  Created by user on 01/02/2025.

import SwiftUI

struct AddDetailsViewContent: View {
    
    @State var bookName: String = ""
    @State var bookDescription: String = ""
    
    var body: some View {
        VStack {
            NavHeader(title: "Мартин Иден") {
                // go back
            }
            .foregroundStyle(.white)
            .padding(.bottom, 60)
            
            VStack(spacing: 80) {
                // Book Image
                Image(.cover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 134)
                    .clipShape(.rect(cornerRadius: 3))
                    .overlay(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Button {
                            //
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.bgGreen)
                                    .frame(width: 24, height: 24)
                                Image(systemName: "arrow.2.circlepath")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(.white)
                                    .rotationEffect(.degrees(30))
                                    .scaleEffect(x: 1, y: -1)
                                
                            }
                            .offset(x: 10, y: -10)
                        }
                        
                    }
                
                VStack(spacing: 28) {
                    BaseTextView(placeholder: "Название книги", text: $bookName)
                    
                    // Description
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $bookDescription)
                            .font(type: .regular, size: 14)
                            .scrollContentBackground(.hidden)
                            .padding(.horizontal, 17) // -5 от BaseTextView (22 - 5)
                            .padding(.vertical, 10)
                            .frame(height: 114)
                            .background(.bgDark)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(alignment: .topTrailing) {
                                Button {
                                    // AI Description Generation
                                } label: {
                                    Image(.ai)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 21, height: 21)
                                        .padding(.top, 15)
                                        .padding(.trailing, 15)
                                }
                            }
                        
                        // Placeholder
                        if self.bookDescription.isEmpty {
                            Text("Описание")
                                .font()
                                .foregroundStyle(.appGray)
                                .offset(x: 22, y: 18)
                        }
                       
                    }
                    
                }
            }
            
            Spacer()
            
            OrangeButton(title: "Добавить") {
                //
            }
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: .leading, vertical: .top))
        .background(.bgMain)
    }
}

#Preview {
    AddDetailsViewContent(bookName: "Martin Eden")
}
