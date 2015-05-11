//
//  HappyViewController.swift
//  Happiness
//
//  Created by Jeffrey Lin on 4/26/15.
//  Copyright (c) 2015 Jeffrey Lin. All rights reserved.
//

import UIKit

class HappyViewController: UIViewController,FaceViewDataSource {


    var happiness: Int = 60  { // 0 very sad, 100 = estatic
        didSet{
            happiness = min(max(happiness,0),100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    private func updateUI(){
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
    
    @IBOutlet weak var faceView: FaceView! {
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            //faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action:"changeHappiness:"))// legal but can do in storyboard
        }
    }
    
    private struct Constants{
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChanged = -Int(translation.y/Constants.HappinessGestureScale)
            if happinessChanged != 0{
                happiness += happinessChanged
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    
   
}
