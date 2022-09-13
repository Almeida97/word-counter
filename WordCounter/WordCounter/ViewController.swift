//
//  ViewController.swift
//  WordCounter
//
//  Created by PAULO ALMEIDA on 13/09/2022.
//

import UIKit

struct Words {
    var word: String
    var frequency: Int
}

class ViewController: UIViewController {

    @IBOutlet var countButton: UIButton!
    @IBOutlet var sentenceTextField: UITextField!
    var wordArray = [Words]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sentenceTextField.text = ""
        wordArray = []
    }

    /// Seperates a sentence in ordered words and respective frequency.
    /// - Parameter sentence: The sentence to seperate
    /// - Returns:A Array of Objects(word and frequency)
    ///
    func countWordsIn(_ sentence:String)-> [Words]{
        let sentenceArray = sentence.components(separatedBy: " ").filter { !$0.isEmpty }

        /// Checking all words in sentenceArray and adding them to the wordArray, if that word already exists inside the array it will increment the frequency of said object instead.
        
        for word in sentenceArray {
            if let foundWordIndex = wordArray.firstIndex(where: {$0.word == word}) {
                wordArray[foundWordIndex].frequency += 1
            } else {
                wordArray.append(Words(word: word, frequency: 1))
            }
        }
        return wordArray
    }
    
    /// On button tap checks if sentence textfield is empty:
    /// - warning: - If empty shows alert - Else calls countWordsIn method with the text and performs segue.
    ///
    @IBAction func countButtonTapped(_ sender: Any){
        
        guard let sentence = sentenceTextField.text, !sentence.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Please enter a sentence", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
            return
        }
        wordArray = countWordsIn(sentence)
        performSegue(withIdentifier: "segueToSecondVC", sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.finalWordsArray = wordArray
    }

}

