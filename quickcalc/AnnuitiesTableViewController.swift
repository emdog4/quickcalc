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
        
        print(textField.text)
        print(range)
        print(string)
        
        if ((Int(string)) != nil) {
            
            switch textField {
            case self.balance: textField.text = formatCurrency(textField.text!, range: range, replacement: string)
            case self.rate: break
            case self.paymentsPerYear: break
            case self.years: break
            default: break
            }
            
            return false
            
        //} else if (string.rangeOfCharacterFromSet(NSCharacterSet.)) //contains delete char
        
        } else {
            
            return false
        }
    }
    
    func formatCurrency(string: String, range: NSRange, replacement: String) -> String {
        
        if (string.characters.count < 5) {
            let newString: String = "$0.00"
            let newRange = Range<String.Index>(start: newString.startIndex.advancedBy(4), end: newString.endIndex)
            return newString.stringByReplacingCharactersInRange(newRange, withString: replacement)
        } else {
            
            let startIndex = string.startIndex.advancedBy(range.location-1)
            let newRange = Range<String.Index>(start: startIndex, end: startIndex.advancedBy(range.length))
            
            var newString: String = string.stringByReplacingCharactersInRange(newRange, withString: replacement)
            
            let correctDecimalIndex = newString.endIndex.advancedBy(-2)
            let correctDecimalRange = Range<String.Index>(start: correctDecimalIndex, end: correctDecimalIndex.advancedBy(1))
            
            let decimalRange: Range = newString.rangeOfString(".")!
            
            if (decimalRange != correctDecimalRange) {
                newString.removeRange(decimalRange)
                newString.replaceRange(correctDecimalRange, with: ".")
            }
            
            return newString
            
            
        }
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