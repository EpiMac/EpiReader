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
    
    static func postSubscribeNotification(service: String, registration_id: String, host: String, newsgroup: String, completed: @escaping ((_ response:NotificationSub?, _ error:Error?) -> Void)) -> Void {
        MainData.postSubscribeNotification(service: service, registration_id: registration_id, host: host, newsgroup: newsgroup) { (response, error) in
            completed(response, error)
        }
    }
    
    static func postUnsubscribeNotification(service: String, registration_id: String, host: String, newsgroup: String, completed: @escaping ((_ response:NotificationUnsub?, _ error:Error?) -> Void)) -> Void {
        MainData.postUnsubscribeNotification(service: service, registration_id: registration_id, host: host, newsgroup: newsgroup) { (response, error) in
            completed(response, error)
        }
    }
    
    static func getSubscribedGroups(service: String, registration_id: String, host: String, completed: @escaping ((_ response:[NotificationGroups]?, _ error:Error?) -> Void)) -> Void {
        MainData.getSubscribedGroups(service: service, registration_id: registration_id, host: host) { (response, error) in
            completed(response, error)
        }
    }
}
