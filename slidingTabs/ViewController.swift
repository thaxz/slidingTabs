//
//  ViewController.swift
//  slidingTabs
//
//  Created by thaxz on 29/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    let segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Item 0", "Item 1"])
        segmented.selectedSegmentIndex = 0
        segmented.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        segmented.addUnderlineForSelectedSegment()
        return segmented
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    func btConfiguration(){
        
        segmentedControl.addTarget(self, action: #selector(touchSegmented), for: .valueChanged)
        
    }
    
    @objc func touchSegmented(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
    }
    
    func constraints(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300)
        ]
        )
    }
    
    func setUp(){
        
        view.backgroundColor = .white
        view.addSubview(segmentedControl)
        constraints()
        btConfiguration()
        
        
    }
    
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
