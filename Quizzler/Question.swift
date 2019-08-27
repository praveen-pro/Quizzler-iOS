//
//  Question.swift
//  Quizzler
//
//  Created by Praveen J on 27/08/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
