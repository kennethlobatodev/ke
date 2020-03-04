//
//  ViewController.swift
//  ExampleTextField
//
//  Created by Xookyn on 22/01/20.
//  Copyright © 2020 Xookyn. All rights reserved.
//

import UIKit

extension UITextField {
    /*func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }*/
    func setBottomBorder(borderColor: CGColor = UIColor.black.cgColor,
        backgroundColor: CGColor = UIColor.clear.cgColor) {
        self.borderStyle = .none
        self.layer.backgroundColor = backgroundColor

        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = borderColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIImageView{
    func cropAsCircleWithBorder(borderColor : UIColor, strokeWidth: CGFloat)
    {
        var radius = min(self.bounds.width, self.bounds.height)
        var drawingRect : CGRect = self.bounds
        drawingRect.size.width = radius
        drawingRect.origin.x = (self.bounds.size.width - radius) / 2
        drawingRect.size.height = radius
        drawingRect.origin.y = (self.bounds.size.height - radius) / 2

        radius /= 2

        var path = UIBezierPath(roundedRect: drawingRect.insetBy(dx: strokeWidth/2, dy: strokeWidth/2), cornerRadius: radius)
        let border = CAShapeLayer()
        border.fillColor = UIColor.clear.cgColor
        border.path = path.cgPath
        border.strokeColor = borderColor.cgColor
        border.lineWidth = strokeWidth
        self.layer.addSublayer(border)

        path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textFielExample: UITextField!
    
    @IBOutlet weak var imgViewPerfil: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFielExample.setBottomBorder()
        //textFielExample.setPadding()
        //textFielExample.setBottomBorder()
        // Do any additional setup after loading the view.
        self.imgViewPerfil.cropAsCircleWithBorder(borderColor: UIColor(red: 1.00, green: 0.80, blue: 0.0, alpha: 1.0), strokeWidth: 3)
    }
    
    func setBorder(){
        let line = UIView()
        line.frame.size = CGSize(width: textFielExample.frame.size.width, height: 1)
        line.frame.origin = CGPoint(x: 0, y: textFielExample.frame.maxY - line.frame.height)
        line.backgroundColor = UIColor.darkGray
        line.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        textFielExample.addSubview(line)
    }


}

