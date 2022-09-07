//
//  Player.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 24/07/2022.
//

import SwiftUI

class Player {
	public private(set) var id: Int
	public private(set) var color: Color
	var tiles: [Int:Int] = [1:8, 2:6, 3:4, 4:2] // [Value:Amount]
	
	init(id: Int, color: Color) {
		self.id = id
		self.color = color
	}
}
