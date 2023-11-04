//
//  ChoiceTextView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 9/21/23.
//

import SwiftUI

struct ChoiceTextView: View {
    let choiceText: String
    
    var body: some View {
        Text(choiceText)
            .font(.body)
            .bold()
            .multilineTextAlignment(.center)
            .padding()
            .border(GameColor().accentColor, width: 4)
    }
}


#Preview {
    ChoiceTextView(choiceText: "Choice Test")
}

