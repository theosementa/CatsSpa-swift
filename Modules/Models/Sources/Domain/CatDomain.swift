//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 19/03/2026.
//

import Foundation
import Utilities

public struct CatDomain: Identifiable {
    public let id: UUID = UUID()
    public let name: String
    public let image: ImageType
    public let birthday: Date
    public let sex: CatSexType
    public let enrollmentDate: Date
    
    public init(
        name: String,
        image: ImageType,
        birthday: Date,
        sex: CatSexType,
        enrollmentDate: Date = .now
    ) {
        self.name = name
        self.image = image
        self.birthday = birthday
        self.sex = sex
        self.enrollmentDate = enrollmentDate
    }
}

public extension CatDomain {

    var ageDescription: String {
        let now = Date.now
        let years = Calendar.current.dateComponents([.year], from: birthday, to: now).year ?? 0
        if years > 0 { return "\(years) \(years == 1 ? "year" : "years")" }
        let months = Calendar.current.dateComponents([.month], from: birthday, to: now).month ?? 0
        if months > 0 { return "\(months) \(months == 1 ? "month" : "months")" }
        return "Newborn"
    }

    static var mocks: [CatDomain] {
        return [
            .init(
                name: "Una",
                image: .imageUna,
                birthday: Date.create(day: 28, month: 9, year: 2023),
                sex: .female
            ),
            .init(
                name: "Salem",
                image: .imageSalem,
                birthday: Date.create(day: 15, month: 8, year: 2023),
                sex: .female
            )
        ]
    }
    
}
