//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by leticia marques on 12/01/23.
//

import Foundation
import UIKit
import RxSwift

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.articlesVM.count
    }

    private func populateNews() {
        
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-12-12&sortBy=publishedAt&apiKey=e337563e0c76415eb4363eb8296aef85")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }).disposed(by: disposeBag)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell is not found")
        }
        
        let articleVM = self.articleListVM.articleAt(index: indexPath.row)
        
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        return cell
    }
}
