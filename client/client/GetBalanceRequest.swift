//
//  GetBalanceRequest.swift
//  client
//
//  Created by Awesome Developer on 31/01/16.
//  Copyright © 2016 Nimbow. All rights reserved.
//

public final class GetBalanceRequest {
    var GetDT: Bool
    var GetTS: Bool
    var GetFMC: Bool
    
    init() {
        GetDT = false
        GetTS = false
        GetFMC = false
    }
    
    convenience init(getDT: Bool, getTS: Bool, getFMC: Bool) {
        self.init()
        GetDT = getDT
        GetTS = getTS
        GetFMC = getFMC
    }
    
    func ToQueryParameterString() throws -> String {
        var queryParameters = Set<String>()
        
        if (GetDT) { queryParameters.insert("getDT=1") }
        if (GetTS) { queryParameters.insert("getTS=1") }
        if (GetFMC) { queryParameters.insert("getFMC=1") }
        
        return queryParameters.joinWithSeparator("&")
    }
}
