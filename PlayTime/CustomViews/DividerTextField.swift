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
	var textCase: TextInputAutocapitalization?
	var secure = false
	var dividerColor: Color?
	
	var body: some View {
		VStack{
			if secure {
				SecureField(title, text: $text)
					.textInputAutocapitalization(textCase)
					.autocorrectionDisabled(true)
			} else {
				TextField(title, text: $text)
					.textInputAutocapitalization(textCase)
					.autocorrectionDisabled(true)
			}
			
			Divider()
				.frame(height: 1)
				.background(dividerColor)
		}
	}
}
