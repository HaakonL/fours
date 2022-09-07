//
//  Bootstrap.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 26/07/2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
	public static func registerAllServices() {
		// Singletons
		register { UserService() }.scope(.application)

		// ViewModels
		register { BoardViewModel() }
	}
}
