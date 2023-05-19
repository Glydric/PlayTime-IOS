//
//  LabelledDivider.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 04/04/23.
//

import SwiftUI

struct LabelledDivider: View {
	
	let label: String
	let horizontalPadding: CGFloat
	let color: Color
	
	init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
		self.label = label
		self.horizontalPadding = horizontalPadding
		self.color = color
	}
	
	var body: some View {
		HStack {
			line
			Text(label).foregroundColor(color)
			line
		}
	}
	
	var line: some View {
		VStack { Divider().background(color) }.padding(horizontalPadding)
	}
}
