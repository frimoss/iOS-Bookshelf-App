//  NavHeader.swift
//  Created by user on 01/02/2025.

import SwiftUI

/// `Наш TopNavView() - title: String; action: backBtn()`
struct NavHeader: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        
        HStack {
            // Button Back
            Button {
                action()
            } label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 18)
            }
            
            Spacer()
            
            Text(title)
                .font(type: .bold, size: 22)
            
            Spacer()

            Rectangle()
                .opacity(0)
                .frame(width: 20, height: 18)
        }
    }
}
