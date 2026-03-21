//
//  File.swift
//  Models
//
//  Created by Theo Sementa on 21/03/2026.
//

import Foundation

public struct CatImagesDomain {
    public let cover: ImageType
    public let wash: ImageType
    
    public init(
        cover: ImageType,
        wash: ImageType
    ) {
        self.cover = cover
        self.wash = wash
    }
}
