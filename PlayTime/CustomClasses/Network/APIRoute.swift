//
//  APIPath.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

let gateway = "https://us-central1-playtime-78672.cloudfunctions.net/api"

enum APIRoute {
	case game(String)
	
	fileprivate var method: String {
		switch self {
			case .game:
				return "GET"
//			default:
//				return "POST"
		}
	}
	
	fileprivate var path: String {
		switch self {
			case .game(let game):
				return "/game/\(game)"
		}
	}
	
	fileprivate var body: String? {
		switch self {
			default:
				return nil
		}
	}
	
	var request: URLRequest { URLRequest(self) }
}

extension URLRequest {
	init(_ route: APIRoute){
		self.init(url: URL(string: gateway + route.path)!)

		httpMethod = route.method
				
		if let body = route.body?.data(using: .utf8) {
			httpBody = body
		}
		
		addValue("application/json", forHTTPHeaderField: "Content-Type")
		
	}
}
