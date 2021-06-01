//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var answers: [Answer] = []
    
    private var answersCount = [AnimalType: Int]()

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        answersCountAnimals()
        showQuizResult()
    }
    
    // MARK: - Methods
    private func answersCountAnimals() {
        answers.forEach { answer in
            if answersCount.keys.contains(answer.type) {
                answersCount[answer.type]! += 1
            } else {
                answersCount[answer.type] = 1
            }
        }
    }
    
    private func showQuizResult() {
        if let maxItem = answersCount.max(by: { a, b in a.value < b.value }) {
            let animalIcon = maxItem.key.rawValue
            let animalDefinition = maxItem.key.definition
            
            titleLabel.text = "Вы - \(animalIcon)"
            descriptionLabel.text = animalDefinition
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.hidesBackButton = true
    }
}
