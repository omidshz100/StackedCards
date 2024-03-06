//
//  Item.swift
//  StackedCards
//
//  Created by Omid Shojaeian Zanjani on 06/03/24.
//

import Foundation
import SwiftUI


struct Item: Identifiable {
    var id:UUID = .init()
    var color:Color
    var num:Int
}

var items:[Item] = [
    .init(color: .orange, num: 0),
    .init(color: .blue, num: 0),
    .init(color: .red, num: 0),
    .init(color: .green, num: 0),
    .init(color: .brown, num: 0),
    .init(color: .purple, num: 0),
    .init(color: .gray, num: 0)
]


extension [Item] {
    func zIndex(_ item:Item) ->CGFloat {
        if let i = firstIndex(where: {$0.id == item.id}){
            return CGFloat(count) - CGFloat(i)
        }
        return .zero 
    }
}
