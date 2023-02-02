

import UIKit

class QuestionViewController: UIViewController {

    private let questions =  Question.getQuestion()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []

    
    @IBOutlet weak var questionProgresView: UIProgressView!
    
    
    @IBOutlet weak var rangeSlider: UISlider!
   
    
    @IBOutlet var labelCollection: [UILabel]!
    

    @IBOutlet weak var rangeStackView: UIStackView!
    
    
    @IBOutlet var multipleSwitchesCollection: [UISwitch]!
    
    
    @IBOutlet var multipleLabelsCollection: [UILabel]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    
    @IBOutlet weak var questionLabelNew: UILabel!
   
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    
    @IBOutlet var buttonsCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideAllStackView()
    }
    
    
    @IBAction func rangeButtonAnswerPress(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
   
    
    @IBAction func multipleButtonQuestion(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitchesCollection, currentAnswers){
            if multipleSwitch.isOn{
                answersChoosen.append(answer)
            }
            
        }
        nextQuestion()
    }
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton){
            let currentAnswers = questions[questionIndex].answers
            guard let currentIndex = buttonsCollection.firstIndex(of: sender) else {return}
            let currentAnswer = currentAnswers[currentIndex]
            answersChoosen.append(currentAnswer)
            
            nextQuestion()
    }
    
    
    
    private func hideAllStackView(){
        for stackView in [singleStackView, multipleStackView, rangeStackView]{
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionIndex]
        questionLabelNew.text = currentQuestion.text
        
        let progressQuestion = Float(questionIndex) / Float(questions.count)
        questionProgresView.setProgress(progressQuestion, animated: true)
        
        title = "Вопрос № \(questionIndex+1) из \(questions.count)"
        
        let currentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .singeType:
            updateSingleStackView(using: currentAnswers)
        
        case .multiplyType:
            updateMultipleStackView(using: currentAnswers)
        case .rangeType:
            updateRangeStackView(using: currentAnswers)
        }
        
    }
    
    private func updateSingleStackView(using answers: [Answer]){
        singleStackView.isHidden = false
        
        for (button,answer) in zip(buttonsCollection,answers){
            button.setTitle(answer.text, for: .normal)
        }
        
        
    }
    
    private func updateMultipleStackView(using answers: [Answer]){
        multipleStackView.isHidden = false
        
        for(label, answer) in zip(multipleLabelsCollection, answers){
            label.text = answer.text
        }
    }
    
    private func updateRangeStackView(using answers: [Answer]){
        rangeStackView.isHidden = false
        labelCollection.first?.text = answers.first?.text
        labelCollection.last?.text = answers.last?.text
    }
    
    private func nextQuestion(){
        questionIndex += 1
        
        if(questionIndex < questions.count){
            hideAllStackView()
        }
        else{
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
        
    }

}

