//
//  CarCardView.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-05-02.
//

import Foundation
import SwiftUI

struct CarCardView: View {
    @Binding var carInfo: Car
    
    
    var body: some View {
        VStack(spacing: 0) {
            ($carInfo.image.wrappedValue)
                .resizable()
                .frame(width: .infinity)
                .scaledToFill()
                .clipped()
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Text("\(carInfo.header())")
                        .foregroundColor(Color(hex: "#181619").opacity(0.25))
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .tracking(2)
                    Spacer()
                }
                
                HStack {
                    Text("\($carInfo.headline.wrappedValue)")
                        .foregroundColor(Color(hex: "#181619").opacity(0.9))
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .lineLimit(nil)
                    Spacer()
                }.frame(width: 250)
                
                HStack {
                    
                    HStack {
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                        Text("\($carInfo.price.wrappedValue)")
                            .foregroundColor(Color(hex: "#181619").opacity(0.9))
                            .font(.system(size: 13, weight: .semibold, design: .default))
                            .lineLimit(nil)
                            .padding(.leading, 5)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("\($carInfo.monthly.wrappedValue)")
                            .foregroundColor(Color(hex: "#181619").opacity(0.25))
                            .font(.system(size: 13, weight: .semibold, design: .default))
                            .lineLimit(nil)
                    }
                }
            }
            .padding(20)
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: UIScreen.screenWidth - 60)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        )
    }
}

