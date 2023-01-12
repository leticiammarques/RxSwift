//
//  Task.swift
//  GoodList
//
//  Created by leticia marques on 28/12/22.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
