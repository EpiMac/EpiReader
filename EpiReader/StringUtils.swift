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
