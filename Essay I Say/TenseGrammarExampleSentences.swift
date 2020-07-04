//
//  TenseGrammarExampleSentences.swift
//  Essay I Say
//
//  Created by Andrew on 04.07.20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import Foundation


enum Time: String, CaseIterable, Codable, Hashable {
      case Past, Present, Future
  }
enum Aspect: String, CaseIterable, Hashable {
    case Simple, Continuous, PerfectSimple = "perfect simple", PerfectContinuous = "perfect continuous"
}
enum Voice: String, CaseIterable, Codable, Hashable {
    case Active, Passive
}
struct Tense: Codable, Hashable {
    let value : String
    
    init(time: Time, aspect: Aspect, voice: Voice) {
        self.value = "\(time.rawValue.capitalized) \(aspect.rawValue.capitalized) \(aspect.rawValue.capitalized)"
    }
}

class TenseGrammarExampleSentences {
    
    let table : [Tense: [String]] = [
        // MARK: ACTIVE
        Tense(time: .Present, aspect: .Simple, voice: .Active): [
        ],
        Tense(time: .Present, aspect: .Continuous, voice: .Active): [
        ],
        Tense(time: .Present, aspect: .PerfectSimple, voice: .Active): [
        ],
        Tense(time: .Present, aspect: .PerfectContinuous, voice: .Active): [
        ],
        
        Tense(time: .Past, aspect: .Simple, voice: .Active): [
        ],
        Tense(time: .Past, aspect: .Continuous, voice: .Active): [
        ],
        Tense(time: .Past, aspect: .PerfectSimple, voice: .Active): [
        ],
        Tense(time: .Past, aspect: .PerfectContinuous, voice: .Active): [
        ],
        
        Tense(time: .Future, aspect: .Simple, voice: .Active): [
        ],
        Tense(time: .Future, aspect: .Continuous, voice: .Active): [
        ],
        Tense(time: .Future, aspect: .PerfectSimple, voice: .Active): [
        ],
        Tense(time: .Future, aspect: .PerfectContinuous, voice: .Active): [
        ],
        
        
        // MARK: Passive
        Tense(time: .Present, aspect: .Simple, voice: .Passive): [
        ],
        Tense(time: .Present, aspect: .Continuous, voice: .Passive): [
        ],
        Tense(time: .Present, aspect: .PerfectSimple, voice: .Passive): [
        ],
        Tense(time: .Present, aspect: .PerfectContinuous, voice: .Passive): [
        ],
        
        Tense(time: .Past, aspect: .Simple, voice: .Passive): [
        ],
        Tense(time: .Past, aspect: .Continuous, voice: .Passive): [
        ],
        Tense(time: .Past, aspect: .PerfectSimple, voice: .Passive): [
        ],
        Tense(time: .Past, aspect: .PerfectContinuous, voice: .Passive): [
        ],
        
        Tense(time: .Future, aspect: .Simple, voice: .Passive): [
        ],
        Tense(time: .Future, aspect: .Continuous, voice: .Passive): [
        ],
        Tense(time: .Future, aspect: .PerfectSimple, voice: .Passive): [
        ],
        Tense(time: .Future, aspect: .PerfectContinuous, voice: .Passive): [
        ],
    ]
    
}
