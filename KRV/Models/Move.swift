//
//  Move.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 25/07/2022.
//

import Foundation

class Move: Codable {
	let gameId: UUID
	let whoPlayedId: UUID
	let valuePlayed: Int
	let slotId: Int
}
