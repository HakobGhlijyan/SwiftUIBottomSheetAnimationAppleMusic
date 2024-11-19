//
//  MusicInfo.swift
//  SwiftUIBottomSheetAnimationAppleMusic
//
//  Created by Hakob Ghlijyan on 18.11.2024.
//

import SwiftUI

//Reusable File
// Мы повторим эту точку зрения в развернутом нижнем листе.
struct MusicInfo: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    
    var body: some View {
        HStack(spacing: 0) {
            //Adding Matched Geometry Effect (Hero Animation)
            
            ZStack {
                if !expandSheet {
                    GeometryReader {
                        let size = $0.size
                        
                        Image("cover")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: expandSheet ? 15 : 5, style: .continuous ))
                    }
                    .matchedGeometryEffect(id: MGEffect.coverID, in: animation)
                }
            }
            .frame(width: 45, height: 45)
            
            Text("Wildest Dreams (Taylor's Version)")
                .fontWeight(.semibold)
                .lineLimit(1)
                .padding(.horizontal, 15)
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
            }

            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .font(.title2)
            }
            .padding(.leading, 25)

        }
        .foregroundStyle(.primary)
        .padding(.horizontal)
        .padding(.bottom, 5)
        .frame( height: 70)
        .contentShape(Rectangle())
        .onTapGesture {
            //Expanding bottom sheet
            withAnimation(.easeInOut(duration: 0.3)) {
                expandSheet = true
            }
        }
    }
}


#Preview {
    Main()
}
