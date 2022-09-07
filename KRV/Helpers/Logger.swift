//
//  LoggerService.swift
//  UT
//
//  Created by Haakon Langaas Lageng on 18/05/2022.
//

import Foundation
import FirebaseCrashlytics

class Logger {
	static func Debug(_ message: String) {
#if DEBUG
		print("\n📘 DEBUG [\(getDate())]:\t \(message)\n")
#endif
	}
	
	static func Info(_ message: String) {
		print("\n📗 INFO [\(getDate())]:\t \(message)\n")
	}
	
	static func Warning(_ message: String) {
		print("\n📙 WARNING [\(getDate())]:\t \(message)\n")
	}
	
	static func Error(_ error: Error, _ message: String = "") {
		if message != "" {
			print("\n📕 ERROR [\(getDate())]:\t \(message): \(error.localizedDescription)\n")
		} else {
			print("\n📕 ERROR [\(getDate())]:\t \(error.localizedDescription)\n")
		}
		
		Crashlytics.crashlytics().record(error: error)
	}
	
	static func Error(_ message: String) {
		if message != "" {
			print("\n📕 ERROR [\(getDate())]:\t \(message)\n")
			
			let error = NSError(domain: message, code: 0, userInfo: nil)
			Crashlytics.crashlytics().record(error: error)
		}
	}
	
	private static func getDate() -> String {
		return "\(Date())"
	}
}
