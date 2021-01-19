//
//  StringExtensions.swift
//  WinePairing
//
//  Created by Jacqueline Alves on 17/12/20.
//

import UIKit

extension String {
    func width(withConstrainedHeight height: CGFloat,
               font: UIFont,
               numberOfLines: Int = 1,
               textAlignment: NSTextAlignment = .center) -> CGFloat {
        
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: .greatestFiniteMagnitude, height: height))
        
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.width
    }
}
