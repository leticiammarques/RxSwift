//
//  Article.swift
//  GoodNews
//
//  Created by leticia marques on 30/12/22.
//

import Foundation

struct ArticlesList: Decodable {
    var articles: [Article]
}

//extension ArticlesList {
//    static var all: Resource<ArticlesList> = {
//       let url = URL(string: "")!
//        return Resource(url: url)
//    }()
//}

struct Article: Decodable {
    let title: String
    let description: String?
}
