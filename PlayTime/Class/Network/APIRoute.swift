//
//  APIPath.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

let gateway = "https://us-central1-playtime-78672.cloudfunctions.net/api/v1"

enum APIRoute {
	case game(String)
	case allGames
	
	fileprivate var method: String {
		switch self {
			case .game, .allGames:
				return "GET"
//			default:
//				return "POST"
		}
	}
	
	fileprivate var path: String {
		switch self {
			case .game(let game):
				return "/game/\(game)"
			case .allGames:
				return "/game/"
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
		
		self.init(url: URL(string: gateway + route.path.addingPercentEncoding(
					withAllowedCharacters: .urlPathAllowed
				)!
			)!
		)

		httpMethod = route.method
				
		if let body = route.body?.data(using: .utf8) {
			httpBody = body
		}
		
		addValue("application/json", forHTTPHeaderField: "Content-Type")
		
	}
}
