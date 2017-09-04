//
//  ViewController.swift
//  sampleOmikuji
//
//  Created by 福田隆史 on 2017/08/31.
//  Copyright © 2017年 f.R. All rights reserved.
//

//何コマ目に　誰と　何をする

import UIKit

class ViewController: UIViewController {
    
    var flag = [0,0,0]
    var conf = 0
    var when = [1,2,3,4,5,6,7]
    var withWho = ["chris","nine","とむさん","えりこ先生","sheena","era","kim"]
    var doWhat = ["英語でおしゃべり","英語でおしゃべり","昼寝","デート","英語のテキスト","プログラミング","ムエタイ"]
    
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var whoLabel: UILabel!
    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func manager(){
        if flag[0] != 0 && flag[1] != 0 && flag[2] != 0 {
            
            for n in 0...flag.count-1 {flag[n] = 0}
            
            let alert = UIAlertController(title: "今日は", message: "\(String(describing: whenLabel.text!))コマ目に\(String(describing: whoLabel.text!))と\n\(String(describing: whatLabel.text!))をする", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:  .default, handler: {action in
                self.whenLabel.text = "x"
                self.whoLabel.text = "だれ"
                self.whatLabel.text = "なに" }))
            
            switch conf {
            case 0,1 :
                image.image = UIImage(named:"speak.png")
            case 2 :
                image.image = UIImage(named:"hirune.png")
            case 3 :
                image.image = UIImage(named:"date.jpeg")
            case 4 :
                image.image = UIImage(named:"engText.jpeg")
            case 5 :
                image.image = UIImage(named:"swift.jpg")
            case 6 :
                image.image = UIImage(named:"muetai.JPG")
            default:
                break
            }
            
            present(alert,animated: true,completion: nil)
            
        }
    }
    
    @IBAction func whenButton(_ sender: UIButton) {
        flag[0] = 1
        let r = Int(arc4random()) % when.count
        whenLabel.text = String(when[r])
        manager()
        
    }
    
    @IBAction func whoButton(_ sender: UIButton) {
        flag[1] = 1
        let r = Int(arc4random()) % withWho.count
        whoLabel.text = withWho[r]
        manager()
    }
    
    @IBAction func whatButton(_ sender: UIButton) {
        flag[2] = 1
        let r = Int(arc4random()) % doWhat.count
        whatLabel.text = doWhat[r]
        conf = r
        manager()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

