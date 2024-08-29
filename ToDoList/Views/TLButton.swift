//
//  TLButton.swift
//  ToDoList
//
//  Created by Nazmi Ceylan on 26.08.2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void

    var body: some View {
        Button(
            action: action,
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(background)

                    Text(title)
                        .foregroundStyle(.white)
                        .bold()
                }
            }
        )
        .frame(height: 45)
        .padding()
    }
}

#Preview {
    TLButton(title: "Title", background: .blue){}
}
