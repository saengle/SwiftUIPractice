////
////  DetailImageView.swift
////  SwiftUIPractice
////
////  Created by 쌩 on 9/5/24.
////
//
//import SwiftUI
//
//struct DetailImageView: View {
//    
//    @Binding var title = String()
//    @Binding var url: URL
//    
//    init(title: String, url: URL) {
//        self.title = title ??
//        self.url = url
//    }
//    
//    var body: some View {
//       AsyncImage(url: url)
//        TextField("섹션 이름을 입력하세요.", text: $title)
//    }
//}
//
//#Preview {
//    DetailImageView()
//}
