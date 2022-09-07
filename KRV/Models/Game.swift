//
//  Game.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 25/07/2022.
//

import Foundation

class Game: Codable {
	let id: UUID
	let p1Id: UUID
	let p2Id: UUID
	let moves: [Move]
	
	init(id: UUID, p1Id: UUID, p2Id: UUID, moves: [Move] = []) {
		self.id = id
		self.p1Id = p1Id
		self.p2Id = p2Id
		self.moves = moves
	}
}
