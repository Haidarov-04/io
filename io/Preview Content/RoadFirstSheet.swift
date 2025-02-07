//
//  RoadFirstSheet.swift
//  iii
//
//  Created by Haidarov N on 2/4/25.
//

import SwiftUI



struct RoadFirst: View{
    @Environment(\.dismiss) var dismiss
    @State var types: [String]
    @State var selectionType: String
    @State var destination: String
    @State var history: [String]
    @FocusState var isActivetextfield: Bool
    @State var navigateView: AnyView = AnyView(Text("Default View"))
    @State var presented = true
    @State private var isActive = false
    @Binding var sheetHeight: PresentationDetent
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    HStack{
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image("Back Icon")
                                .resizable()
                                .frame(width: 20, height: 28)
                                .padding(8)
                        })
                        
                        Spacer()
                        Text("Маршрут")
                            .font(.system(size: 18))
                        Spacer()
                        Image("cancel")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(8)
                        
                    }
                    .padding(.top, sheetHeight == .medium ? 10: 40)
                    .padding(.horizontal)
                    Divider()
                    VStack(alignment: .leading){
                        HStack{
                            Image("Vector")
                            Text("Мое местоположение")
                            
                        }
                        Divider()
                        HStack{
                            Image("map trip item")
                            TextField("Куда", text: $destination)
                                .focused($isActivetextfield)
                        }
                        .onChange(of: isActivetextfield) { focused in
                            if focused {
                                isActive = true
                            }
                        }
                        NavigationLink(destination: navigateView, isActive: $isActive , label: {
                            EmptyView()
                        })
                    }
                    .padding()
                    .background(.customGray)
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    SegmentStyle(types: types)
                        .padding(.bottom)
                }
                .background(.white)
                List{
                    History(history: history)
                }
                .padding(EdgeInsets(top: -28, leading: -4.5, bottom: 0, trailing: -4.5))
                .scrollContentBackground(.hidden)
                .background(.customGray)
                Spacer()
            }
            .onAppear(){
                sheetHeight = .height(250)
            }
            .onDisappear(){
                sheetHeight = .height(220)
            }
            .background(.customGray)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ContentView()
}

