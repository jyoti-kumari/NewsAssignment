//
//  HeadlineImage.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct HeadlineImage: View {
    var imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
                image
                .resizable()
        } placeholder: {
            Image("default")
            .resizable()
            .scaledToFill()
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    HeadlineImage(imageURL: StringConstant.sampleData.urlToImage)
}
