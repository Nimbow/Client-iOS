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
    var ClientRef: String?
    var Type: SmsType
    var Test: Bool
    var GetMessageId: Bool
    var GetMessageParts: Bool
    var GetFrom: Bool
    var GetTo: Bool
    var GetNetCost: Bool
    var GetDeliveryReport: Bool
    var Udh: String?
    
    let ClientRefRegex = "^[a-zA-Z0-9-_]+$"
    let UdhRegex = "^[a-fA-F0-9-_]{1,14}$"
    
    init() {
        Type = SmsType.Gsm
        Test = false
        GetMessageId = false
        GetMessageParts = false
        GetFrom = false
        GetTo = false
        GetNetCost = false
        GetDeliveryReport = false
    }
    
    convenience init(from: String, to: String, text: String) {
        self.init()
        From = from
        To = to
        Text = text
    }
    
    func ToQueryParameterString() throws -> String {
        var queryParameters = Set<String>()
        
        if (Type != SmsType.Gsm) { queryParameters.insert("type=\(Type.rawValue)") }
        if (From != nil && !From!.isEmpty) { queryParameters.insert("from=\(From!)") }
        if (To != nil && !To!.isEmpty) { queryParameters.insert("to=\(To!)") }
        queryParameters.insert("text=\(Text!)")
        
        if (ClientRef != nil && !ClientRef!.isEmpty) {
            if (!NSPredicate(format:"SELF MATCHES %@", ClientRefRegex).evaluateWithObject(ClientRef)) {
                throw NimbowError.WrongClientRefFormat(clientRef: ClientRef!)
            }
            queryParameters.insert("clientRef=\(ClientRef!)")
        }
        if (Udh != nil && !Udh!.isEmpty) {
            if (!NSPredicate(format:"SELF MATCHES %@", UdhRegex).evaluateWithObject(Udh)) {
                throw NimbowError.WrongUdhFormat(udh: Udh!)
            }
            queryParameters.insert("udh=\(Udh!)")
        }
        
        if (Test) { queryParameters.insert("test=1") }
        if (GetMessageId) { queryParameters.insert("getMessageId=1") }
        if (GetMessageParts) { queryParameters.insert("getMessageParts=1") }
        if (GetFrom) { queryParameters.insert("getFrom=1") }
        if (GetTo) { queryParameters.insert("getTo=1") }
        if (GetNetCost) { queryParameters.insert("getNetCost=1") }
        if (GetDeliveryReport) { queryParameters.insert("getDeliveryReport=1") }
        
        return queryParameters.joinWithSeparator("&")
    }
}