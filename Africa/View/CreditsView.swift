//
//  CreditsView.swift
//  Africa
//
//  Created by Alyona Voronina on 30.07.2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Robert Petras
    All right reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }//: VStack
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
        .previewLayout(.sizeThatFits)
        .padding()
}
