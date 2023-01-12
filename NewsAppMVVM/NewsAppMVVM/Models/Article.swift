//
//  Article.swift
//  NewsAppMVVM
//
//  Created by leticia marques on 12/01/23.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
