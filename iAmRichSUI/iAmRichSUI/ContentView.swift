//
//  ContentView.swift
//  iAmRichSUI
//
//  Created by Vlad Katsubo on 17.09.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                .foregroundColor(.white)
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 260, alignment: .center)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
