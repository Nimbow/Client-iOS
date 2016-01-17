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
        NimbowApiClientAsync.SharedInstance.SendSmsAsync(TextSms(from: fromText!.text!, to: toText!.text!, text: contentText!.text!), completitionHandler : {
            response in
            dispatch_async(dispatch_get_main_queue()) {
                var statusString = String(response.StatusCode)
                statusString = statusString.substringFromIndex(statusString.startIndex.advancedBy(34)) // Values were chosen expertly by developer counting characters on screen
                statusString = statusString.substringToIndex(statusString.endIndex.advancedBy(-1))
                self.urlResult.text = statusString
                self.urlResult.textColor = response.StatusCode == SendSmsStatusCode.Success ? UIColor.greenColor() : UIColor.redColor()
            }
        })
    }
}

