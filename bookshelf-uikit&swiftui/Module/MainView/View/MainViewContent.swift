//  MainViewContent.swift
//  Created by user on 29/01/2025.

import SwiftUI

enum SelectedCategory {
    case willRead
    case didRead
}

struct MainViewContent: View {
    @State var searchField = ""
    @State private var selectedCategory: SelectedCategory = .willRead
    
    //var books: [Book]
    var name: String
    var completion: () -> Void
    
    
    var body: some View {
        
        ZStack(alignment: .top) { // for Fixed Header in .top :)
            
            //MARK: Header (Fixed)
            VStack(alignment: .leading) {
                HStack {
                    // Header Left
                    /// `alignment: .leading` - к левому краю
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Добрый день")
                            .font()
                        Text(name)
                            .font(type: .black, size: 16)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                    
                    // Header Right
                    Button {
                        //MARK: Go to AddBookView
                        completion()
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "book.closed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                
                            Text("Добавить")
                                .font(size: 12)
                        }
                        .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 9)
                    .background(.appOrange)
                    .clipShape(Capsule()) // Corner radius from Apple
                }
            }
            .padding(.horizontal, 30)
            .zIndex(9)
        
            // ScrollView ;) - чтобы экран скроллился
            ScrollView(.vertical, showsIndicators: false) {
                VStack {

                    //MARK: Read block
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // Search TextField
                        BaseTextView(placeholder: "Поиск", text: $searchField)
                            .font(size: 16)
                            .padding(.horizontal, 30)
                        
                        // Reading Books
                        VStack(alignment: .leading, spacing: 18) {
                            
                            Text("Читаю")
                                .font(type: .bold, size: 22)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 30)
                            
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    
                                    // Book
                                    Button {
                                        //
                                    } label: {
                                        Image(.cover)
                                            .resizable() //to change frame
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                    
                                    // Book
                                    Button {
                                        //
                                    } label: {
                                        Image(.cover)
                                            .resizable() //to change frame
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                    
                                    // Book
                                    Button {
                                        //
                                    } label: {
                                        Image(.cover)
                                            .resizable() //to change frame
                                            .frame(width: 143, height: 212)
                                            .clipShape(.rect(cornerRadius: 5))
                                    }
                                }
                                .padding(.horizontal, 30)
                            }
                        }
                
                        
                    }
                    .padding(.top, 10)
                    
                    //MARK: Will/Did Read
                    VStack(alignment: .leading) {
                        HStack(alignment: .bottom, spacing: 26) {
                            Button {
                                selectedCategory = .willRead
                            } label: {
                                createButtonText(text: "Прочитать", category: .willRead)
                            }
                            
                            Button {
                                selectedCategory = .didRead
                            } label: {
                                createButtonText(text: "Прочитал", category: .didRead)
                            }
                        }
                        // Растянуть на всю ширину
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Show Books
                        if selectedCategory == .willRead {
                            VStack(spacing: 20) {
                                BookItem()
                                BookItem()
                            }
                        } else {
                            VStack(spacing: 20) {
                                BookItem()
                                BookItem()
                                BookItem()
                                BookItem()
                            }
                        }
                        
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                }
            }
            //.ignoresSafeArea()
            .padding(.top, 60) // 50 всего
            .background(.bgMain)
        }
        //.padding(.top, 10)
        
        
        
    }
    
    @ViewBuilder
    func createButtonText(text: String, category: SelectedCategory) -> some View {
        let condition = selectedCategory == category
        Text(text)
            .font(type: condition ? .bold : .medium, size: condition ? 22 : 20)
            .foregroundStyle(condition ? .white : .appGray)
    }
}

