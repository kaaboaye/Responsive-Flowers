//
//  CheckoutView.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cart: CartStore
    
    var body: some View {
        List {
            ForEach(cart.lineItems) {CheckoutCellView(lineItem: $0)}
                .onDelete(perform: self.cart.deleteFLower)
        }
        .navigationBarTitle("Cart \(cart.totalValue.description)")
    }
}

struct CheckoutCellView: View {
    @EnvironmentObject var cart: CartStore
    
    @ObservedObject var lineItem: LineItem
    
    init(lineItem: LineItem) {
        self.lineItem = lineItem
    }
    
    var body: some View {
        HStack {
            Image(lineItem.flower.imageUrl)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(lineItem.flower.name)
            
            Spacer()
            
            Button("-") {
                self.cart.decrementItem(itemId: self.lineItem.id)
            }.buttonStyle(BorderlessButtonStyle())
            
            Text("\(lineItem.amaount)")
            
            Button("+") {
                self.cart.incrementItem(itemId: self.lineItem.id)
            }.buttonStyle(BorderlessButtonStyle())
            
            Spacer()
            
            Text(lineItem.value.description)
        }
    }
}
