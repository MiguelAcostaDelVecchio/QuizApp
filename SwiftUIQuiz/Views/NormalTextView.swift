//
//  NormalTextView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 10/12/23.
//

import SwiftUI

struct NormalTextView: View {
    let buttonText: String
    
    var body: some View {
        Text(buttonText).font(.body).bold().multilineTextAlignment(.center).padding().border(GameColor().accentColor, width: 4)
    }
}

#Preview {
    NormalTextView(buttonText: "Example")
}
