//
//  ContentView.swift
//  VladCard
//
//  Created by Vlad Katsubo on 17.09.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("vlad")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 270, height: 175, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color(red: 0.31, green: 0.43, blue: 0.48), lineWidth: 5))
                Text("Vladislav Katsubo")
                    .foregroundColor(Color(red: 0.31, green: 0.43, blue: 0.48))
                    .font(Font.custom("JuliusSansOne-Regular", size: 26))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                Text("iOS Developer")
                    .foregroundColor(Color(red: 0.31, green: 0.43, blue: 0.48))
                    .font(Font.custom("JuliusSansOne-Regular", size: 20))
                Divider()
                InfoView(text: "+375(44)745-20-87", imageName: "phone.fill")
                InfoView(text: "vladislav.katsubo@gmail.com", imageName: "envelope.fill")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


