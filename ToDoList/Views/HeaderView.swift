//
//  HeaderView.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(background )
                .rotationEffect(Angle(degrees: angle))

            VStack {
                
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()

                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 2, height: 320)
        .offset(y: -160)
    }
}


#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
