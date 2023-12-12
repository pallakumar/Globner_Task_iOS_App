//
//  NationalityAPI.swift
//  Globner_Task
//
//  Created by apple on 12/12/23.
//

import Foundation

struct NationalityAPI: Codable {
    public var data: [Nationality]?
}

struct Nationality: Codable {
    public var title: String?
    public var description: String?
    public var imageHref: String?
}
