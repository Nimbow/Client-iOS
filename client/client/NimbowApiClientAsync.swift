//
//  NimbowApiClientAsync.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

public class NimbowApiClientAsync
{
    public static let SharedInstance = NimbowApiClientAsync()
    
    private var infoValues: NSDictionary!
    
    private init() {
        let filePath = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")!
        self.infoValues = NSDictionary(contentsOfFile:filePath)
    }
        
    var baseUrl: String {
        return infoValues["Nimbow.Api.Url"] as! String
    }
    
    var apiKey: String {
        return infoValues["Nimbow.Api.Key"] as! String
    }
    
    public func SendSmsAsync(request: Sms, completitionHandler: (response: SendSmsResponse) -> ()) throws {
        let url = NSURL(string: baseUrl + "sms.json")
        let session = NSURLSession.sharedSession()
        let mutableRequest = NSMutableURLRequest(URL: url!)
        mutableRequest.setValue(apiKey, forHTTPHeaderField: "X-Nimbow-API-Key")
        mutableRequest.HTTPMethod = "POST"
        mutableRequest.HTTPBody = try request.ToSendSmsRequest().ToQueryParameterString().dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(mutableRequest, completionHandler: {(data, response, error) in
            let responseStr = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
            let response = SendSmsResponse.FromString(responseStr)
                completitionHandler(response: response)
        })
        task.resume()
    }
    
    public func GetBalanceAsync(completitionHandler: (response: GetBalanceResponse) -> ()) throws {
        let url = NSURL(string: baseUrl + "balance.json")
        let session = NSURLSession.sharedSession()
        let mutableRequest = NSMutableURLRequest(URL: url!)
        mutableRequest.setValue(apiKey, forHTTPHeaderField: "X-Nimbow-API-Key")
        mutableRequest.HTTPMethod = "POST"
        mutableRequest.HTTPBody = try GetBalanceRequest(getDT: true, getTS: true, getFMC: true).ToQueryParameterString().dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(mutableRequest, completionHandler: {(data, response, error) in
            let responseStr = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
            let response = GetBalanceResponse.FromString(responseStr)
            completitionHandler(response: response)
        })
        task.resume()

    }
}