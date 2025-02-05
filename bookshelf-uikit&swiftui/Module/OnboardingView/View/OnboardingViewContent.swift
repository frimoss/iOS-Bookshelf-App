//  OnboardingViewContent.swift
//  Created by user on 23/01/2025.

import SwiftUI

struct OnboardingViewContent: View {
    @State var selected: Int = 0
    @State var btnText: String = "Далее"
    
    var slides: [OnboardingViewData]
    var completion: () -> Void
    
    
    var body: some View {
        VStack {
            Text("Добро пожаловать")
                .font(type: .black, size: 22)
                .foregroundStyle(.white)
            
            Spacer()
            
            VStack {
                // TabView with Pictures
                TabView(selection: $selected) {
                    // slides.enumerated()
                    ForEach(0..<slides.count, id: \.self) { slide in
                        SlideItem(tag: slide, item: slides[slide])
                            .padding(.horizontal, 30)
                    
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never)) // Убираем стандартые точки переключения страниц
                
                // Custom Slider
                HStack {
                    ForEach(0..<slides.count, id: \.self) { slide in
                        //Text(slide.description)
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundStyle(slide == selected ? .appOrange : .white)
                            .onTapGesture {
                                withAnimation {
                                    selected = slide
                                }
                            }
                    }
                }
            }
            .frame(height: 400)
            .onChange(of: selected) { oldValue, newValue in
                withAnimation {
                    switch newValue {
                    case slides.count - 1:
                        btnText = "Начать пользоваться"
                    default:
                        btnText = "Далее"
                    }
                }
            }
            
            Spacer()
            
            VStack {
                OrangeButton(title: btnText) {
                    if selected < slides.count - 1 {
                        withAnimation {
                            selected += 1
                        }
                    } else {
                        // Go to Main View
                        completion()
                    }
                }
            }
            .padding(.horizontal, 30)
        }
        .padding(.vertical, 10)
        .background(.bgMain)
        
    }
}

struct SlideItem: View {
    var tag: Int
    var item: OnboardingViewData
    
    var body: some View {
        VStack(spacing: 39) {
            Image(item.image)
                .resizable()
                .scaledToFill() // Строго до frame, чтобы сработал!!!
                .frame(width: UIScreen.main.bounds.width - 172, height: UIScreen.main.bounds.width - 172) // слева и справа по 86
                .clipped() // Обрезать то, что вылезает :)
            
            Text(item.description)
                .font(size: 16) // Наш кастомный шрифт, по дефолту: regular
                .foregroundStyle(.white)
        }
        .tag(tag)
    }
}
