//
//  Home.swift
//  SwiftUIBottomSheetAnimationAppleMusic
//
//  Created by Hakob Ghlijyan on 18.11.2024.
//

import SwiftUI

struct Home: View {
    //Animation Property
    @State private var expandSheet: Bool = false
    @Namespace private var animation
    
    var body: some View {
        //Tab View
        TabView {
            //Sample tab's
            ListenNow()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Listen Now")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
                .toolbar(expandSheet ? .hidden : .visible , for: .tabBar)
            
//            SampleTab("Listen Now", "play.circle.fill")
            SampleTab("Browse", "square.grid.2x2.fill")
            SampleTab("Radio", "dot.radiowaves.left.and.right")
            SampleTab("Music", "play.square.stack")
            SampleTab("Search", "magnifyingglass")
        }
        .tint(.red)
        .safeAreaInset(edge: .bottom) {
            CustomBottomSheet()
        }
        .overlay {
            if expandSheet {
                ExpandedBottomSheet(expandSheet: $expandSheet, animation: animation)
                    .transition(.asymmetric(insertion: .identity, removal: .offset (y: -5) ))
            }
        }
    }
    
    @ViewBuilder func ListenNow() -> some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Image("card")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Image("card")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding()
                .padding(.bottom, 100)
            }
            .navigationTitle("Listen Now ")
        }
    }
    
    @ViewBuilder func CustomBottomSheet() -> some View {
        ZStack {
            if expandSheet {
                Rectangle()
                    .fill(.clear)
            } else {
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .overlay {
                        //Music Info
                        MusicInfo(expandSheet: $expandSheet, animation: animation)
                    }
                    .matchedGeometryEffect(id: MGEffect.bgID, in: animation)
            }
        }
        .frame(height: 70)
        // Separator
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
        }
        // This is default  tab heigth
        .offset(y: -49)
    }
    
    @ViewBuilder func SampleTab(_ title: String, _ icon: String) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(title)
                .padding(.top, 25)
        }
        .tabItem {
            Image(systemName: icon)
            Text(title)
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(.ultraThickMaterial, for: .tabBar)
        .toolbar(expandSheet ? .hidden : .visible , for: .tabBar)
    }
}

#Preview {
    Main()
}
