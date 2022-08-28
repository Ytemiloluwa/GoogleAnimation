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
                            .fill(onTop ? Color.orange : Color.red)
                            .frame(width: 50, height: 50)
                        
                        Text("G")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                        
                    }.animation(.easeInOut(duration: 4))
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.pink : Color.white)
                            .frame(width: 50, height: 50)
                        Text("o")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.black)
                        
                        
                    }.animation(.easeInOut(duration: 5))
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.purple : Color.white)
                            .frame(width: 50, height: 50)
                        Text("o")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.black)
                        
                        
                    }.animation(.easeInOut(duration: 6))
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? Color.brown : Color.green)
                            .frame(width: 50, height: 50)
                        
                        
                        Text("G")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                        
                    }.animation(.easeInOut(duration: 7))
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? .cyan : Color.yellow)
                            .frame(width: 50, height: 50)
                        
                        Text("l")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                        
                    }.animation(.easeInOut(duration: 8))
                    
                    ZStack {
                        
                        Circle()
                            .fill(onTop ? .mint : Color.blue)
                            .frame(width: 50, height: 50)
                        
                        Text("e")
                            .font(Font.system(size: 40, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                        
                    }.animation(.easeInOut(duration: 9))
                    
                }
                .offset(y: onTop ? -geometry.size.height / 2 : geometry.size.height / 2)
//                .rotation3DEffect(Angle(degrees: -5), axis: (x: 5, y: 10, z: 15))
                .padding(.leading)
                
            }
            
                Button{ onTop.toggle()} label: {
                    Text("animate")
                }
                
                //.onTapGesture(count: 5, perform: {})
            
            
          
            //            Button{ showSelection = true} label: {
            //
            //                Text("Choose Animation")
            //            }.actionSheet(isPresented: $showSelection, content: {
            //                actionSheet
            //            })
            //
            //            Text("Current: \(type.name)")
            //        }
            
        }
        //
        //    var actionSheet: ActionSheet {
        //
        //        ActionSheet(title: Text("Animations"), buttons: AnimationType.all.map { type in
        //
        //                .default(Text(type.name), action: { self.type = type})
        //
        //        } + [.destructive(Text("Cancel"))] )
        //    }
        
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
    
}
