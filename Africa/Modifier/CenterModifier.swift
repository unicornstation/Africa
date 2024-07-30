//
//  CenterModifier.swift
//  Africa
//
//  Created by Alyona Voronina on 30.07.2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
