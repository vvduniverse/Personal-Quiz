//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answersResults: [Answer]!
    
    @IBOutlet weak var finalResultLabel: UILabel!
    @IBOutlet weak var finalExplorationLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        printArray()
        countResults()
    }
    
    private func countResults() {
        var animalsCount: [AnimalType : Int] = [:]
        let animals = answersResults.map { $0.type }
        
        for animal in animals {
            animalsCount[animal] = (animalsCount[animal] ?? 0) + 1
        }
        
        let animalsCountSorted = animalsCount.sorted { $0.value > $1.value }
        
        guard let winnerAnimal = animalsCountSorted.first?.key else { return }
        
        updateUI(with: winnerAnimal)
     }
    
    private func updateUI(with animal: AnimalType) {
        finalResultLabel.text = "Вы - \(animal.rawValue)"
        finalExplorationLabel.text = "\(animal.definition)"
    }
    
    private func printArray() {
        print(answersResults.count)
        
        answersResults.forEach { some in
            print(some.type.rawValue)
            print(some.type)
            print(some.type.definition)
            print()
        }
    }
}
