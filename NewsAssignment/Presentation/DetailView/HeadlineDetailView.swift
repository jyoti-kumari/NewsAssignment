//
//  HeadlineDetailView.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct HeadlineDetailView: View {
    var headlineDetail
    : HeadlineData
    @State var showSafari = false
    var body: some View {
        ScrollView {
            HeadlineDetailImage(imageURL: headlineDetail.urlToImage)
            VStack(alignment: .leading) {
                Text(headlineDetail.title)
                    .font(.title)
                
                Text(headlineDetail.publishedDate)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Divider()
                Text(headlineDetail.content)
            }
            .padding()
            Button("Show full story", action: {
                self.showSafari = true
            })
            .font(.title)
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: headlineDetail.url)!)
            }
        }
        .navigationTitle(headlineDetail.sourceName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    HeadlineDetailView(headlineDetail: StringConstant.sampleData)
}
