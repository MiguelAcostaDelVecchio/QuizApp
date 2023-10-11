//
//  ContentView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 9/20/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var gameColor = GameColor()
    
    var body: some View {
        ZStack {
            gameColor.mainColor.ignoresSafeArea()
            
            VStack {
                Text(viewModel.questionProgressText)
                  .font(.callout)
                  .multilineTextAlignment(.leading)
                  .padding()
                QuestionView(question: viewModel.currentQuestion)
            }
            
        }
        .foregroundColor(.white)
        .environmentObject(viewModel)
        .navigationBarHidden(true)
    }
}


 #Preview {
 GameView()
 }
 
