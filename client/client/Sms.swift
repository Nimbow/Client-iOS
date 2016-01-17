//
//  Sms.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

public class Sms {
    public var From: String?
    public var To: String?
    public var Test: Bool
    public var GetMessageId: Bool
    public var GetMessageParts: Bool
    public var GetFrom: Bool
    public var GetTo: Bool
    public var GetNetCost: Bool
    
    init(from: String?, to: String?) {
        From = from
        To = to
        Test = false
        GetMessageId = false
        GetMessageParts = false
        GetFrom = false
        GetTo = false
        GetNetCost = false
    }
    
    func ToSendSmsRequest() -> SendSmsRequest {
        let request = SendSmsRequest()
        request.From = From
        request.To = To
        request.Test = Test
        request.GetMessageId = GetMessageId
        request.GetMessageParts = GetMessageParts
        request.GetFrom = GetFrom
        request.GetTo = GetTo
        request.GetNetCost = GetNetCost
        return request
    }
}