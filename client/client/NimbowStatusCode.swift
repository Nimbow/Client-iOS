//
//  SendSmsStatusCode.swift
//  client
//
//  Created by Awesome Developer on 17/01/16.
//  Copyright © 2015 Nimbow. All rights reserved.
//

public enum NimbowStatusCode : Int {
    case
    Success = 0,
    InternalError = 1,
    UnknownError = 2,
    InsufficientCredit = 3,
    InvalidApiCall = 4,
    InvalidApiKey = 5,
    
    ReceiverMissing = 101,
    MessageTextMissing = 102,
    InvalidNumericSenderLength = 200,
    
    MessageTextContainsNonGSMCharacters = 203,
    
    InvalidAlphaNumericSenderLength = 204,
    InvalidNumericReceiverLength = 205,
    ClientReferenceContainsNonValidCharacters = 208,
    InvalidType = 209,
    InvalidUdh = 210,
    MessageTextIsNotHexEncoded = 211
}