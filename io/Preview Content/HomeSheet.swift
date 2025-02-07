//
//  HomeSheet.swift
//  iii
//
//  Created by Haidarov N on 2/4/25.
//

import SwiftUI

struct HomeSheet: View {
    @State var text: String
    @State var types: [String]
    @Binding var selectionType: String
    @Binding var destination: String
    @State var history: [String]
    @FocusState var isActivetextfield: Bool
    @State var navigateView: AnyView = AnyView(Text("Default View"))
    @State var presented = true
    @State private var isActive = false
    @State var go = false
    @Binding var sheetHeight: PresentationDetent
    var delegating = DelegateClass()
    var body: some View {
        VStack{
            SearchBar(text: $text)
                .padding()
            HStack(spacing: 25){
                VStack {
                    Image("4")
                        .resizable()
                        .frame(width: 56, height: 56)
                    Text("Главная")
                }
                NavigationLink(destination:  RoadFirst(types: types,
                                                       selectionType: selectionType,
                                                       destination: destination,
                                                       history: history,
                                                       navigateView: AnyView(RoadSecond(destination: $destination, history: history)), sheetHeight: $sheetHeight), isActive: $go){
                    VStack {
                        Image("1")
                            .resizable()
                            .frame(width: 56, height: 56)
                        Text("Маршрут")
                    }
                }
                                                       .onTapGesture {
                                                           delegating.tap()
                                                       }
                VStack {
                    Image("2")
                        .resizable()
                        .frame(width: 56, height: 56)
                    Text("События")
                }
                VStack {
                    Image("3")
                        .resizable()
                        .frame(width: 56, height: 56)
                    Text("Профиль")
                }
            }
            Spacer()
        }
        .onAppear(){
            withAnimation(.bouncy, {
                sheetHeight = .height(220)
            })
            
        }
        
        .background(.white)
    }
}



struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
                .padding([.vertical, .leading])
            
            TextField("Поиск мест", text: $text)
                .foregroundColor(.gray)
                .cornerRadius(12)
        }
        .background(.customGray)
        .cornerRadius(10)
    }
}


#Preview{
    ContentView()
}
