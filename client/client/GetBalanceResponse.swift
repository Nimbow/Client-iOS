//
//  GetBalanceResponse.swift
//  client
//
//  Created by Awesome Developer on 31/01/16.
//  Copyright © 2016 Nimbow. All rights reserved.
//

public final class GetBalanceResponse {
    public var StatusCode: NimbowStatusCode?
    public var Balance: Float?
    public var DateTime: NSDate?
    public var UnixTimeStamp: Int?
    public var FreeMessagesCount: Int?

    
    public class func FromString(response: NSString) -> GetBalanceResponse {
        let r = GetBalanceResponse();
        
        let json = try! NSJSONSerialization.JSONObjectWithData(response.dataUsingEncoding(NSUTF8StringEncoding)!, options: .AllowFragments)
        
        r.StatusCode = NimbowStatusCode(rawValue: (json["StatusCode"] as? Int)!)
        r.Balance = Float(json["Balance"] as! String)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        r.DateTime = dateFormatter.dateFromString(json["IsoDateTime"] as! String)
        
        r.UnixTimeStamp = Int(json["UnixTimeStamp"] as! String)
        r.FreeMessagesCount = Int(json["FreeMessagesCount"] as! String)
        
        return r;
    }
}
