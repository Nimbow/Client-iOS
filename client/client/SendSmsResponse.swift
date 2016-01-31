//
//  SendSmsResult.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

public final class SendSmsResponse {
    public var StatusCode: NimbowStatusCode?
    public var MessageId: String?
    public var MessageParts: Int?
    public var From: String?
    public var To: String?
    public var NetCost: Float?
    
    public class func FromString(response: NSString) -> SendSmsResponse {
        let r = SendSmsResponse();
        
        let json = try! NSJSONSerialization.JSONObjectWithData(response.dataUsingEncoding(NSUTF8StringEncoding)!, options: .AllowFragments)
        
        r.StatusCode = NimbowStatusCode(rawValue: (json["StatusCode"] as? Int)!)
        r.MessageId = (json["MessageId"] as? String?)!
        r.MessageParts = (json["MessageParts"] as? Int?)!
        r.From = (json["From"] as? String?)!
        r.To = (json["To"] as? String?)!        
        r.NetCost = (json["NetCost"] as? Float?)!
        
        return r;
    }
}