//
//  MainView.swift
//  KRV
//
//  Created by Haakon Langaas Lageng on 22/07/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
		TabView {
			VStack {
				HeaderView()
				BoardView()
				FooterView()
			}
			.tabItem {
				Label("Game", systemImage: "gamecontroller.fill")
			}
			
			VStack {
				HeaderView()
				Text("Noe annet")
				FooterView()
			}
			.tabItem {
				Label("Statistics", systemImage: "chart.bar.fill")
			}
			
			VStack {
				HeaderView()
				Text("Settings")
				FooterView()
			}
			.tabItem {
				Label("Settings", systemImage: "gearshape")
			}
		}
		.accentColor(.teal)
    }
}

struct HeaderView: View {
	var body: some View {
		VStack {
			Text("Four In a Row")
			
			Text("[with a tiny twist]")
			
			Spacer()
		}
		.font(.title)
	}
}

struct FooterView: View {
	var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			Text("╮ (. ❛ ᴗ ❛.) ╭")
				.padding(.bottom, -2)
				.foregroundColor(.teal)
			
			Divider()
				.background(.ultraThinMaterial)
		}
	}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
