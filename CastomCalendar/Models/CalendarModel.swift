//
//  CalendarModel.swift
//  CastomCalendar
//
//  Created by Alexey Gaidykov on 25.11.2022.
//

import Foundation

class CalendarModel {
    private func getDaysArray(date: Date) -> [Date] {
        var daysArray = [Date]()
        for day in -10...10 {
            let day = date.getDay(with: day)
            daysArray.append(day)
        }
        return daysArray
    }
    public func getWeeksForCalendar(date: Date) -> [DateModel] {
        let getArray = getDaysArray(date: date)
        let dateModelsArray = getArray.map { $0.convertDateModel() }
        
        return dateModelsArray
    }
}
