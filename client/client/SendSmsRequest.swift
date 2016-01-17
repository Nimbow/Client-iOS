//
//  SendSmsRequest.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

import Foundation

final class SendSmsRequest {
    var From: String?
    var To: String?
    var Text: String?
    var Type: SmsType
    var Test: Bool
    var GetMessageId: Bool
    var GetMessageParts: Bool
    var GetFrom: Bool
    var GetTo: Bool
    var GetNetCost: Bool
    
    init() {
        Type = SmsType.Gsm
        Test = false
        GetMessageId = false
        GetMessageParts = false
        GetFrom = false
        GetTo = false
        GetNetCost = false
    }
    
    convenience init(from: String, to: String, text: String) {
        self.init()
        From = from
        To = to
        Text = text
    }
    
    func ToQueryParameterString() -> String {
        var queryParameters = Set<String>()
        
        if (Type != SmsType.Gsm) { queryParameters.insert("type=\(Type.rawValue)") }
        if (From != nil && !From!.isEmpty) { queryParameters.insert("from=\(From!)") }
        if (To != nil && !To!.isEmpty) { queryParameters.insert("to=\(To!)") }
        queryParameters.insert("text=\(Text!)")
        if (Test) { queryParameters.insert("test=1") }
        if (GetMessageId) { queryParameters.insert("getMessageId=1") }
        if (GetMessageParts) { queryParameters.insert("getMessageParts=1") }
        if (GetFrom) { queryParameters.insert("getFrom=1") }
        if (GetTo) { queryParameters.insert("getTo=1") }
        if (GetNetCost) { queryParameters.insert("getNetCost=1") }
        
        return queryParameters.joinWithSeparator("&")
    }
}