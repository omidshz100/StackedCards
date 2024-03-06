//
//  View.swift
//  StackedCards
//
//  Created by Omid Shojaeian Zanjani on 06/03/24.
//

import SwiftUI

struct Home: View {
    @State var isROtationsEnabaled:Bool = true
    @State var shownIndicartor:Bool = false
    
    
    var body: some View {
        VStack{
            GeometryReader{
                let size = $0.size
                
                ScrollView(.horizontal){
                    HStack(spacing:0){
                        ForEach(items){ item in
                            CardView(item)
                                .padding(.horizontal, 65)
                                .frame(width: size.width)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .offset(x: minX(geometryProxy, num: item.num))
                                }
                                .zIndex(items.zIndex(item))
                        }
                    }
                }
                .scrollIndicators(shownIndicartor ? .visible: .hidden)
                .scrollTargetBehavior(.paging)
            }// geometry
            .frame(height: 430)
        }
        .navigationTitle("Stacked Card")
    }
    
    @ViewBuilder
    func CardView(_ item:Item) -> some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(item.color.gradient)
    }
    
    // Stack cards Animations
    func minX(_ proxy:GeometryProxy, num:Int)->CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        print("item Num: \(num) - \(minX)")
        return minX < 0 ? 0:-minX
    }
}

#Preview {
    ContentView()
}
