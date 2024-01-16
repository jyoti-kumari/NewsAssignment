//
//  SafariView.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

#Preview {
    SafariView(url: URL(string: StringConstant.sampleData.url)!)
}
