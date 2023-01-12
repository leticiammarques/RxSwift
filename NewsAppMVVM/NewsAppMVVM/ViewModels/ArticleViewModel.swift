//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by leticia marques on 12/01/23.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    
    func articleAt(index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}

struct ArticleViewModel {
    
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
