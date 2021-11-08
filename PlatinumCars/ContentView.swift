//
//  ContentView.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-04-11.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    @State var searchText = ""
    @State private var isEditing = false
    @State private var isTapped = false
    @State var selectedTab = 0
    
    @State var cars = c

    
    let data = (1...10).map { "\($0)" }
    var carCategories = sampleData
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#F7F7FA")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                        if(selectedTab == 0) {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.screenWidth / 2, alignment: .center)
                                .padding(.top, 20)
                                .padding(.bottom, 30)
                            ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                VStack {
                                    SearchBar(searchText: $searchText, isEditing: $isEditing, isTapped: $isTapped)
                                    HStack() {
                                        Text("Brands")
                                            .foregroundColor(Color(hex: "#181619").opacity(0.9))
                                        Spacer()
                                    }
                                    .font(.system(size: 15, weight: .semibold, design: .default))
                                    .padding(.top, 20)
                                }
                                .frame(width: UIScreen.screenWidth - 60, height: .infinity)
                                .padding(.vertical, 20)

                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        if isEditing && !searchText.isEmpty {
                                            ForEach(carCategories.filter({ "\($0)".contains(searchText)}), id: \.name) { carCategory in
                                                BrandsCardView(carCategory: carCategory)
                                            }
                                        } else {
                                            ForEach(carCategories.indices) { i in
                                                BrandsCardView(carCategory: carCategories[i])
                                                    .padding(.trailing, (i == carCategories.endIndex - 1) ? 30 : 0)
                                            }
                                            .lineLimit(1)
                                        }
                                    }
                                    .padding(.leading, 30)
                                }
                                .frame(width: .infinity)
                                
                                HStack() {
                                    Text("Available Cars")
                                        .foregroundColor(Color(hex: "#181619").opacity(0.9))
                                    Spacer()
                                }
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .padding([.top, .vertical], 20)
                                .frame(width: UIScreen.screenWidth - 60, height: .infinity)
                                
                                VStack(alignment: .leading, spacing: 25) {
                                    ForEach(cars.indices) { i in
                                        CarCardView(carInfo: $cars[i])
                                    }
                                }
                                .frame(width: UIScreen.screenWidth - 60, height: .infinity)
                                .padding(.bottom, 20)
                                
                            }
                            }
                        } else if (selectedTab == 1) {
                            Text("Page 2")
                        } else if (selectedTab == 2) {
                            Text("Page 3")
                        }
                        TabBar(selected: $selectedTab)
                    }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
