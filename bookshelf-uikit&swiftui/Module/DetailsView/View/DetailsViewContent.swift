//  DetailsViewContent.swift
//  Created by user on 30/01/2025.

import SwiftUI

struct DetailsViewContent: View {
    
    @State var bookNote: String = ""
    
    @State var showTitle: Bool = false
    @State var offsetTop: CGFloat = 0
    @State var noteDeleteOffsetX: CGFloat = 0
    
    var BookName: String = "Война и Мир" //TODO: Будем доставать из Book
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // TopNav
            HStack {
                // Button Back
                Button {
                    // actionBack()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                }
                
                Spacer()
                
                Text(showTitle ? BookName : "О книге")
                    .font(size: 18)
                
                Spacer()
                
                // Button Menu
                Button {
                    //actionMenu()
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .clipped()
                        .rotationEffect(.degrees(90))
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 60)
            .padding(.bottom, 12)
            .foregroundStyle(.white)
            .zIndex(1)
            .background(
                .bgMain.opacity(offsetTop < 0 ? (-offsetTop * 4 / 1000) : 0)
            )
            
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 29) {
                    ZStack(alignment: .top) {
                        // Параллакс Эффект Book Фон
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            
                            Image(.cover)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: proxy.size.width)
                                //.frame(height: 430 + (minY > -430 ? minY : -430))
                                .frame(height: 430 + (minY > 0 ? minY : 0))
                                .clipped()
                                .overlay {
                                    Color(.bgPurple)
                                        .opacity(0.88)
                                }
                                .offset(y: minY > 0 ? -minY : 0)
                                //.offset(y: -minY) //  > 0 ? -minY : 0
                                .onChange(of: minY) { newValue in
                                    offsetTop = newValue
                                    withAnimation {
                                        if newValue < -250 {
                                            showTitle = true
                                        } else {
                                            showTitle = false
                                        }
                                    }
                                }
                            
                        }
                        .frame(height: 430)
                        
                        // Book Cover + Book Title + Book Status
                        VStack(spacing: 12) {
                            Image(.cover)
                                .resizable()
                                .frame(width: 128, height: 188)
                            
                            VStack {
                                Text("Война и Мир")
                                    .font(type: .bold, size: 20)
                                Text("Лев Толстой")
                                    .font(type: .medium, size: 14)
                            }
                            .foregroundStyle(.white)
                            
                            BookStatusButton(status: .read) {
                                //TODO: BookStatusButton
                            }
                            
                        }
                        .padding(.top, 115)
                    }
                    
                    // Book Description + Notes
                    VStack(spacing: 36) {
                        
                        // Book Description
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Описание")
                                .font(type: .bold, size: 18)
                                .foregroundStyle(.white)
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo")
                                .font()
                                .foregroundStyle(.appGray)
                            
                        }
                        .padding(.horizontal, 21)
                        
                        // Book Notes
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Заметки по книге")
                                .font(type: .bold, size: 18)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 21)
                            
                            ZStack(alignment: .trailing) {
                                CommentView()
                                    .offset(x: -noteDeleteOffsetX)
                                    .gesture(
                                        DragGesture()
                                            .onChanged({ value in
                                                if value.translation.width < -noteDeleteOffsetX {
                                                    noteDeleteOffsetX = abs(value.translation.width)
                                                }
                                            })
                                            .onEnded({ value in
                                                withAnimation {
                                                    if value.translation.width < -50 {
                                                        noteDeleteOffsetX = 90
                                                    } else {
                                                        noteDeleteOffsetX = 0
                                                    }
                                                }
                                                
                                            })
                                    )
                                    .zIndex(1)
                                
                                Button {
                                    //TODO: Delete Note
                                } label: {
                                    Image(systemName: "trash")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 21, height: 21)
                                        .foregroundStyle(.white)
                                        .opacity(noteDeleteOffsetX > 0 ? (noteDeleteOffsetX / 90) : 0)
                                        .padding(.trailing, 32)
                                }
                            }
                            
                            
                            CommentView()
                            
                            
                            BaseTextView(placeholder: "Добавить заметку", text: $bookNote)
            
                        }
                        
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.bottom, 30)
            }
            
        }
        //.padding(.top, 10)
        .ignoresSafeArea()
        .background(.bgMain)
        
        
        
        
    }
}


#Preview {
    DetailsViewContent()
}


