//
//  Date+Extension.swift
//  UserLogin
//
//  Created by Dineswarareddy on 27/01/25.
//

import Foundation

extension Date {
  func isDOBOlderThan18Y() -> Bool {
    return yearsBetweenDate(startDate: self, endDate: Date()) >= 18
  }
  
  private func yearsBetweenDate(startDate: Date, endDate: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from: startDate, to: endDate)
    return components.year!
  }
  
  func getStringFormatdd_mm_yyyy() -> String {
    let outputFormat = DateFormatter()
    outputFormat.dateFormat = "dd-MM-yyyy"
    return outputFormat.string(from: self)
  }
}
