//
//  ContentView.swift
//  BackgroundNextTrack
//
//  Created by Artyom on 10.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
            }
        }
        .buttonStyle(AnimatedButtonStyle())
    }
}

struct AnimatedButtonStyle: ButtonStyle {
    @State private var animation = false
    @Namespace private var imageValue

    func makeBody(configuration: Configuration) -> some View {
        let systemName = "play.fill"
        
        return HStack(alignment: .center, spacing: 0){
            Image(systemName: systemName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .scaleEffect(animation ? 1 : 0)
                .opacity(animation ? 1 : 0)
                .offset(x: animation ? 20 : 10)
                .matchedGeometryEffect(id: "id", in: imageValue, isSource: true)
            
            Image(systemName: systemName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .offset(x: animation ? 50 : 24)
                .matchedGeometryEffect(id: "id", in: imageValue, isSource: false)
            
            Image(systemName: systemName)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .scaleEffect(animation ? 0 : 1)
                .offset(x: animation ? 80 : 50)
                .opacity(animation ? 0 : 1)
                .matchedGeometryEffect(id: "id", in: imageValue, isSource: false)
        }
        .frame(maxHeight: .infinity, alignment: .center)
        .scaleEffect(configuration.isPressed ? 0.86 : 1.0)
        .animation(.easeOut(duration: 0.22), value: configuration.isPressed)
        .background(
            Circle()
                .fill(Color.gray.opacity(0.2))
                .scaleEffect(configuration.isPressed ? 1 : 0)
                .animation(.easeOut(duration: 0.22), value: configuration.isPressed)
        )
        .onTapGesture {
            withAnimation(.interactiveSpring(duration: 0.22)) {
                animation = true
            } completion: {
                animation = false
            }
        }
    }
}

#Preview {
    ContentView()
}
