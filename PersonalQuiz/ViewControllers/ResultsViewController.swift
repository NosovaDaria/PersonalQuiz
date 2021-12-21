//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answersChoosen: [Answer] = []
    
    private var result: AnimalType!
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим живтным
    // 4. Избавится от кнопки возврата назад на экран результатов
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        calculateResult()
        resultAnimalLabel.text = "Вы - \(result.rawValue)"
        resultDescriptionLabel.text = "\(result.definition)"
    }
    
    private func calculateResult() {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for answer in answersChoosen {
            switch answer.type {
            case .dog :
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
            if dogCount >= catCount && dogCount >= rabbitCount && dogCount >= turtleCount {
                result = .dog
            } else if catCount >= dogCount && catCount >= rabbitCount && catCount >= turtleCount {
                result = .cat
            } else if rabbitCount >= dogCount && rabbitCount >= catCount && rabbitCount >= turtleCount {
                result = .rabbit
            } else if turtleCount >= dogCount && turtleCount >= catCount && turtleCount >= rabbitCount {
                result = .turtle
            }
        }
    }

}
