//
//  ViewController.swift
//  fontCustom
//
//  Created by Imcrinox Mac on 09/12/1444 AH.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    static let identifier = "FontsCell"

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var changeFont: UILabel!
    
//    var datas = ["thirty day of crash course","due to lot of new things added in wwdc2023 so the slot had been changed","the project has been declared to the new joined person","the projrct of getting that value things that are already done in the previous project","hope u guys are all understand that so however the happens to the progress","make a one step you can done it to the various of previous course has to been Done."]
//
    var date = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    var fontName = ["MFTongXin_Noncommercial-Regular",
                    "MFJinHei_Noncommercial-Regular",
                    "MFZhiHei_Noncommercial-Regular",
                    "Gaspar Regular",
                    "BNJinx Regular",
    "Jingle Hamsters Regular"]
    
    var fontRowIndex = 0
    
    @objc func changeFontDidTouch(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontName[fontRowIndex])
        table.reloadData()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeFont.layer.cornerRadius = 18
        changeFont .layer.masksToBounds = true
        
        changeFont.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,action: #selector(changeFontDidTouch(_:)))
        changeFont.addGestureRecognizer(gesture)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: ViewController.identifier, for: indexPath)
        let text = date[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.cyan
        cell.textLabel?.font = UIFont(name: self.fontName[fontRowIndex], size: 20)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return date.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}

