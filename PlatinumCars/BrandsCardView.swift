//
//  BrandsCardView.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-05-27.
//

import SwiftUI

struct BrandsCardView: View {
    @State var carCategory: CarCategory
    
    var body: some View {
        NavigationLink(destination: Text(carCategory.name)){
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 170)
                .foregroundColor(.white)
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(carCategory.availableCars)")
                                .foregroundColor(Color.black.opacity(0.25))
                                .font(.system(size: 15, weight: .bold, design: .default))
                        }
                        .padding(.top, 15)
                        .padding(.trailing, 15)
                        carCategory.logo
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 75)
                            .offset(y: -10)
                        Text(carCategory.name)
                            .font(.system(size: 15, weight: .semibold, design: .default))
                            .foregroundColor(Color(hex: "#181619").opacity(0.9))
                        Spacer()
                    }
                )
        }
        .buttonStyle(FlatLinkStyle())
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct BrandsCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
