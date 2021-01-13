//
//  ViewController.swift
//  SpeechAPP2
//
//  Created by 井関竜太郎 on 2021/01/10.
import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    let speechService = SpeechService()
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var between: UILabel!
    @IBOutlet weak var Segument: UISegmentedControl!
    @IBOutlet weak var fake: UILabel!
    
    
    
    let userTimer:Int = 10000
    //秒のためのもの
    var count = 0
    var switchAudio: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ボタンの状態
        startButton.isHidden = false
        fake.isHidden = true
        //textfieldの状態
        textField2.isUserInteractionEnabled = true
        
        timeLabel.text = "00"
        between.text = ":"
        secondLabel.text = "00"
        startButton.layer.borderWidth = 3
        startButton.layer.borderColor = UIColor.green.cgColor
        startButton.layer.cornerRadius = 65.0
        fake.layer.borderWidth = 3
        fake.layer.borderColor = UIColor.green.cgColor
        fake.layer.cornerRadius = 65.0
        fake.layer.masksToBounds = true
        // stopButton.layer.borderWidth = 3
        // stopButton.layer.borderColor = UIColor.red.cgColor
        // stopButton.layer.cornerRadius = 65.0
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        textField2.delegate = self
        textField2.clearButtonMode = UITextField.ViewMode.always
        textField2.returnKeyType = UIReturnKeyType.done
    }
    
    //タイマーの作成
    func createTimer(){
        count = userTimer * 60
        let timer = Timer.scheduledTimer(timeInterval: 1.0,target: self,selector: #selector(self.timerAction(sender:)),userInfo: nil,repeats: true)
        timer.fire()
    }
    
    @objc func timerAction(sender:Timer){
        
        if count >= 10000 {
            timeLabel.text = "00"
            secondLabel.text = "00"
        }else{
            
        
        
        if count >= 60 {
            let minuteCount = count / 60
            timeLabel.text = String(minuteCount)
            secondLabel.text = "00"
            count -= 1
        }
        //60秒の時のテキストを調整する。
        else if count < 60{
            timeLabel.text = "00"
            secondLabel.text = String(count)
            if count == 0{
                speechService.say("しゅーうーーーりょーーーーーーう！！")
                timeLabel.text = "00"
                secondLabel.text = "00"
                startButton.isHidden = false
                fake.isHidden = true
                
                textField2.isUserInteractionEnabled = true
                
                
                switchAudio = false
                
                sender.invalidate()
            }
            count -= 1
        }
    }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func SegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if let text = textField2.text, !text.isEmpty {
                if switchAudio == true {
                    count = 15
                    speechService.say(textField2.text! + "15秒------スターーーーーーーーーーーーート！！！")
                    startButton.isHidden = true
                    fake.isHidden = false
                    
                    
                    textField2.isUserInteractionEnabled = false
                    
                    
                }else{
                    print("動かないよ")
                }
            }else{
                
            }
        case 1:
            //テキストフィールドを文字を打つと、音が鳴る
            if let text = textField2.text, !text.isEmpty {
                if switchAudio == true {
                    count = 30
                    speechService.say(textField2.text! + "30秒------スターーーーーーーーーーーーート！！！")
                    startButton.isHidden = true
                    fake.isHidden = false
                    
                    
                    textField2.isUserInteractionEnabled = false
                    
                    
                    
                    
                }else{
                    print("動かないよ")
                }
            }else{
                print("ないよ")
            }
        case 2:
            if let text = textField2.text, !text.isEmpty {
                if switchAudio == true {
                    count = 45
                    speechService.say(textField2.text! + "45秒------スターーーーーーーーーーーーート！！！")
                    startButton.isHidden = true
                    fake.isHidden = false
                    
                    
                    textField2.isUserInteractionEnabled = false
                    
                    
                    
                }else{
                    print("動かないよ")
                }
            }else{
                print("ないよ")
            }
        case 3:
            if let text = textField2.text, !text.isEmpty {
                if switchAudio == true {
                    count = 60
                    speechService.say(textField2.text! + "60秒------スターーーーーーーーーーーーート！！！")
                    startButton.isHidden = true
                    fake.isHidden = false
                    
                    
                    textField2.isUserInteractionEnabled = false
                    
                    
                }else{
                    print("動かないよ")
                }
            }else{
                print("ないよ")
            }
        default:
            print("該当なし")
        }
    }
    
    
    @IBAction func start(_ sender: Any) {
        
        //もしtextFieldが記入していたら。
        if let text = textField2.text, !text.isEmpty {
            //画面が表示されたらタイマーを動かす
            createTimer()
            //speechService.say(textField2.text! + "スターーーーーーーーーーーーート！！！")
            speechService.say("４つから選んでください")
            //OK
            startButton.isHidden = true
            fake.isHidden = false
            
            
            textField2.isUserInteractionEnabled = false
            
            
            
            switchAudio = true
        }else{
            let dialog = UIAlertController(title: "テキストが空です。", message: "", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "記入してください", style: .default, handler: nil))
            self.present(dialog, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func stop(_ sender: Any) {
        speechService.stop()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField2.resignFirstResponder()
        return true
    }
}

