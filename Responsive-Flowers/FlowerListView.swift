//
//  FlowerListView.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import SwiftUI

struct FlowerListView: View {
  let flowers = FlowerModel.getAll()
  
  var body: some View {
    NavigationView {
      List(flowers) { flower in
        NavigationLink(destination: FlowerDetails(flower: flower)){
          FlowerCell(flower: flower)
        }
      }
      .navigationBarTitle("Flowers")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    FlowerListView()
  }
}

struct FlowerCell: View {
  let flower: FlowerModel
  
  init(flower: FlowerModel) {
    self.flower = flower
  }
  
  var body: some View {
    HStack {
      Image(flower.imageUrl)
        .resizable()
        .frame(width: 100, height: 100)
      
      VStack(alignment: .leading) {
        Text(flower.name)
        Text(flower.price.description)
      }
    }
  }
}
