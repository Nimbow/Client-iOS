//
//  ViewController.swift
//  iOS
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

import UIKit
import client

class ViewController: UIViewController {
    @IBOutlet var fromText: UITextField!
    @IBOutlet var toText: UITextField!
    @IBOutlet var contentText: UITextField!
    
    @IBOutlet var urlText: UITextField!
    @IBOutlet var urlResult: UITextView!
    
    var responseText: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func sendUp(sender: UIButton) {
        do
        {
            let sms: Sms
            switch sender.tag {
                case 0: sms = TextSms(from: fromText!.text!, to: toText!.text!, text: contentText!.text!)
                case 1: sms = UnicodeSms(from: fromText!.text!, to: toText!.text!, text: contentText!.text!)
                case 2: sms = BinarySms(from: fromText!.text!, to: toText!.text!, data: contentText!.text!.dataUsingEncoding(NSASCIIStringEncoding), udh: "06050423F423f4")
                default: return
            }
            
            try NimbowApiClientAsync.SharedInstance.SendSmsAsync(sms, completitionHandler : {
                response in
                dispatch_async(dispatch_get_main_queue()) {
                    var statusString = String(response.StatusCode)
                    statusString = statusString.substringFromIndex(statusString.startIndex.advancedBy(33)) // Values were chosen expertly by developer counting characters on screen
                    statusString = statusString.substringToIndex(statusString.endIndex.advancedBy(-1))
                    self.urlResult.text = statusString
                    self.urlResult.textColor = response.StatusCode == NimbowStatusCode.Success ? UIColor.greenColor() : UIColor.redColor()
                }
            })
        }
        catch NimbowError.WrongClientRefFormat(let clientRef) {
            self.urlResult.text = "Invalid ClientRef: \(clientRef)"
            self.urlResult.textColor = UIColor.redColor()
        }
        catch NimbowError.WrongUdhFormat(let udh) {
            self.urlResult.text = "Invalid Udh: \(udh)"
            self.urlResult.textColor = UIColor.redColor()
        }
        catch {
            self.urlResult.text = "Unexpected error!"
            self.urlResult.textColor = UIColor.redColor()
        }
    }
    @IBAction func balanceUp(sender: UIButton) {
        do
        {
            try NimbowApiClientAsync.SharedInstance.GetBalanceAsync({ (response) -> () in
                dispatch_async(dispatch_get_main_queue()) {
                    var statusString = String(response.StatusCode)
                    statusString = statusString.substringFromIndex(statusString.startIndex.advancedBy(33)) // Values were chosen expertly by    developer counting characters on screen
                    statusString = statusString.substringToIndex(statusString.endIndex.advancedBy(-1))
                    self.urlResult.text = statusString + "\r\nBalance: " + response.Balance!.description + "\r\nDateTime: " + response.DateTime!.description + "\r\nUnixTimeStamp: " + response.UnixTimeStamp!.description + "\r\nFreeMessagesCount: " + response.FreeMessagesCount!.description
                    self.urlResult.textColor = response.StatusCode == NimbowStatusCode.Success ? UIColor.greenColor() : UIColor.redColor()
                }})        }
        catch {
            self.urlResult.text = "Unexpected error!"
            self.urlResult.textColor = UIColor.redColor()
        }
    }
}

