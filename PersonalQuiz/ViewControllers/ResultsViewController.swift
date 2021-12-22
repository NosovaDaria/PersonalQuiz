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
        resultAnimalLabel.text = "Вы - \(result.rawValue)!"
        resultDescriptionLabel.text = "\(result.definition)"
    }
    
    private func calculateResult() {
        var answersCount = [AnimalType: Int]()
        
        for answer in answersChoosen {
            answersCount[answer.type] = answersCount[answer.type] ?? 0 + 1
        }

        result = answersCount.max(by: {$0.value < $1.value})?.key
        
    }

}

