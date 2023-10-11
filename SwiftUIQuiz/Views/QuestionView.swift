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
    
    // isShowing will control whether the rightOrWrong text is still visible to the user
    @State var isShowingText = true
    
    var gameColor = GameColor()
    
    var body: some View {
        VStack{
            Text(question.questionText).font(.largeTitle).bold().multilineTextAlignment(.leading)
                
            Spacer()
            
            if rightOrWrong == "Correct!" {
                if isShowingText {
                    CorrectOrIncorrectView(rightOrWrong: rightOrWrong, fontColor: gameColor.correctColor, isShowingText: $isShowingText)
                }
            } else if rightOrWrong == "Incorrect!" {
                if isShowingText {
                    CorrectOrIncorrectView(rightOrWrong: rightOrWrong, fontColor: gameColor.incorrectColor, isShowingText: $isShowingText)
                }
            }
            
            Spacer()
            
            HStack{
                ForEach(0..<question.possibleAnswers.count){
                    answerIndex in
                    // Define the view that will be returned for each index
                    Button(action: {
                        if answerIndex == question.correctAnswerIndex {
                            rightOrWrong = ""
                            isShowingText = true
                            rightOrWrong = "Correct!"
                        } else {
                            rightOrWrong = ""
                            isShowingText = true
                            rightOrWrong = "Incorrect!"
                        }
                        viewModel.makeGuess(atIndex: answerIndex)
                    }, label: {ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])})
                }
            }
            
            Spacer()
            
            NavigationLink(destination: EndScreenView(), isActive: $activateEndScreen, label: {Text("")})
            
            if viewModel.guessWasMade && rightOrWrong == "Correct!" {
                if viewModel.isLastQuestion == true {
                    Button(action: {
                        activateEndScreen = true
                    }, label: {
                        ChoiceTextView(choiceText: "Finish")
                    })
                } else {
                    Button(action: {
                        viewModel.displayNextScreen()
                    }, label: {
                        ChoiceTextView(choiceText: "Next Question")
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
