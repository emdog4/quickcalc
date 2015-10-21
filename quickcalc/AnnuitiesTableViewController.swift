//
//  AnnuitiesTableViewController.swift
//  quickcalc
//
//  Created by Emery Clark on 10/20/15.
//  Copyright © 2015 E16 Creative, LLC. All rights reserved.
//

import UIKit

class AnnuitiesTableViewController: UITableViewController {

    @IBOutlet weak var balance: UITextField!
    @IBOutlet weak var rate: UITextField!
    @IBOutlet weak var paymentsPerYear: UITextField!
    @IBOutlet weak var years: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var payment: UITextField!
    @IBOutlet weak var tip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
