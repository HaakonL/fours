//
//  Cell.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 24/07/2022.
//

import Foundation
import SwiftUI

class Cell: Identifiable {
	public private(set) var id: Int
	public var currentValue = 0
	public var color = Color.teal
	
	init(id: Int) {
		self.id = id
	}
	
	func tap(_ player: Player) -> Bool {
		if currentValue < 4 && player.tiles[currentValue+1]! > 0 && color != player.color {
			player.tiles[currentValue+1]! -= 1
			currentValue += 1
			color = player.color
			return true
		}
		return false
	}
}
