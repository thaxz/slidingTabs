//
//  SegmentedControl+Extension.swift
//  slidingTabs
//
//  Created by thaxz on 29/09/22.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    
    // Removing background
    
    func removeBorder(){
        
        // Using UIImage's new func to remove BG
        let backgroundImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        
        // Setting on every status
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        
        // Using UIImage's new func to remove divider
        let divisorImage = UIImage.gerRectangleImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        
        self.setDividerImage(divisorImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        // Setting colors
        // When selected
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor(named: "redMain")!], for: .selected)
        // When on foreground
        self.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
    }
    
    // Creating underline
    
    func addUnderlineForSelectedSegment() {
        
        // Removing background
        removeBorder()
        
        // Defining size and position
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 2.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        
        // Creating underline's view
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.red
        underline.tag = 1
        
        // Adding as subview
        self.addSubview(underline)
    }
    
    // Changing underline position
    
    func changeUnderlinePosition(){
        
        // Checking undeline
        guard let underline = self.viewWithTag(1) else {return}
        
        // Setting up position
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        
        // Slide animation
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}
