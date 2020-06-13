//
//  FlowerDetails.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import SwiftUI

struct FlowerDetails: View {
    @EnvironmentObject var cart: CartStore
    
    let flower: FlowerModel
    
    init(flower: FlowerModel) {
        self.flower = flower
    }
    
    var body: some View {
        VStack {
            Image(flower.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.horizontal)
            
            HStack {
                Text(flower.name)
                    .bold()
                    .font(.system(size: 48))
                
                Spacer()
                
                Text(flower.price.description)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            
            Text(flower.description)
                .padding(.all, 5)
            
            Button("Add to Cart") {
                self.cart.addFlower(flower: self.flower)
            }
            .padding(.all, 15)
            
            Spacer()
        }
        .navigationBarTitle(Text(flower.name), displayMode: .inline)
        .navigationBarItems(trailing:
            NavigationLink(destination: CheckoutView()){
                Text("Cart \(cart.totalValue.description)")
        })
    }
}

