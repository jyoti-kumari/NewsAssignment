//
//  HeadlineDetailImage.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct HeadlineDetailImage: View {
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
        .frame(height: 200)
    }
}


#Preview {
    HeadlineDetailImage(imageURL: StringConstant.sampleData.urlToImage)
}
