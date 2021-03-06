//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var finalResultLabel: UILabel!
    @IBOutlet weak var finalExplorationLabel: UILabel!
    
    var answersResults: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        countResults()
    }
    
    private func countResults() {
        var animalsKindCount: [AnimalType : Int] = [:]
        let animals = answersResults.map { $0.type }
                
        animals.forEach { animal in
            animalsKindCount[animal] = (animalsKindCount[animal] ?? 0) + 1
        }
        
        let animalsCountSorted = animalsKindCount.sorted { $0.value > $1.value }
        guard let winnerAnimal = animalsCountSorted.first?.key else { return }
        
        showResult(with: winnerAnimal)
    }
    
    private func showResult(with animal: AnimalType) {
        finalResultLabel.text = "Вы - \(animal.rawValue)"
        finalExplorationLabel.text = "\(animal.definition)"
    }
}
