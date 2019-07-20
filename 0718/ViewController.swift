//
//  ViewController.swift
//  0718
//
//  Created by Eason on 2019/7/18.
//  Copyright © 2019 Com.Eason. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var InputTextField: UITextField!
    func getUSAFlag() -> UIView{
        var rect = CGRect(x: 43, y: 40, width: 247, height: 130)
        let backgroundView = UIView(frame: rect)
        backgroundView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //宣告左側藍色小片長方形
        var bluerect = CGRect(x: 0, y: 0, width: 98.8, height: 70)
        let bluerectView = UIView(frame: bluerect)
        bluerectView.backgroundColor = UIColor(red: 0, green: 40/255, blue: 104/255, alpha: 1)
        backgroundView.addSubview(bluerectView)
        var shortxpoint:Double = 98.8;
        var shortypoint:Double = 0;
        let shortredsize = CGSize(width: 148.2, height: 10)
        let redcolor = UIColor(red: 196/255, green: 30/255, blue: 58/255, alpha: 1)
        var shortredpoint = [CGPoint(x: shortxpoint, y: shortypoint)]
        var shortredrect = [CGRect.init(origin: shortredpoint[0], size: shortredsize)];
        var shortredrectView = [UIView(frame: shortredrect[0])]
        shortredrectView[0].backgroundColor = redcolor
        for x in 1...3{
            shortypoint = shortypoint + 20
            shortredpoint.append(CGPoint(x: shortxpoint, y: shortypoint))
            shortredrect.append(CGRect.init(origin: shortredpoint[x], size: shortredsize))
            shortredrectView.append(UIView(frame: shortredrect[x]))
            shortredrectView[x].backgroundColor = redcolor
        }
        for x in 0...3{
            backgroundView.addSubview(shortredrectView[x])
        }
        var longxpoint:Double = Double(0);//0
        var longypoint:Double = Double(shortredpoint[3].y+20);//80
        var longredpoint = [CGPoint(x: longxpoint, y: longypoint)]
        let longredsize = CGSize(width: 247, height: 10)
        var longredrect = [CGRect.init(origin: longredpoint[0], size: longredsize)]
        var longredrectView = [UIView(frame: longredrect[0])]
        longredrectView[0].backgroundColor = redcolor
        for x in 1...2{
            longypoint = longypoint + 20
            longredpoint.append(CGPoint(x: longxpoint, y: longypoint))
            longredrect.append(CGRect.init(origin: longredpoint[x], size: longredsize))
            longredrectView.append(UIView(frame: longredrect[x]))
            longredrectView[x].backgroundColor = redcolor
        }
        for x in 0...2{
            backgroundView.addSubview(longredrectView[x])
        }
        var starxpoint:Double = Double(7);//7
        var starypoint:Double = Double(5);//5
        var starpoint:Array = [CGPoint(x: starxpoint, y: starypoint)]
        let starsize:CGSize = CGSize(width: 6, height: 6)
        var star:Array = [CGRect.init(origin: starpoint[0], size: starsize)]
        let starcolor:UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        var starView:Array = [UIImageView(image: UIImage(named: "star.png"))]
        starView[0].frame = star[0]
        starView[0].backgroundColor = starcolor
        for x in 1...29{
            if x%6 == 0 {
                starxpoint = Double(7)
                starypoint = starypoint + Double(13)
                starpoint.append(CGPoint(x: starxpoint, y: starypoint))
                star.append(CGRect.init(origin: starpoint[x], size: starsize))
                starView.append(UIImageView(image: UIImage(named: "star.png")))
                starView[x].frame = star[x]
                starView[x].backgroundColor = starcolor
            }
            else{
                starxpoint = starxpoint + Double(15)
                starpoint.append(CGPoint(x: starxpoint, y: starypoint))
                star.append(CGRect.init(origin: starpoint[x], size: starsize))
                starView.append(UIImageView(image: UIImage(named: "star.png")))
                starView[x].frame = star[x]
                starView[x].backgroundColor = starcolor
            }
        }
        starxpoint = Double(14.5)
        starypoint = Double(11.5)
        starpoint.append(CGPoint(x: starxpoint, y: starypoint))
        star.append(CGRect.init(origin: starpoint[30], size: starsize))
        starView.append(UIImageView(image: UIImage(named: "star.png")))
        starView[30].frame = star[30]
        starView[30].backgroundColor = starcolor
        for x in 31...49{
            if x%5 == 0{
                starxpoint = Double(14.5)
                starypoint = starypoint + Double(13)
                starpoint.append(CGPoint(x: starxpoint, y: starypoint))
                star.append(CGRect.init(origin: starpoint[x], size: starsize))
                starView.append(UIImageView(image: UIImage(named: "star.png")))
                starView[x].frame = star[x]
                starView[x].backgroundColor = starcolor
            }
            else{
                starxpoint = starxpoint + Double(15)
                starpoint.append(CGPoint(x: starxpoint, y: starypoint))
                star.append(CGRect.init(origin: starpoint[x], size: starsize))
                starView.append(UIImageView(image: UIImage(named: "star.png")))
                starView[x].frame = star[x]
                starView[x].backgroundColor = starcolor
            }
        }
        for x in 0...49{
            backgroundView.addSubview(starView[x])
        }
        return backgroundView
    }
    override func viewDidLoad() {
        //會先呼叫父類別的func,之後再去寫自己想寫的東西
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(getUSAFlag())
    }

    //Interface Builder
    @IBAction func speak(_ sender: Any) {
        //直接把欄位中輸入的值轉為text
        //print(InputTextFeild.text!)
        //透過AVFoundation來讓系統自動講話
        let speechUtterance = AVSpeechUtterance(string: InputTextField.text!)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
}

