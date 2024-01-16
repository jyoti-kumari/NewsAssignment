//
//  HeadlineRow.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct HeadlineRow: View {
    var headline: HeadlineData
    var body: some View {
        HStack {
            HeadlineImage(imageURL: headline.urlToImage)
            VStack(alignment: .leading) {
                Text(headline.title)
                    .font(.headline)
                Text(headline.publishedDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

#Preview {
    
    Group {
        HeadlineRow(headline: StringConstant.sampleData)
    }
}
