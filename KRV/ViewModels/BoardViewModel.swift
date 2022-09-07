//
//  BoardViewModel.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 24/07/2022.
//

import Foundation
import SwiftUI
import Resolver

class BoardViewModel: ObservableObject {
	@AppStorage("user") private var userData: Data?
	
	var userService: UserService = Resolver.resolve()
	
	@Published var currentUser: User!
	@Published var cells: [Cell] = []
	@Published var players: [Player] = []
	@Published var currentPlayerId: Int?
	
	@Published var game: Game?
	
	init() {
		loadUser()
		if currentUser == nil {
			saveUser()
		}
		
		Logger.Info("Loaded user with id: \(currentUser.id)")
	}
	
	func onLoad() {
		
		// Her skal det enten opprettes eller deltas i et game fra FireStore
		
		//self.game = Game(id: UUID(), )
		self.generatePlayers()
		self.generateCells()
	}
	
	private func loadUser() {
		guard let userData = userData else { return }

		do {
			currentUser = try JSONDecoder().decode(User.self, from: userData)
		} catch let error {
			Logger.Error(error, "loadUser() failed")
		}
	}
	
	private func saveUser() {
		currentUser = User()
		do {
			userData = try JSONEncoder().encode(currentUser)
		} catch let error {
			Logger.Error(error, "saveUser() failed")
		}
	}
	
	private func generateCells() -> Void {
		cells = []
		for i in 0..<36 {
			cells.append(Cell(id: i))
		}
	}
	
	private func generatePlayers() -> Void {
		players = []
		players.append(Player(id: 0, color: .red))
		players.append(Player(id: 1, color: .green))
		currentPlayerId = players.first!.id
	}
	
	func tapCell(_ id: Int) -> Void {
		let cell = cells.first { $0.id == id }
		let player = players.first { $0.id == currentPlayerId }
		
		if let cell = cell, let player = player {
			if cell.tap(player) {
				currentPlayerId = players.first { $0.id != player.id }!.id
				objectWillChange.send()
			}
		}
	}
	
	func reset() {
		self.currentPlayerId = nil
		onLoad()
	}
}
