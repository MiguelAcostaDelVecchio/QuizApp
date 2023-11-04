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
    
    @State private var cnt = 0
    
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
                    if answerIndex == question.correctAnswerIndex {
                        Button(action: {
                            rightOrWrong = ""
                            rightOrWrong = "Correct"
                            if isButtonPressed != true {
                                isButtonPressed.toggle()
                            }
                            viewModel.makeGuess(atIndex: answerIndex)
                        }, label: {ChoiceTextView(choiceText: question.possibleAnswers[answerIndex]).background(isButtonPressed ? .green : .clear)})
                    } else {
                        Button(action: {
                            if isButtonPressed == true {
                                isButtonPressed.toggle()
                            }
                            cnt += 1
                            rightOrWrong = ""
                            rightOrWrong = "Incorrect"
                            viewModel.makeGuess(atIndex: answerIndex)
                        }, label: {
                            Text(question.possibleAnswers[answerIndex]).font(.body).bold().multilineTextAlignment(.center).padding().border(GameColor().accentColor, width: 4).modifier(ShakeEffect(animatableData: CGFloat(cnt)))
                        }).foregroundColor(.white)
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(destination: EndScreenView(), isActive: $activateEndScreen, label: {Text("")})
            
            if viewModel.guessWasMade && rightOrWrong == "Correct" {
                if viewModel.isLastQuestion == true {
                    Button(action: {
                        activateEndScreen = true
                        isButtonPressed = false
                    }, label: {
                        ChoiceTextView(choiceText: "Finish")
                    })
                } else {
                    Button(action: {
                        viewModel.displayNextScreen()
                        isButtonPressed = false
                    }, label: {
                        ChoiceTextView(choiceText: "Next Question")
                    })
                }
                
            }
            
            Spacer()
            
        }
    }
}

struct ShakeEffect : GeometryEffect {
    var travelDistance: CGFloat = 10
    var numOfShakes: CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travelDistance * sin(animatableData * .pi * numOfShakes), y: 0))
    }
}

/*
#Preview {
    QuestionView(question: Game().currentQuestion)
}
*/
