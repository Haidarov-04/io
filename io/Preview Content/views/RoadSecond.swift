//
//  RoadSecond.swift
//  iii
//
//  Created by Haidarov N on 2/4/25.
//

import SwiftUI

struct RoadSecond: View {
    @Environment(\.dismiss) var dismiss
    @Binding var destination: String
    @State var history: [String]
    @State var listTap = false
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    HStack{
                        Image("map trip item")
                            .frame(width: 20, height: 20)
                            .padding(10)
                        TextField("Куда", text: $destination)
                    }
                    .background(.white)
                    .cornerRadius(10)
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("cancel")
                            .frame(width: 40, height: 40)
                    })
                    
                }
                .background(.customGray)
                .padding([.top, .leading, .trailing])
                VStack{
                    
                    List{
                        Section{
                            HStack{
                                Image("Vector")
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                                Text("Мое местоположение")
                            }
                            NavigationLink(destination: RoadThird(), label: {
                                HStack{
                                    Image("my_location")
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                                    Text("Указать на карте")
                                }
                            })
                            NavigationLink(destination: EmptyView(), label: {
                                HStack{
                                    Image("BookmarkOutline")
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12))
                                    Text("Избранны")
                                }
                            })
                        }
                        Section{
                            History(history: history)
                        }
                    }
                    .padding(EdgeInsets(top: -32, leading: -4.5, bottom: 0, trailing: -4.5))
                    .listSectionSpacing(20)
                    .scrollContentBackground(.hidden)
                    .background(.customGray)
                    .scrollDisabled(true)
                }
            }
            .background(.customGray)
            .navigationBarBackButtonHidden()
            Spacer()
        }
    }
}

struct History: View {
    @State var history: [String]
    var body: some View {
        ForEach(history, id: \.self){ i in
            HStack{
                Image(systemName: "clock.fill")
                    .foregroundColor(.gray.opacity(0.3))
                Text(i)
            }
        }
    }
    
}
