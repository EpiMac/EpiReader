//
//  DataAccess.swift
//  EpiReader
//
//  Created by Alexandre Toubiana on 20/03/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

// MARK: - Router

private enum Router {
    case getGroups()
    case getTopics(Int)
    case getNews(String, Int)
    case getNewsWithDate(String, Int, String)
}

extension Router : RouterProtocol {
    
    //MARK: - API Method
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getGroups:
            return .get
        case .getTopics:
            return .get
        case .getNews:
            return .get
        case .getNewsWithDate:
            return .get
        }
    }
    // MARK: - API Path
    var path: String {
        switch self {
        case .getGroups:
            return Constants.Url.ENTRY_API_URL + Constants.Url.NEWS
        case .getTopics(let id):
            return Constants.Url.ENTRY_API_URL + Constants.Url.TOPICS + "/" + String(id)
        case .getNews(let group, let nb):
            return Constants.Url.ENTRY_API_URL + Constants.Url.NEWS + group + "?limit=" + String(nb)
        case .getNewsWithDate(let group, let nb, let date):
            return Constants.Url.ENTRY_API_URL + Constants.Url.NEWS + group + "?limit=" + String(nb) + "&start_date=" + date + "%2B0000"
        }
    }
}

// MARK: - Router request

extension Router: URLRequestConvertible {
    public func asURLRequest () throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: self.path)!)
        urlRequest.httpMethod = self.method.rawValue
        return urlRequest
    }
}

// MARK: - Class Main Data

class MainData {
    static func getGroups(completed: @escaping ((_ response:[Group]?, _ error:Error?) -> Void)) -> Void {
        Alamofire.request(Router.getGroups())
            .validate()
            .responseArray { (alamoResponse: DataResponse<[Group]>) in
                completed(alamoResponse.result.value, alamoResponse.result.error)
        }
    }
    
    static func getTopics(id: Int, completed: @escaping ((_ response:Topic?, _ error:Error?) -> Void)) -> Void {
        Alamofire.request(Router.getTopics(id))
            .validate()
            .responseObject { (alamoResponse: DataResponse<Topic>) in
                completed(alamoResponse.result.value, alamoResponse.result.error)
        }
    }
    
    static func getNews(group: String, nb: Int, completed: @escaping ((_ response:[News]?, _ error:Error?) -> Void)) -> Void {
        Alamofire.request(Router.getNews(group, nb))
            .validate()
            .responseArray { (alamoResponse: DataResponse<[News]>) in
                completed(alamoResponse.result.value, alamoResponse.result.error)
        }
    }
    
    static func getNewsWithDate(group: String, nb: Int, date: String, completed: @escaping ((_ response:[News]?, _ error:Error?) -> Void)) -> Void {
        Alamofire.request(Router.getNewsWithDate(group, nb, date))
            .validate()
            .responseArray { (alamoResponse: DataResponse<[News]>) in
                completed(alamoResponse.result.value, alamoResponse.result.error)
        }
    }
    
}
