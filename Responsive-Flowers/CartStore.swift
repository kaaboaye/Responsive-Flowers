//
//  Cart.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import Foundation
import SwiftUI

class CartStore: ObservableObject {
    @Published var lineItems: [LineItem] = []
    @Published var totalValue = PLN(grosze: 0)

    func addFlower(flower: FlowerModel) {
        if let lineItem = lineItems.first(where: {$0.flower.id == flower.id}) {
            lineItem.amaount += 1
        } else {
            let lineItem = LineItem(flower: flower)
            lineItems.append(lineItem)
        }

        self.recomputeTotalValue()
    }
    
    func deleteFLower(at: IndexSet) {
        self.lineItems.remove(atOffsets: at)
        
        self.recomputeTotalValue()
    }
    
    func incrementItem(itemId: UUID) {
        lineItems
            .first(where: {$0.id == itemId})!.amaount += 1

        self.recomputeTotalValue()
    }
    
    func decrementItem(itemId: UUID) {
        let lineItem = lineItems.first(where: {$0.id == itemId})!
        
        lineItem.amaount -= 1
            
        if lineItem.amaount <= 0 {
            lineItems.remove(at: lineItems.firstIndex(where: {$0.id == itemId})!)
        }

        self.recomputeTotalValue()
    }
    
    private func recomputeTotalValue() {
        let totalGrosze = lineItems.reduce(0, {$0 + $1.value.grosze})
        self.totalValue = PLN(grosze: totalGrosze)
    }
}

class LineItem: Identifiable, ObservableObject {
    init(flower: FlowerModel) {
        self.flower = flower
    }
    
    let id = UUID()
    @Published var amaount: Int = 1
    let flower: FlowerModel
    
    var value: PLN {
        PLN(grosze: self.amaount * self.flower.price.grosze)
    }
}
