//
//  Roadthird.swift
//  iii
//
//  Created by Haidarov N on 2/4/25.
//

import SwiftUI

struct RoadThird: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image("Back Icon")
                }
                Spacer()
                Text("Указат на карте")
                    .bold()
                Spacer()
            }
            .padding(12)
            .padding(.top)
            Divider()
            Text("Двигайте карту, чтобы выбрать место")
                .foregroundColor(.black.opacity(0.7))
                .padding(10)
            Text("проспект Исмоила Сомони, 66")
                .bold()
            
            NavigationLink(destination: {}, label: {
                Text("Готово")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.customGreen)
                    .foregroundColor(.white)
            })
            .cornerRadius(10)
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}
