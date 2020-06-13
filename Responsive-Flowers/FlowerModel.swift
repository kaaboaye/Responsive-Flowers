//
//  FlowerModel.swift
//  Responsive-Flowers
//
//  Created by Mieszko Wawrzyniak on 13/06/2020.
//  Copyright © 2020 Mieszko Wawrzyniak. All rights reserved.
//

import Foundation

struct FlowerModel: Identifiable {
  let id = UUID()
  let name: String
  let imageUrl: String
  let description: String
  let price: PLN
}

let loremIpsum = """
Tulipan (Tulipa L.) – rodzaj roślin cebulowych należący do rodziny liliowatych. Zalicza się do niego ok. 120 gatunków i co najmniej 15 tysięcy kultywarów (odmian uprawnych). Odmiany uprawne są mieszańcami lub powstały na drodze mutacji[3]. Naturalny obszar występowania tulipana to Europa Południowa, północna Afryka, Azja od Turcji, przez Iran, góry Pamir i Hindukusz, stepy Kazachstanu, po północno-wschodnie Chiny i Japonię[4].

Szukasz sposobu aby pokazać bliskim, że o nich pamiętasz? Chcesz aby ukochana osoba wiedziała, że jest dla ciebie ważna?
Nie ma lepszego sposobu na podarunek niż kwiaty. Poczta Kwiatowa® stworzyła doskonały bukiet na różne okazje - Bukiet Bursztyn. Zachwyci on nie tylko kolorami, energią ale także świeżością. Zaskakuj pomysłowością, gestem i serdecznością, osoby, na których ci zależy.
Zapewnij najbliższym cudowne i niezapomniane chwile, dzięki świeżym gerberom i różom, ale przede wszystkim radość nawet w pochmurne dni. Twoja Kwiaciarnia internetowa gwarantuje radość i zadowolenie z usługi :)

Szukasz sposobu aby pokazać bliskim, że o nich pamiętasz? Chcesz aby ukochana osoba wiedziała, że jest dla ciebie ważna?
Nie ma lepszego sposobu na podarunek niż kwiaty. Poczta Kwiatowa® stworzyła doskonały bukiet na różne okazje - Bukiet Bursztyn. Zachwyci on nie tylko kolorami, energią ale także świeżością. Zaskakuj pomysłowością, gestem i serdecznością, osoby, na których ci zależy.
Zapewnij najbliższym cudowne i niezapomniane chwile, dzięki świeżym gerberom i różom, ale przede wszystkim radość nawet w pochmurne dni. Twoja Kwiaciarnia internetowa gwarantuje radość i zadowolenie z usługi :)
"""

extension FlowerModel {
  static func getAll() -> [FlowerModel] {
    let flowers = [
      FlowerModel(name: "Tulipan", imageUrl: "im1", description: loremIpsum, price: PLN(grosze: 1200)),
      FlowerModel(name: "Lilia", imageUrl: "im2", description: loremIpsum, price: PLN(grosze: 699)),
      FlowerModel(name: "Bukiet", imageUrl: "bukiet", description: loremIpsum, price: PLN(grosze: 2500)),
    ]
    
    return flowers
  }
}
