//
//  StringUtils.swift
//  EpiReader
//
//  Created by Alexandre Toubiana on 21/03/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import Foundation

public func parseAuthor(_ authorStr: String) -> [String] {
    var author = ""
    var mail = ""
    var inMail = false
    for i in authorStr.characters {
        if inMail == false {
            if i == "<" {
                inMail = true
            }
            else {
                author.append(i)
            }
        }
        else {
            if i == ">" {
                inMail = true
            }
            else {
                mail.append(i)
            }
        }
    }
    return [author, mail]
}

public func parseLogin(_ mailStr: String) -> String {
    var login = ""
    for i in mailStr.characters {
        if i == "@" {
            return login
        }
        else {
            login.append(i)
        }
    }
    return login
}

public func parseSubject(_ subjectStr: String) -> [String] {
    var subs = [String]()
    var tmp = ""
    var isInCroch = false
    for i in subjectStr.characters {
        if isInCroch == false {
            if i == "[" {
                isInCroch = true
            }
            else {
                tmp.append(i)
            }
        }
        else {
            if i == "]" {
                subs.append(tmp)
                tmp = ""
                isInCroch = false
            }
            else {
                tmp.append(i)
            }
        }
    }
    subs.append(tmp)
    return subs
}

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map { result.rangeAt($0).location != NSNotFound
                ? nsString.substring(with: result.rangeAt($0))
                : ""
            }
        }
    }
}
