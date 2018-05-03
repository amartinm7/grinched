//
//  AboutViewController.swift
//  bullEye
//
//  Created by antonio martin moreno on 03/05/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var howToPlayLbl: UILabel!
    @IBOutlet weak var closeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.center.x -= view.bounds.width
        howToPlayLbl.center.x -= view.bounds.width
        closeBtn.center.y += 30.0
        closeBtn.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let boundsWith: CGFloat = self.view.bounds.width
        textView.appearLeftToRight(boundsWith: boundsWith, delay:0.3)
        howToPlayLbl.appearLeftToRight(boundsWith: boundsWith, delay:0.4)
        closeBtn.bounce(boundsWith: 30.0, delay:0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initialize(){
        playSoundOnHitMe()
    }

}
