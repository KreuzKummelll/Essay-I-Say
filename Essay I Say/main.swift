//
//  main.swift
//  Essay I Say
//
//  Created by Andrew on 19.06.19.
//  Copyright © 2019 Andrew. All rights reserved.
//

import Foundation
import CoreML


enum Classifier {
    case
    essays,
    openClosequestions,
    aspects,
    voices,
    times
}

class Game {
    var inputKey = Character(" ").lowercased()
    var inputString : String? = ""
    var keys: (String, String, String, String, String) = ("essay", "question", "aspect", "voice", "time")
    
    var inputkeyLowercased : String {
        return inputKey.lowercased()
    }
    var inputStringLowercased : String {
        return inputKey.lowercased()
    }
    
    private func getResults(_ text: String, classifierType: Classifier) {
        
        let message: String
    
        switch classifierType {
        case .essays:
            let model_essay = EssayClassifier()
            do {
                let prediction = try model_essay.prediction(text: text)
                print(prediction.label)
            } catch {
                print("Problem classifying your essay.")
            }
        case .openClosequestions:
            let model_questions = EndedQuestionClassifier()
            do {
                let prediction = try model_questions.prediction(text: text)
                print(prediction.label)
            } catch {
                print("Problem classifying your question.")
            }
        case .aspects:
            let model_questions = AspectClassifier()
            do {
                let prediction = try model_questions.prediction(text: text)
                print(prediction.label)
            } catch {
                print("Problem classifying your question.")
            }
        case .voices:
            let model = VoiceClassifier()
            do {
                let prediction = try model.prediction(text: text.lowercased())
                print(prediction.label)
            } catch {
                print("Problem classifying your question.")
            }
        case .times:
            let model = TimeClassifier()
            do {
                let prediction = try model.prediction(text: text)
                print(prediction.label)
            } catch {
                print("Problem classifying your question.")
            }
        default:
            message = "Unkown Classifier Type Requested"
            fatalError(message)
        }
    }
    
    func mainLoop() {
        inputKey = ""
        while inputkeyLowercased != "Q".lowercased() || inputkeyLowercased != "Quit".lowercased() {
            introduction()
            if inputkeyLowercased == "essay" {
                startEssayClassifierScript()
            }
            else if inputkeyLowercased == "question" {
                startEndedQuestionClassifierScript()
            }
            else if inputkeyLowercased == "aspect" {
                startAspectClassifierScript()
            }
            else if inputkeyLowercased == "voice" {
                startVoiceClassifierScript()
            }
            else if inputkeyLowercased == "time" {
                startTimeClassifierScript()
            }
        }
    }
    
    func introduction() {
        print("Welcome to Small i's Classifier Program!\n\tEnter either `\(keys.0)`, `\(keys.1)`, `\(keys.2)`,`\(keys.3)` or `\(keys.4)` to be brought into the various classifiers — essay classification, open-/closed-ended question classification, and aspect, time, voice classification.")
        inputKey = readLine()?.lowercased() ?? "Didn't get that. Come on, write one of the options in!"
        
    }
    
    func startEndedQuestionClassifierScript() {
        print("Welcome to Small I Say `Open- Closed-Ended Question Classifier`. It classifies whether your inputed question is open-ended or close-ended, or a sentence. Many people call closed-ended questions `yes or no questions`. An example of a close-ended question is \"Are you hungry?\" or \"Did you have a nice day?\". Examples of open-ended questions are \"What interested you most about the tour?\" or \"What else might you recommend?\".\n ")
        
        repeat {
            inputString = readLine()
            if let data = inputString?.lowercased() {
//                print(data)
                getResults(data, classifierType: .openClosequestions)
            }
            print(divider)
        
        } while inputStringLowercased != "Back".lowercased()
    
        
        // MARK: Questions Quit
        print("Open-Close-Ended Question Classification is quiting!")
        print("Back to Main Menu")
    }
    
    func startEssayClassifierScript() {
        print("Welcome to Small I Say essay classificiation. It classifies - Persuasive, Argumentative, Narrative, Expository, Discriptive - essays. \n ")
        print("Press Return for next classification")
        
        repeat {
            inputString = readLine()!.lowercased()
            let testFile = try? String(contentsOf: URL(fileURLWithPath: "/Users/andrew/Desktop/essayFileTest.txt"))
            if let data = testFile {
                print(data)
            getResults(data, classifierType: .essays)
            }
            
        } while inputStringLowercased != "Back".lowercased()
            
        print(divider)
        inputKey = ""
        
        
    // MARK: Essays Quit
    print("Essay Classification is quiting!")
    print("Back to Main Menu")
    }
    
    func startAspectClassifierScript() {
        print("Welcome to Small I Say `Aspect Classifier`. It classifies whether your inputed text is in the continuous, simple, perfect simple, or perfect continuous aspect.\n")
        
        repeat {
            inputString = readLine()!
            if let data = inputString?.lowercased() {
                getResults(data, classifierType: .aspects)
            }
            print(divider)
            
        } while inputStringLowercased != "Back".lowercased()
        
        
        // MARK: Aspect Quit
        print("Aspect Classification is quiting!")
        print("Back to Main Menu")
    }
    
    func startVoiceClassifierScript() {
        print("Welcome to Small I Say `Voice Classifier`. It classifies whether your inputed text is in the active or passive voice.\n")
        
        repeat {
            inputString = readLine()!
            if let data = inputString?.lowercased() {
                getResults(data, classifierType: .voices)
            }
            print(divider)
            
        } while inputStringLowercased != "Back".lowercased()
        
        
        // MARK: Voice Quit
        print("Voice Classification is quiting!")
        print("Back to Main Menu")
    }
    func startTimeClassifierScript() {
        print("Welcome to Small I Say `Time Classifier`. It classifies whether your inputed text is in the present, past or future time.\n")
        
        repeat {
            inputString = readLine()!
            if let data = inputString?.lowercased() {
                getResults(data, classifierType: .times)
            }
            print(divider)
            
        } while inputStringLowercased != "Back".lowercased()
        
        
        // MARK: Voice Quit
        print("Voice Classification is quiting!")
        print("Back to Main Menu")
    }
    
    let applicationName = "Essay I Say"
    var divider = """
    _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
    """
}

Game().mainLoop()


//Factory().makeAspectJSON()
