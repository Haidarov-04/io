//
//  ContentView.swift
//  iii
//
//  Created by Haidarov N on 2/3/25.
//

import SwiftUI
import MapKit

protocol BottomSheetChanged{
    func detent()
}

struct ContentView: View {
    @State var text = ""
    @State var presented = true
    @State var isActivetextfield = false
    @State var types = ["car.fill", "minibus", "taxi", "figure.walk" ]
    @State var selectionType = "car"
    @State var destination = ""
    @State var history = ["Panjshanbe", "Somon bazar", "KSU", "Аслфарм, Шелкокомбинат", "American Space Khujand" ]
    @State var go = false
    @State var navigateTopPadding = CGFloat(230)
    @State var sheetDetent: PresentationDetent = .height(220)
    var delegate: BottomSheetChanged?
    var delegating = DelegateClass()
    var body: some View {
        ZStack{
            Map()
            HStack{
                VStack{
                    Image("plus")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(8)
                        .shadow(radius: 0.7)
                    
                    Image("minus")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(8)
                        .shadow(radius: 0.7)
                    
                    Spacer()
                    
                    Image("location")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(8)
                        .background(.white)
                        .cornerRadius(32)
                        .padding(8)
                        .shadow(radius: 0.7)
                }
                .frame(height: 300)
                .padding(.top, navigateTopPadding)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topTrailing)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $presented){
            NavigationStack{
                VStack{
                    HomeSheet(text: text, types: types, selectionType: $selectionType, destination: $destination, history: history, sheetHeight: $sheetDetent)
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .background(.white)
                .foregroundColor(.black)
                .presentationDetents( [.height(220),.height(250), .medium, .large ], selection: $sheetDetent)
                .presentationCornerRadius(20)
                .presentationBackground(.customGray)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .interactiveDismissDisabled()
                .presentationDragIndicator(.hidden)
                .onChange(of: sheetDetent) { newDetent in
                    UIView.animate(withDuration: 3, animations: {
                        if newDetent == .medium{
                            self.navigateTopPadding = 40
                        } else if newDetent == .height(220){
                            self.navigateTopPadding = 230
                        }
                    })
                    
                    
                }
            }
            .background(.white)
        }
    }
}



#Preview {
    ContentView()
}

