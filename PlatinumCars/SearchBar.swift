//
//  SearchBar.swift
//  PlatinumCars
//
//  Created by Mantas Simanauskas on 2021-04-18.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isEditing: Bool
    @Binding var isTapped: Bool
    @State var animationFinished = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .opacity(isEditing ? 1 : 0.2)
                .font(.system(size: 20, weight: .medium, design: .default))
                .onTapGesture {
                    isTapped = true
                }
            if(isTapped) {
                TextField("Search cars", text: $searchText, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        isEditing = true
                    } else {
                        searchText = ""
                        isEditing = false
                        isTapped = false
                    }
                })
                .introspectTextField { textField in
                    _ = isTapped ? textField.becomeFirstResponder() : textField.resignFirstResponder()
                }
                .font(.system(size: 14, weight: .medium, design: .default))
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(isEditing ? Color.black.opacity(1) : Color.black.opacity(0.2), lineWidth: isEditing ? 2 : 0.3)
        )
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
