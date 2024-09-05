//
//  RandomImageView.swift
//  SwiftUIPractice
//
//  Created by 쌩 on 9/5/24.
//

import SwiftUI

struct RandomImageView: View {
    
    @State var sectionTitle = ["첫번째 섹션", "두번째 섹션", "세번째 섹션", "네번째 섹션"]
    
    @State var url = URL(string: "https://picsum.photos/id/\(Int.random(in: 1...500))/200/300")
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                ForEach(sectionTitle, id:\.self) { item in
                    sectionTitle(title: item)
                    sectionImage()
                }
            }
            .navigationTitle("My Random Image")
        }
    }
    
    func sectionImage() -> some View {
        let url = URL(string: "https://picsum.photos/id/\(Int.random(in: 1...500))/200/300")
        
     return   ScrollView(.horizontal) {
            LazyHStack{
                ForEach(0 ..< 9) { index in
                    NavigationLink {
//                        DetailImageView(title: sectionTitle[index], url: url)
                    } label: {
                        AsyncImage(url: url)
                    }
                }
                .frame(width: 100, height: 150)
                .clipShape(.buttonBorder)
            }
        }
    }
    
    func sectionTitle(title: String) -> some View {
        HStack{
            Text(title)
                .padding()
            Spacer()
        }
    }
}

#Preview {
    RandomImageView()
}
