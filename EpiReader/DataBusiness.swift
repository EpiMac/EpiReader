//
//  DataBusiness.swift
//  EpiReader
//
//  Created by Alexandre Toubiana on 20/03/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Class Main Business

class MainBusiness {
    
    static func getGroups(completed: @escaping ((_ response:[Group]?, _ error:Error?) -> Void)) -> Void {
        MainData.getGroups() { (response, error) in
            completed(response, error)
        }
    }
    
    static func getTopics(id: Int, completed: @escaping ((_ response:Topic?, _ error:Error?) -> Void)) -> Void {
        MainData.getTopics(id: id) { (response, error) in
            completed(response, error)
        }
    }
    
    static func getNews(group: String, nb: Int, completed: @escaping ((_ response:[News]?, _ error:Error?) -> Void)) -> Void {
        MainData.getNews(group: group, nb: nb) { (response, error) in
            completed(response, error)
        }
    }
    
    static func getNewsWithDate(group: String, nb: Int, date: String, completed: @escaping ((_ response:[News]?, _ error:Error?) -> Void)) -> Void {
        MainData.getNewsWithDate(group: group, nb: nb, date: date) { (response, error) in
            completed(response, error)
        }
    }
}
