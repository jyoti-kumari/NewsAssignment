//
//  SwiftUIViewExtension.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import SwiftUI

extension SwiftUI.View {
    func toViewController() -> UIViewController {
        let viewController = UIHostingController(rootView: self)
        viewController.view.frame = UIScreen.main.bounds
        return viewController
    }
}

