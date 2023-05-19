//
//  DecodeEx.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 08/05/23.
//

import Foundation

extension Encodable {
	
	var asJson: String? {
		let encoder = JSONEncoder()
		encoder.outputFormatting = .prettyPrinted
		
		guard let jsonData = try? encoder.encode(self) else {
			return nil
		}
		
		return String(data: jsonData, encoding: .utf8)
	}
	
}
