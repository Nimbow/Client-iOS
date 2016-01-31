//
//  BinarySms.swift
//  client
//
//  Created by Awesome Developer on 23/01/16.
//  Copyright © 2016 Nimbow. All rights reserved.
//

public final class BinarySms : Sms {
    public var Data: NSData?
    public var Udh: String?
    
    public convenience init(from: String?, to: String?, data: NSData?, udh: String?) {
        self.init(from: from, to: to)
        Data = data
        Udh = udh
    }
    
    override func ToSendSmsRequest() -> SendSmsRequest {
        let request = super.ToSendSmsRequest()
        request.Type = SmsType.Binary
        request.Udh = Udh
        
        if (Data == nil) { return request; }
        
        var string = ""
        var byte: UInt8 = 0
        
        for i in 0 ..< Data!.length {
            Data!.getBytes(&byte, range: NSMakeRange(i, 1))
            string += String(format: "%04x", byte)
        }
        
        request.Text = string
        return request
    }
}