//
//  Client.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

import FirebaseFunctions

let functions = Functions.functions()

class APIClient {
	static func getGame(
		_ game: String,
		completion: @escaping (([Response.Success.Game]) -> Void),
		completionError:@escaping ((Response.Error) -> Void)){
		perform(
			route: APIRoute.game(game),
			completion: completion,
			completionError: completionError
		)
	}
	static func getAllGames(
		completion: @escaping (([Response.Success.Game]) -> Void),
		completionError: @escaping ((Response.Error) -> Void)){
		perform(
			route: APIRoute.allGames,
			completion: completion,
			completionError: completionError
		)
	}
	
	private static func perform<S: Decodable>(
		route: APIRoute,
		completion: @escaping (S) -> Void,
		completionError: @escaping (Response.Error) -> Void
	) {
		let task = URLSession.shared.dataTask(with: route.request) { data, response, err in
			guard let httpResponse = response as? HTTPURLResponse else {
				completionError(Response.Error(
					message: "Error: Invalid response"
				))
				
				return
			}
			
			if let err {
				completionError(Response.Error(
					statusCode: httpResponse.statusCode,
					message: err.localizedDescription
				))
				return
			}
			
			
			if let data {
				print(String(data: data, encoding: .utf8)!)
				do {
					completion(try JSONDecoder().decode(S.self, from: data))
				} catch let err {
					completionError(Response.Error(
						statusCode: httpResponse.statusCode,
						message: "Error parsing JSON \(err.localizedDescription)"
					))
				}
			}
		}
		
		task.resume()
	}
}

