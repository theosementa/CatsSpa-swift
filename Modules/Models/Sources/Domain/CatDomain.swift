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
    
    static var mocks: [CatDomain] {
        return [
            .init(
                name: "Una",
                image: .imageUna,
                birthday: .now,
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
