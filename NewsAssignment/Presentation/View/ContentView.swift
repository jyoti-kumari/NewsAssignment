//
//  ContentView.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModelProtocol = ViewSetupFactory.createHeadlinesListView()
    var body: some View {
        HeadlinesList(headlines: viewModelProtocol.headlines)
            .onAppear {
                if viewModelProtocol.headlines.isEmpty {
                    Task {
                        viewModelProtocol.getHeadlines()
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
