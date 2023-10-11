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
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isShowingText = false
                    }
                }
            }
    }
}

#Preview {
    CorrectOrIncorrectView(rightOrWrong: "Correct!", fontColor: .green, isShowingText: .constant(true))
}

