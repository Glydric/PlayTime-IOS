//
//  StorageManager.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

class StorageManager {
	
	static var user: Response.Success.User? {
		get {
			guard
				let data = UserDefaults
				.standard
				.string(forKey: "userString"),
				let data = data.data(using: .utf8)
			else { return nil }
			
			return try? JSONDecoder().decode(Response.Success.User.self, from: data)
		}
		set {
			UserDefaults.standard.set(newValue.asJson, forKey: "userString")
		}
	}
	
	static var allGames: [Response.Success.Game] {
		get {
			guard
				let data = UserDefaults
				.standard
				.string(forKey: "allGames"),
				let data = data.data(using: .utf8)
			else { return [] }
			
			return (try? JSONDecoder().decode([Response.Success.Game].self, from: data)) ?? []
		}
		set {
			UserDefaults.standard.set(newValue.asJson, forKey: "allGames")
		}
	}
}

