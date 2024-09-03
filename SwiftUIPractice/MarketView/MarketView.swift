//
//  MarketView.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/3/24.
//

import SwiftUI

struct MarketView: View {
    
    @State var query = ""
    @State var marketList: [Market] = []
    var filteredList: [Market] {
        if query.isEmpty {
            return marketList
        } else {
            return marketList.filter{ $0.englishName.localizedStandardContains(query)}
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(filteredList, id: \.self) { item in
                    HStack{
                        Image(systemName: "circle")
                        VStack(alignment: .leading){
                            Text(item.koreanName)
                            Text(item.englishName)
                        }
                        .padding(.horizontal)
                        Spacer()
                        Image(systemName: "star")
                    }
                    .padding()
                }
            }
            .navigationTitle("Search")
            .searchable(text: $query)
        }
        .task {
            do {
                let result = try await UpbitAPI.fetchMarket()
                marketList = result
            } catch {
                
            }
        }
    }
}

#Preview {
    MarketView()
}
