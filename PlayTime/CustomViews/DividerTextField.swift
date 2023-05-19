//
//  DividerTextField.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 19/05/23.
//

import SwiftUI

struct DividerTextField: View {
	
	var title: String
	@Binding var text: String
	var dividerColor: Color?
	
    var body: some View {
		VStack{
			TextField(title, text: $text)
			Divider()
				.frame(height: 1)
				.background(dividerColor)
		}
    }
}
