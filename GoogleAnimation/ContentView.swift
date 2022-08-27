//
//  ContentView.swift
//  GoogleAnimation
//
//  Created by Temiloluwa on 27/08/2022.
//


import SwiftUI

struct ContentView: View {
    
    @State private var onTop = false
    @State private var type = AnimationType(name: "default", animation: .default)
    @State private var showSelection = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            GeometryReader { geometry in
                
                HStack(spacing: 10){
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.red : Color.red)
                            .frame(width: 50, height: 50)
                        
                        Text("G")
                            .font(Font.system(size: 25, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        
                    }
                    ForEach(0..<2) { _ in
                        ZStack {

                            Circle()
                                .fill(LinearGradient(colors: [.orange, .red, .green, .yellow], startPoint: .leading, endPoint: .trailing))
                                .frame(width: 50, height: 50)
                            Text("O")
                                .font(Font.system(size: 25, weight: .medium, design: .default))
                                .foregroundColor(.white)

                        }
//                        .animation(.interactiveSpring(response: 0.23, dampingFraction: 0.10, blendDuration: 0.15), value: 1)
                        .animation(.easeInOut(duration: 3))
                 
                    }
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.green : Color.green)
                            .frame(width: 50, height: 50)
                        
                        
                        Text("G")
                            .font(Font.system(size: 25, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        
                    }
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.yellow : Color.yellow)
                            .frame(width: 50, height: 50)
                        
                        Text("L")
                            .font(Font.system(size: 25, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        
                    }
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.blue : Color.blue)
                            .frame(width: 50, height: 50)
                        
                        Text("E")
                            .font(Font.system(size: 30, weight: .medium, design: .default))
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .offset(y: onTop ? -geometry.size.height / 2 : geometry.size.height / 2)
                .animation(self.type.animation.speed(0.15))
                .padding(.horizontal)
                
            }
            
            Button{ onTop.toggle()} label: {
                
                Text("Animate")
                
                
            }
            Button{ showSelection = true} label: {
                
                Text("Choose Animation")
            }.actionSheet(isPresented: $showSelection, content: {
                actionSheet
            })
            
            Text("Current: \(type.name)")
        }
        
    }
    
    var actionSheet: ActionSheet {
        
        ActionSheet(title: Text("Animations"), buttons: AnimationType.all.map { type in
            
                .default(Text(type.name), action: { self.type = type})
            
        } + [.destructive(Text("Cancel"))] )
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimationType {
    
    let name: String
    
    let animation: Animation
    
    static var all: [AnimationType] = [
        .init(name: "default", animation: .default),
        .init(name: "easeIn", animation: .easeIn),
        .init(name: "easeOut", animation: .easeOut),
        .init(name: "easeInOut", animation: .easeInOut),
        .init(name: "linear", animation: .linear),
        .init(name: "spring", animation: .spring()),]
}

