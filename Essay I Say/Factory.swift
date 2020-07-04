//
//  MakeJSONFromText.swift
//  Essay I Say
//
//  Created by Andrew on 04.07.20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation


final class Factory {
    
    func makeAspectJSON() { // simple, continuous, perfect simple, perfect continuous
        let splitSimple = AspectsExampleSentences()                             .simple.split(separator:"\n")
        let splitContinuous = AspectsExampleSentences()                     .continuous.split(separator:"\n")
        let splitPerfectSimple = AspectsExampleSentences()               .perfectSimple.split(separator:"\n")
        let splitPerfectContinuous = AspectsExampleSentences()       .perfectContinuous.split(separator:"\n")
        var array : [TextInputEnvelope] = []
        
        for each in splitSimple {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Simple"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        
        for each in splitContinuous {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Continuous"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        
        for each in splitPerfectSimple {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Perfect Simple"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        
        for each in splitPerfectContinuous {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Perfect Continuous"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        
        do {
            let data = try JSONEncoder().encode(array)
            
            if let string = String.init(data: data, encoding: .utf8) {
                let split = string.split(separator: "\\")
                for each in split {
                    print(each)
                }
            }
            let desinations = FileDestinations()
            let filename = "AspectJSON.json"
            desinations.finalizePath(fileName: "JSONforMLStorage/\(filename)")
            let exportPath = desinations.returnFinalPath()
            print(exportPath.description)
            try data.write(to:exportPath)
        }
        catch {
            print("Error encoding new JSON Array. \(error.localizedDescription)" )
        }
    }
    
    func makeTimeJSON() {
        let splitPresent = TimesExampleSentences().present.split(separator: "\n")
        let splitPast = TimesExampleSentences().past.split(separator: "\n")
        let splitFuture = TimesExampleSentences().future.split(separator: "\n")
        var array : [TextInputEnvelope] = []
        
        for each in splitPresent {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Present"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        for each in splitPast {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Past"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        for each in splitFuture {
            let stringVersion = each.description
            let text = stringVersion
            let label = "Future"
            let envelope = TextInputEnvelope(text: text, label: label)
            array.append(envelope)
        }
        
        do {
            let data = try JSONEncoder().encode(array)
            
            if let string = String.init(data: data, encoding: .utf8) {
                let split = string.split(separator: "\\")
                for each in split {
                    print(each)
                }
            }
            let desinations = FileDestinations()
            let filename = "TimeJSON.json"
            desinations.finalizePath(fileName: "JSONforMLStorage/\(filename)")
            let exportPath = desinations.returnFinalPath()
            print(exportPath.description)
            try data.write(to:exportPath)
        }
        catch {
            print("Error encoding new JSON Array. \(error.localizedDescription)" )
        }
        
        
    }
    
    
}
