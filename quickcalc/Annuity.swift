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


func simpleInterest (principal: Double, rate: Double, numberOfPayments: Double) -> Double {

    return principal * rate * numberOfPayments
}

func compoundInterest (principal: Double, rate: Double, paymentsPerYear: Double, years: Double) -> Double {
    
    return principal * (1 + (rate / paymentsPerYear)) ** (paymentsPerYear * years)
}

func monthlyPayment (principal: Double, rate: Double, paymentsPerYear: Double, years: Double) -> Double {
    
    let interest = rate / paymentsPerYear
    let totalPayments = paymentsPerYear * years
    
    return principal * (interest * (1 + interest) ** totalPayments) / (((1 + interest) ** totalPayments) - 1)
}

func interestPayment (principal: Double, rate: Double, paymentsPerYear: Double) -> Double {
    
    return principal * (rate / paymentsPerYear)
}

func principalPayment (principal: Double, rate: Double, paymentsPerYear: Double, years: Double) -> Double {
    
    return monthlyPayment(principal, rate: rate, paymentsPerYear: paymentsPerYear, years: years) - interestPayment(principal, rate: rate, paymentsPerYear: paymentsPerYear)
}

