//
//  EndScreenView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 10/8/23.
//

import SwiftUI

struct EndScreenView: View {
    @State private var goHome = false
    var body: some View {
        ZStack {
            GameColor().mainColor.ignoresSafeArea()
            NavigationLink(destination: WelcomeView(), isActive: $goHome, label: {Text("")})
            VStack {
                Spacer()
                Text("Well done! I guess it is possible to learn something new everyday 😄").font(.title).bold().multilineTextAlignment(.center).padding()
                Spacer()
                Button(action: {
                    goHome = true
                }, label: {
                    ChoiceTextView(choiceText: "Return Home")
                })
                
            }
        }
        .foregroundColor(.white)
        .navigationBarHidden(true)
    }
}

#Preview {
    EndScreenView()
}
