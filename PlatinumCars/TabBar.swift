//
//  TabBar.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-04-18.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        Spacer(minLength: 0)
        Divider()
        HStack {
            
            Button(action: {
                self.selected = 0
            }) {
                Image(systemName: self.selected == 0 ? "car.fill" : "car")
                    .foregroundColor(Color(hex: "#181619").opacity(self.selected == 0 ? 1.0 : 0.75))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                self.selected = 1
            }) {
                Image(systemName: self.selected == 1 ? "case.fill" : "case")
                    .foregroundColor(Color(hex: "#181619").opacity(self.selected == 1 ? 1.0 : 0.75))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                self.selected = 2
            }) {
                Image(systemName: self.selected == 2 ? "wrench.fill" : "wrench")
                    .foregroundColor(Color(hex: "#181619").opacity(self.selected == 2 ? 1.0 : 0.75))
                    .padding(.horizontal)
            }
            
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
