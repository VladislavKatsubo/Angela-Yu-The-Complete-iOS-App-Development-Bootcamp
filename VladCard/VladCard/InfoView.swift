//
//  InfoView.swift
//  VladCard
//
//  Created by Vlad Katsubo on 17.09.22.
//

import SwiftUI

struct InfoView: View {
    var text: String
    var imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(.white)
            .frame(width: 350, height: 50, alignment: .center)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .font(Font.custom("JuliusSansOne-Regular", size: 17))
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "sun.max")
            .previewLayout(.sizeThatFits)
    }
}
