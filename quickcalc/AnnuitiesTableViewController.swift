//
//  AnnuitiesTableViewController.swift
//  quickcalc
//
//  Created by Emery Clark on 10/20/15.
//  Copyright © 2015 E16 Creative, LLC. All rights reserved.
//

import UIKit

class AnnuitiesTableViewController: UITableViewController, UITextFieldDelegate {
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc: AnnuitiesScheduleTableViewController = segue.destinationViewController as! AnnuitiesScheduleTableViewController
        vc.annuity
    }
    
    // MARK - TextField Delegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case self.balance: break
        case self.rate: break
        case self.paymentsPerYear: break
        case self.years: break
        }
        
        return true
    }
    
    func formatCurrency(range: NSRange, replacement: String) -> String {
        
        switch range.length {
        case 1: return "$0.0\(replacement)"
        case 2: return "$0.\(replacement)"
        default:
            let decimals: String = replacement.substringFromIndex(range.length-2)
            let dollars: String = replacement.substringToIndex(range.length-2)
            return "$\(dollars).\(decimals)"
        }
    }
    
    func formatRate(range: NSRange, replacement: String) -> String {
        
    }
    
}


class AnnuitiesScheduleTableViewController: UITableViewController {
    
    let annuity: Annuity
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(annuity:Annuity) {
        self.annuity = annuity
        super.init(style: .Grouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("scheduleCell", forIndexPath: indexPath) as! ScheduleTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.month.text = "Month"
            cell.principalPayment.text = "Principal"
            cell.interestPayment.text = "Interest"
            cell.monthlyPayment.text = "Payment"
            cell.remainingBalance.text = "Balance"
        default:
            guard let payment: Payment = self.annuity.schedule[indexPath.row] else {
                break
            }
            cell.month.text = String(payment.period)
            cell.principalPayment.text = String(payment.principal)
            cell.interestPayment.text = String(payment.interest)
            cell.monthlyPayment.text = String(payment.paymentAmount)
            cell.remainingBalance.text = String(payment.balance)
            
        }
        
        return cell
    }
    
}


class ScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var principalPayment: UILabel!
    @IBOutlet weak var interestPayment: UILabel!
    @IBOutlet weak var monthlyPayment: UILabel!
    @IBOutlet weak var remainingBalance: UILabel!
    
    
}