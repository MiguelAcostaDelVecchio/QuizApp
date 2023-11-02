//
//  QuestionView.swift
//  SwiftUIQuiz
//
//  Created by Miguel Acosta Del Vecchio on 10/7/23.
//

import SwiftUI

struct QuestionView: View {
    
    let question: Question
    
    @EnvironmentObject var viewModel: GameViewModel
    
    @State private var activateEndScreen = false
    
    // variable to let user know whether he clicked on the correct option or not
    @State var rightOrWrong = ""
    
    @State var isButtonPressed = false
    
    var gameColor = GameColor()
    
    var body: some View {
        VStack{
            Text(question.questionText).font(.largeTitle).bold().multilineTextAlignment(.leading)
                
            Spacer()
            
            Image(question.imgName)
                .resizable()
                .scaledToFit()
                .cornerRadius(8.0)
                .padding()
            
            Spacer()
            
            HStack{
                ForEach(0..<question.possibleAnswers.count){
                    answerIndex in
                    // Define the view that will be returned for each index
                    Button(action: {
                        if answerIndex == question.correctAnswerIndex {
                            rightOrWrong = ""
                            rightOrWrong = "Correct"
                        } else {
                            withAnimation{isButtonPressed.toggle()}
                            rightOrWrong = ""
                            rightOrWrong = "Incorrect"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { withAnimation { isButtonPressed = false} }
                        }
                        viewModel.makeGuess(atIndex: answerIndex)
                    }, label: {ChoiceTextView(choiceText: question.possibleAnswers[answerIndex]).scaleEffect(isButtonPressed ? 1.1 : 1.0).offset(x: isButtonPressed ? CGFloat.random(in: -10...10) : 0)})
                }
            }
            
            Spacer()
            
            NavigationLink(destination: EndScreenView(), isActive: $activateEndScreen, label: {Text("")})
            
            if viewModel.guessWasMade && rightOrWrong == "Correct" {
                if viewModel.isLastQuestion == true {
                    Button(action: {
                        activateEndScreen = true
                    }, label: {
                        NormalTextView(buttonText: "Finish")
                    })
                } else {
                    Button(action: {
                        viewModel.displayNextScreen()
                    }, label: {
                        NormalTextView(buttonText: "Next Question")
                    })
                }
                
            }
            
            Spacer()
            
        }
    }
}

/*
#Preview {
    QuestionView(question: Game().currentQuestion)
}
*/
