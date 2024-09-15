//
//  ContentView.swift
//  Landmarks
//
//  Created by Yugo Ogura on 2024-09-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello turtle!")
                .font(.largeTitle)
            .foregroundColor(.green)
            HStack{
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/).font(.subheadline).shadow(radius: 20)
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/).font(.subheadline)
            }
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
