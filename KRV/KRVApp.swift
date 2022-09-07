//
//  KRVApp.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 21/07/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		
		FirebaseApp.configure()
		return true
	}
}

@main
struct KRVApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
			ZStack {
				Color.bg.ignoresSafeArea()
				MainView()
			}
        }
    }
}
