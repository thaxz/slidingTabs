//
//  ViewController.swift
//  slidingTabs
//
//  Created by thaxz on 29/09/22.
//


#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController { viewController }
        func updateUIViewController(_ viewController: UIViewController, context: Context) { }
    }

    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self).statusBar(hidden: true)
    }
}
#endif
