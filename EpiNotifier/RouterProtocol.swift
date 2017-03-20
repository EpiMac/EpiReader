//
//  RouterProtocol.swift
//  EpiNotifier
//
//  Created by Alexandre Toubiana on 20/03/2017.
//  Copyright © 2017 Alexandre Toubiana. All rights reserved.
//

import Foundation
import Alamofire

protocol RouterProtocol {
  var method: Alamofire.HTTPMethod { get }
  var path: String { get }
}
