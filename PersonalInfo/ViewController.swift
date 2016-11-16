//
//  ViewController.swift
//  PersonalInfo
//
//  Created by MichelleMeng on 16/11/3.
//  Copyright © 2016年 MichelleMeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightShow: UILabel!
    
    
    @IBOutlet weak var workOrNot: UISwitch!
    
    
    @IBOutlet weak var resultShow: UITextView!
    
    func ageWithDateOfBirth(date: NSDate) -> NSInteger {
        // 出生日期转换 年月日
        let components1 = NSCalendar.currentCalendar().components([.NSYearCalendarUnit, .NSMonthCalendarUnit , .NSDayCalendarUnit], fromDate: date);
        let brithDateYear  = components1.year;
        let brithDateDay   = components1.day;
        let brithDateMonth = components1.month;
        
        // 获取系统当前 年月日
        let components2 = NSCalendar.currentCalendar().components([.NSYearCalendarUnit, .NSMonthCalendarUnit , .NSDayCalendarUnit], fromDate: NSDate())
        let currentDateYear  = components2.year;
        let currentDateDay   = components2.day;
        let currentDateMonth = components2.month;
        
        // 计算年龄
        var iAge = currentDateYear - brithDateYear - 1;
        if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
            iAge++;  
        }  
        
        return iAge;  
    }
    
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        let genderText = gender.selectedSegmentIndex == 0 ? "男" : "女"
        
        let age = ageWithDateOfBirth(birthday.date)
        
        let work = workOrNot.on ? "有工作" : "没工作"
        
        resultShow.text = "\(name.text!), \(genderText), \(age)岁, 身高\(heightShow.text!), 目前\(work)"
        
    }
    
    
    @IBAction func heightChanged(sender: AnyObject) {
        var slider = sender as! UISlider
        var i = Int(slider.value)
        heightShow.text = "\(i)厘米"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

