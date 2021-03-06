//
//  ViewController.swift
//  ember
//
//  Created by Philippe Kimura-Thollander on 4/6/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: DraggableImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSwipe(sender: UIPanGestureRecognizer) {
        profileImageView.onSwipe(sender)
    }

}

