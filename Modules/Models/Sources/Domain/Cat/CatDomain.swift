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
    public let images: CatImagesDomain
    public let birthday: Date
    public let sex: CatSexType
    public let breed: String
    public let enrollmentDate: Date

    public init(
        name: String,
        images: CatImagesDomain,
        birthday: Date,
        sex: CatSexType,
        breed: String,
        enrollmentDate: Date = .now
    ) {
        self.name = name
        self.images = images
        self.birthday = birthday
        self.sex = sex
        self.breed = breed
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
                images: .init(cover: .imageUna, wash: .unaWash),
                birthday: Date.create(day: 28, month: 9, year: 2023),
                sex: .female,
                breed: "Sacré de Birmanie"
            ),
            .init(
                name: "Salem",
                images: .init(cover: .imageSalem, wash: .salemWash),
                birthday: Date.create(day: 15, month: 8, year: 2023),
                sex: .female,
                breed: "European"
            )
        ]
    }
    
}
