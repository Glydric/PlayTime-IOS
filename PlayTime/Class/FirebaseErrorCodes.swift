//
//  FirebaseErrorCodes.swift
//  PlayTime
//
//  Created by Leonardo Migliorelli on 22/05/23.
//

import Foundation

enum FirebaseErrorCodes: String {
	case ERROR_WEAK_PASSWORD
	case ERROR_WRONG_PASSWORD
	case ERROR_MISSING_EMAIL
	case ERROR_INVALID_EMAIL
	case ERROR_EMAIL_ALREADY_IN_USE
	
	init?(_ rawValue: String?) {
		if let rawValue {
			self.init(rawValue: rawValue)
		} else {
			return nil
		}
	}
	
	var describe: String {
		switch self {
			case .ERROR_WEAK_PASSWORD:
				return "La password deve contenere almeno 6 caratteri"
			case .ERROR_WRONG_PASSWORD:
				return "La password è errata"
			case .ERROR_MISSING_EMAIL:
				return "Email non inserita"
			case .ERROR_INVALID_EMAIL:
				return "Email non valida"
			case .ERROR_EMAIL_ALREADY_IN_USE:
				return "Email già esistente, si prega di eseguire il login"
		}
	}
}
