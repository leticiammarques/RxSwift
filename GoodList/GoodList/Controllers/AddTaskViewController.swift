//
//  AddTaskViewController.swift
//  GoodList
//
//  Created by leticia marques on 28/12/22.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    @IBOutlet weak var prioritySegmentControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTaskField: UITextField!
    
    @IBAction func save() {
        guard let priority = Priority(rawValue: self.prioritySegmentControl.selectedSegmentIndex),
            let title = self.taskTitleTaskField.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
