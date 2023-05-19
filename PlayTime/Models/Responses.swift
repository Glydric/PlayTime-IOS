//
//  Responses.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

enum Response {
	struct Error {
		var statusCode: Int?
		let message: String
	}
	
	enum Success {
		struct Game: Codable {
			let title: String
			let pic: String
			let type: [String]
			let platform: [String]
			let date: Date
		}
		
		struct User: Codable {
			let email: String
			let tag: String?
			let password: String?
		}
	}
}


