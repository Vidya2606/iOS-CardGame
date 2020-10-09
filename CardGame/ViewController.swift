//
//  ViewController.swift
//  CardGame
//
//  Created by Maheshwara Reddy on 10/8/20.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCardGame: UILabel!
    @IBOutlet weak var lblPlayer1: UIButton!
    @IBOutlet weak var Player1Card1: UIImageView!
    @IBOutlet weak var Player1Card2: UIImageView!
    @IBOutlet weak var Player1Card3: UIImageView!
    @IBOutlet weak var lblPlayer2: UILabel!
    @IBOutlet weak var Player2Card1: UIImageView!
    @IBOutlet weak var Player2Card2: UIImageView!
    @IBOutlet weak var Player2Card3: UIImageView!
    @IBOutlet weak var lblWinner: UILabel!
    
    var player1CardImage1 = -1
    var player1CardImage2 = -1
    var player1CardImage3 = -1
    var player2CardImage1 = -1
    var player2CardImage2 = -1
    var player2CardImage3 = -1
    
    let imageNames = ["2C", "2D", "2H", "2S", "3C", "3D", "3H", "3S", "4C", "4D", "4H", "4S", "5C", "5D", "5H", "5S", "6C", "6D", "6H", "6S", "7C", "7D", "7H", "7S","8C", "8D", "8H", "9S", "9C", "9D", "9H", "9S", "10C", "10D", "10H", "10S", "AC", "AD", "AH", "AS", "JC", "JD", "JH", "JS", "KC", "KD", "KH", "KS", "QC", "QD", "QH", "QS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialView()
    }
    
    func initialView() {
        Player1Card1.image = UIImage(named: "blue_back")
        Player1Card2.image = UIImage(named: "gray_back")
        Player1Card3.image = UIImage(named: "green_back")
        Player2Card1.image = UIImage(named: "purple_back")
        Player2Card2.image = UIImage(named: "red_back")
        Player2Card3.image = UIImage(named: "yellow_back")
        lblWinner.text = " "
    }
    
    func selectCard() {
        let numbers = generateNumbers(repetitions: 6, maxValue: 51)
        Player1Card1.image = UIImage(named: imageNames[numbers[0]])
        Player1Card2.image = UIImage(named: imageNames[numbers[1]])
        Player1Card3.image = UIImage(named: imageNames[numbers[2]])
        Player2Card1.image = UIImage(named: imageNames[numbers[3]])
        Player2Card2.image = UIImage(named: imageNames[numbers[4]])
        Player2Card3.image = UIImage(named: imageNames[numbers[5]])
    }
    
    // Function to generate 6 unique random numbers
    func generateNumbers(repetitions: Int, maxValue: Int) -> [Int] {
        var numbers: [Int] = []
        guard maxValue >= repetitions else {
            fatalError("maxValue must be >= repetitions for the numbers to be unique")
        }
        numbers = []
        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = random(maxValue: maxValue)
            } while numbers.contains(n)
            numbers.append(n)
        }
        return numbers
    }
    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue + 1)))
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        selectCard()
        if ( Player1Card1.image == UIImage(named: imageNames[39]) || Player1Card2.image == UIImage(named: imageNames[39]) || Player1Card3.image == UIImage(named: imageNames[39])) {
            lblWinner.text = "Winner is Player-1"
            displayAlert()
        }
        else if ( Player2Card1.image == UIImage(named: imageNames[39]) || Player2Card2.image == UIImage(named: imageNames[39]) || Player2Card3.image == UIImage(named: imageNames[39])) {
            lblWinner.text = "Winner is Player-2"
            displayAlert()
        }
        else {
            lblWinner.text = "Play again"
        }
    }
    
    // function to create alert
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    func displayAlert() {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Play again?", message: " ", preferredStyle: .alert)
        // Create Yes button with action handler
        let yes = UIAlertAction(title: "Yes", style: .default, handler: { (ACTION) -> Void in
            self.initialView()
        })
        // Create No button with action handler
        let no = UIAlertAction(title: "No", style: .cancel, handler: { (ACTION) -> Void in
        })
        //Add yes and no button to dialog message
        dialogMessage.addAction(yes)
        dialogMessage.addAction(no)
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
    }
}

