//
//  BinarySms.swift
//  client
//
//  Created by Awesome Developer on 23/01/16.
//  Copyright © 2016 Nimbow. All rights reserved.
//

public final class UnicodeSms : Sms {
    public var Text: String?
    
    public convenience init(from: String?, to: String?, text: String?) {
        self.init(from: from, to: to)
        Text = text
    }
    
    override func ToSendSmsRequest() -> SendSmsRequest {
        let request = super.ToSendSmsRequest()
        request.Type = SmsType.Unicode

        if (Text == nil) { return request; }
        
        var string = ""
        
        for char in Text!.unicodeScalars {
            string += String(format: "%04x", char.value)
        }
        
        request.Text = string
        return request
    }
}