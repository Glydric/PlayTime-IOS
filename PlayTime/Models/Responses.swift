//
//  Responses.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation
import SwiftUI

enum Response {
	struct Error {
		var statusCode: Int?
		var message: String = "Errore Generico"
	}
	
	enum Success {
		struct Game: Codable, Hashable {
			let _id: String
			let pic: String
			let title: String
			let type: [String]
			let platform: [String]
			let date: String
		}
		
		struct User: Codable {
			let email: String
			let tag: String?
			let password: String?
		}
	}
}


