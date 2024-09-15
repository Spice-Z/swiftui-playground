//
//  CircleImage.swift
//  Landmarks
//
//  Created by Yugo Ogura on 2024-09-15.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 4))
            .shadow(radius: 7)
        let frameSize:CGFloat = 50
        let circleSize:CGFloat = 0.45*frameSize
        let borderWidth:CGFloat = 0.075*frameSize
        let centerY:CGFloat = frameSize/2 - circleSize / 2
        
        HStack (alignment: .center){
        ZStack{
            Path { path in
                path.addEllipse(in: CGRect(x: 0.05*frameSize, y: centerY, width: circleSize, height: circleSize))
                path.addEllipse(in: CGRect(x: 0.4995*frameSize, y: centerY, width: circleSize, height: circleSize))
            }
            .stroke(.gray, lineWidth: borderWidth)
            .frame(width: frameSize, height: frameSize)
            
            Path { path in
                path.addEllipse(in: CGRect(x: 0.37 * frameSize, y: centerY + 0.14*frameSize, width: 0.4 * circleSize, height: 0.35 * circleSize))
                path.addEllipse(in: CGRect(x: 0.45 * frameSize, y: centerY + 0.14*frameSize, width: 0.4 * circleSize, height: 0.35 * circleSize))
                       }
                       .fill(.gray)
                       .frame(width: frameSize, height: frameSize)
            
//            Path { path in
//                path.addRect(CGRect(x: 0, y: 0, width: frameSize, height: frameSize))
//            }
//            .stroke(.blue, lineWidth: 0.045*frameSize)
//            .frame(width: frameSize, height: frameSize)
           
        }
            Text("124").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundColor(.gray)
        }
        Text("Page Title will come here").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
//        MyIcon().fill(.blue).frame(width: 400, height: 400)
    }
}

struct MyIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: 0.26*width, y: 0.2925*height, width: 0.25*width, height: 0.25*height))
        path.addEllipse(in: CGRect(x: 0.49*width, y: 0.2925*height, width: 0.25*width, height: 0.25*height))
        
//        path.addEllipse(in: CGRect(x: 0.36*width, y: 0.435*height, width: 0.155*width, height: 0.13*height))
//        path.addEllipse(in: CGRect(x: 0.4825*width, y: 0.435*height, width: 0.155*width, height: 0.13*height))
        return path
    }
}

#Preview {
    CircleImage()
}
