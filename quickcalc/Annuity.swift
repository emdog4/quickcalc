//
//  Annuity.swift
//  quickcalc
//
//  Created by Emery Clark on 10/20/15.
//  Copyright © 2015 E16 Creative, LLC. All rights reserved.
//

import Foundation


infix operator ** { associativity left precedence 170 }

func ** (num: Double, power: Int) -> Double {
    
    return pow(num, Double(power))
}


class Annuity {
    
    var schedule: [Payment] {
        var schedule = [Payment]()
        for period in 0...numberOfPayments {
            schedule.append(paymentForPeriod(period))
        }
        return schedule
    }
    
    var principal: Double, rate: Double, paymentsPerYear: Int, years: Int
    
    var numberOfPayments: Int {
        
        return paymentsPerYear * years
    }
    
    var interest: Double {

        return rate / Double(paymentsPerYear)
    }
    
    var simpleInterest: Double {
        
        return principal * rate * Double(numberOfPayments)
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

    
    init (principal: Double, rate: Double, paymentsPerYear: Int, years: Int) {
        
        self.principal = principal
        self.rate = rate
        self.paymentsPerYear = paymentsPerYear
        self.years = years
    }
    
    func paymentForPeriod (period: Int) -> Payment {
        
        let balanceRemaining: Double = principal - Double(period) * monthlyPayment
        
        let interestPayment: Double = principal - (Double(period) - 1) * monthlyPayment
        
        let principalPayment: Double = monthlyPayment - interestPayment
        
        return Payment(period: period, principal: principalPayment, interest: interestPayment, paymentAmount: monthlyPayment, balance: balanceRemaining)
    }
    
}


class Payment {

    var period: Int, principal: Double, interest: Double, paymentAmount: Double, balance: Double
    
    init (period: Int, principal: Double, interest: Double, paymentAmount: Double, balance: Double) {
        
        self.period = period
        self.principal = principal
        self.interest = interest
        self.paymentAmount = paymentAmount
        self.balance = balance
    }
}
