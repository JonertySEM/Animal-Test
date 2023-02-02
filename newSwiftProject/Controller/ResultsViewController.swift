

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultDescriptionLable: UILabel!
    @IBOutlet weak var resultAnswerLabel: UILabel!
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
        
    }
    
    private func updateResult(){
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map {$0.typeAnimal}
        
        for animal in animals{
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedDictionary = frequencyOfAnimals.sorted {$0.value > $1.value}
        
        guard let maximumFrequenceAnimal = sortedDictionary.first?.key else {return}
        
        updateAnimal(with: maximumFrequenceAnimal)
    
        
    }
    
    private func updateAnimal(with Animal: AnimalType){
        resultAnswerLabel.text = "Вы - \(Animal.rawValue)"
        resultDescriptionLable.text = "\(Animal.difinition)"
        
    }
}
