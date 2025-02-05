//  CommentView.swift
//  Created by user on 01/02/2025.

import SwiftUI

struct CommentView: View {
    //TODO: Book, Date, NoteText
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("13.01.25")
                .font(size: 12)
                .foregroundStyle(.white)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(size: 12)
                .foregroundStyle(.appGray)
        }
        .padding(.horizontal, 21)
        .padding(.top, 12)
        .padding(.bottom, 23)
        .background(.bgDark)
        .clipShape(.rect(cornerRadius: 10))
    }
}
