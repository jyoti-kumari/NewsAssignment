//
//  HeadlinesList.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct HeadlinesList: View {
    
    var headlines: [HeadlineData]
    var body: some View {
        NavigationSplitView {
            List(headlines, id: \.title) { headline in
                NavigationLink {
                    HeadlineDetailView(headlineDetail: headline)
                } label: {
                    HeadlineRow(headline: headline)
                }
            }
            .navigationTitle("Headlines")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select Headline")
        }
    }
}

#Preview {
    HeadlinesList(headlines: [StringConstant.sampleData])
}
