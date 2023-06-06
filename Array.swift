//
//  File.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 06/06/23.
//

import Foundation

extension Array {
	func limit(by value: Int) -> Array {
		return Array(prefix(upTo: Swift.min(count, value)))
	}
}
