//
//  ConvenientConstraints.swift
//  lekcia
//
//  Created by Admin on 09.11.2020.
//

import UIKit

extension UIView {
	func attach(_ attribute: NSLayoutConstraint.Attribute, to secondAttribute:
				NSLayoutConstraint.Attribute = .notAnAttribute,
		  of item: Any? = nil, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0,
		  multiplier: CGFloat = 1, activate isActive: Bool = true) -> NSLayoutConstraint {
	 self.translatesAutoresizingMaskIntoConstraints = false
	 let constraint = NSLayoutConstraint(
		 item: self,
		 attribute: attribute,
		 relatedBy: relation,
		 toItem: item,
		 attribute: secondAttribute,
		 multiplier: multiplier,
		 constant: constant
	 )
	 constraint.isActive = isActive
	 return constraint
 }
}
