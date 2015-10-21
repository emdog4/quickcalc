//
//  Annuity.swift
//  quickcalc
//
//  Created by Emery Clark on 10/20/15.
//  Copyright © 2015 E16 Creative, LLC. All rights reserved.
//

import Foundation


infix operator ** { associativity left precedence 170 }

func ** (num: Double, power: Double) -> Double {
    
    return pow(num, power)
}


class Annuity {
    
    var interestPaid: Double = 0.0
    var principalPaid : Double = 0.0
    
    var principal: Double, rate: Double, paymentsPerYear: Double, years: Double
    
    var numberOfPayments: Double {
        
        return paymentsPerYear * years
    }
    
    var interest: Double {

        return rate / paymentsPerYear
    }
    
    var simpleInterest: Double {
        
        return principal * rate * numberOfPayments
    }
    
    var compoundInterest: Double {
        
        return principal * (1 + interest) ** numberOfPayments
    }
    
    var monthlyPayment: Double {
        
        return principal * (interest * (1 + interest) ** numberOfPayments) / (((1 + interest) ** numberOfPayments) - 1)
    }
    
    var interestPayment: Double {
        
        return principal * interest
    }
    
    var principalPayment: Double {
        
        return monthlyPayment - interestPayment
    }
    
    init (principal: Double, rate: Double, paymentsPerYear: Double, years: Double) {
        
        self.principal = principal
        self.rate = rate
        self.paymentsPerYear = paymentsPerYear
        self.years = years
    }
    
}



