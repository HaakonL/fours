//
//  BoardView.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 22/07/2022.
//

import SwiftUI
import Resolver

struct BoardView: View {
	@StateObject private var vm: BoardViewModel = Resolver.resolve()
	
    var body: some View {
		ZStack {
			let padding = 20.0
			let spacing = 5.0
			let size = UIScreen.main.bounds.width - (padding * 2) - (spacing * 3)
			let columns = [
				GridItem(spacing: spacing),
				GridItem(spacing: spacing),
				GridItem(spacing: spacing),
				GridItem(spacing: spacing),
				GridItem(spacing: spacing),
				GridItem(spacing: spacing)
			]
			
			VStack {
				
				VStack(alignment: .leading, spacing: spacing) {
					HStack {
						HStack(spacing: spacing) {
							Spacer()
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.bg)
								Text("1").font(.body).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.bg)
								Text("2").font(.body).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.bg)
								Text("3").font(.body).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.bg)
								Text("4").font(.body).bold()
							}
						}
					}
					
					HStack {
						HStack {
							if vm.currentPlayerId == 0 {
								Image(systemName: "arrow.forward")
							}
							Text("Player 1").font(.body).bold()
						}
						.padding(.leading, 5)
						
						HStack(spacing: spacing) {
							Spacer()
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.red)
								Text("\(vm.players.first?.tiles[1] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.red)
								Text("\(vm.players.first?.tiles[2] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.red)
								Text("\(vm.players.first?.tiles[3] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.red)
								Text("\(vm.players.first?.tiles[4] ?? 0)").font(.caption).bold()
							}
						}
					}
					.background {
						Color.teal.opacity(0.1)
					}
					
					HStack {
						HStack {
							if vm.currentPlayerId == 1 {
								Image(systemName: "arrow.forward")
							}
							Text("Player 2").font(.body).bold()
						}
						.padding(.leading, 5)
						
						HStack(spacing: spacing) {
							Spacer()
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.green)
								Text("\(vm.players.last?.tiles[1] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.green)
								Text("\(vm.players.last?.tiles[2] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.green)
								Text("\(vm.players.last?.tiles[3] ?? 0)").font(.caption).bold()
							}
							
							ZStack {
								Rectangle().frame(width: 30, height: 30).foregroundColor(.green)
								Text("\(vm.players.last?.tiles[4] ?? 0)").font(.caption).bold()
							}
						}
					}
					.background {
						Color.teal.opacity(0.1)
					}
				}
				.frame(width: UIScreen.main.bounds.width - (padding * 2))
				
				
				LazyVGrid(columns: columns, spacing: spacing) {
					ForEach(vm.cells) { cell in
						Button {
							vm.tapCell(cell.id)
						} label: {
							ZStack {
								Rectangle()
									.frame(width: size/Double(columns.count), height: size/Double(columns.count))
									.foregroundColor(cell.color)
									.opacity(cell.color == .teal ? 0.15 : 1.0)
								
								if cell.currentValue > 0 {
									Text("\(cell.currentValue)")
										.font(.title3)
										.monospacedDigit()
										.foregroundColor(.white)
								}
							}
						}
						.buttonStyle(.plain)
					}
				}
				.padding(.horizontal, padding)
				
				Button {
					vm.reset()
				} label: {
					Text("Reset")
				}

			}
		}
		.onAppear {
			vm.onLoad()
		}
	}
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
