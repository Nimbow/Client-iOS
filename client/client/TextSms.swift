//
//  TextSms.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

public final class TextSms : Sms {
    public var Text: String?
    
    public convenience init(from: String?, to: String?, text: String?) {
        self.init(from: from, to: to)
        Text = text
    }
    
    override func ToSendSmsRequest() -> SendSmsRequest {
        let request = super.ToSendSmsRequest()
        request.Text = Text
        return request
    }
}