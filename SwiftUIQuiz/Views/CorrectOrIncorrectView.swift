//
//  CorrectOrIncorrectView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 9/22/23.
//

import SwiftUI

struct CorrectOrIncorrectView: View {
    let rightOrWrong: String
    let fontColor: Color
    @Binding var isShowingText: Bool
    
    var body: some View {
        Text(rightOrWrong)
            .foregroundColor(fontColor)
            .bold()
            .font(.title)
            .opacity(1)
            .opacity(isShowingText ? 1.0 : 0.0)
            .animation(.easeInOut(duration: 2.0))
    }
}

#Preview {
    CorrectOrIncorrectView(rightOrWrong: "Correct!", fontColor: .green, isShowingText: .constant(true))
}

