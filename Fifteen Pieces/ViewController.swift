//
//  ViewController.swift
//  Fifteen Pieces
//
//  Created by Maxim Dvortsov on 13.11.2017.
//  Copyright © 2017 Maxim Dvortsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var imageY: UIImageView!
    
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.draggedView(_:)))
        imageY.isUserInteractionEnabled = true
        imageY.addGestureRecognizer(panGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: imageY)
        let translation = sender.translation(in: self.view)
        imageY.center = CGPoint(x: imageY.center.x + translation.x, y: imageY.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}
