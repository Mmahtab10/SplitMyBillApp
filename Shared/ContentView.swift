//
//  ContentView.swift
//  Shared
//
//  Created by Mahtab Khan on 2021-10-11.
//
import SwiftUI

struct ContentView: View {
    @State private var total: Double = 0.0
    @State private var persons: Double = 0.0
    @State private var totalPerPerson = 0.0
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
    }()
    
    var body: some View {

        ZStack {
            
            AnimatedBackground().edgesIgnoringSafeArea(.all)
                        .blur(radius: 50)
            VStack {
                
                Text("Split My Bill")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding()
                
                Text("Enter Total Bill Below")
                    .font(.headline)
                
                TextField("Total Bill", value: $total, formatter: formatter)
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                
                Text("Enter Total Number of People Below")
                    .font(.headline)
                
                TextField("Total People", value: $persons, formatter: formatter)
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                
                Button(action:{
                    totalPerPerson = total / persons
//                    print(totalPerPerson)
                },
                       label: {
                    Text("CALCULATE")
                        .foregroundColor(Color.white)
                        .background(Color.green.opacity(0.1).cornerRadius(10))
                })
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                
                Text("Total per person:")
                    .font(.headline)
                    .multilineTextAlignment(.leading).padding()
                
                Text("$ " + String(totalPerPerson) )
                       }
                Spacer()
            }
        }
}

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [Color.blue, Color.red, Color.purple, Color.pink, Color.yellow, Color.green, Color.orange]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
            .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                
                self.start = UnitPoint(x: 4, y: 0)
                self.end = UnitPoint(x: 0, y: 2)
                self.start = UnitPoint(x: -4, y: 20)
                self.start = UnitPoint(x: 4, y: 0)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
