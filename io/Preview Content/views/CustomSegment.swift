//
//  CustomSegment.swift
//  iii
//
//  Created by Haidarov N on 2/4/25.
//

import SwiftUI

struct SegmentStyle: View {
    @State var active = [true, false, false, false]
    @State var types: [String]
    var body: some View {
        HStack{
            ForEach(0..<types.count, id: \.self){ i in
                VStack {
                    Image(types[i])
//                        .resizable()
//                        .frame(width: 23, height: 18)
                        .foregroundColor(active[i] ? .black: .gray)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                }
                .background(active[i] ? .white: .clear)
                .cornerRadius(10)
                .shadow(color: active[i] ? .black : .white, radius: 2, x: 0, y: 0)
                .onTapGesture {
                    active[i] = true
                    for z in 0..<active.count{
                        if i != z{
                            active[z] = false
                        }
                    }
                }
                .padding(2)
            }
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
