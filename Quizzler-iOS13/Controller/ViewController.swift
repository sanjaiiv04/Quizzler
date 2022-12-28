
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {// Do any additional setup after loading the view.
        super.viewDidLoad()
        //creating a rounded progrss bar with cornerRadius
        
        /*progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 8
        progressBar.subviews[1].clipsToBounds = true
         */
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAns=sender.currentTitle! //getting true/false from the button that is clicked
        let checkAnswer=quizBrain.checkAnswer(userAnswer: userAns)
        if checkAnswer=="green"
        {
            sender.backgroundColor=UIColor.green //if answer is right turn the button green for 0.2 seconds and clear the bg again
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2 ) { [self] in
                firstButton.backgroundColor=UIColor.clear
                secondButton.backgroundColor=UIColor.clear
                thirdButton.backgroundColor=UIColor.clear
            }
        }
        else if checkAnswer=="red"
        {
            sender.backgroundColor=UIColor.red //if answer is wrong turn the button red for 0.2 seconds and clear the bg again
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2 ) { [self] in
                firstButton.backgroundColor=UIColor.clear
                secondButton.backgroundColor=UIColor.clear
                thirdButton.backgroundColor=UIColor.clear
            }
        }
        quizBrain.nextQuestion()
        updateUI()
    }
    func updateUI()
    {
        firstButton.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[0], for: .normal)
        secondButton.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[1], for: .normal)
        thirdButton.setTitle(quizBrain.quiz[quizBrain.questionNumber].answer[2], for: .normal)
        //animating the questions from the array quiz
        UIView.transition(with: questionLabel,
                      duration: 0.4,
                       options: .transitionCrossDissolve,
                    animations: { [weak self] in
            self?.questionLabel.text = self!.quizBrain.quiz[self!.quizBrain.questionNumber].text
                 }, completion: nil)
        
        //animating the progress bar such that it is animated for each question
        
        /*UIView.animate(withDuration:0.4) {
            self.progressBar.setProgress(Float(duration), animated: true)
        }
        progressBar.progress=quizBrain.getProgress()
         */
        scoreLabel.text="Score:\(quizBrain.getScore())"
        countLabel.text="\(quizBrain.questionNumber+1)/12"
        
    }
}

