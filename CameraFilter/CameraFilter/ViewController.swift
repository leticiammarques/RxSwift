//
//  ViewController.swift
//  CameraFilter
//
//  Created by leticia marques on 27/12/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var applyFilterButton: UIButton!
    @IBOutlet weak var photImageView: UIImageView!
    
    let disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController else {
            fatalError("Segue destination is not found")
        }
        
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
            
        }).disposed(by: disposedBag)
    }
    
    @IBAction func applyFilterButtonPressed() {
        
        guard let sourceImage = self.photImageView.image else {
            return
        }
        
        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filteredImage in
            
                DispatchQueue.main.async {
                    self.photImageView.image = filteredImage
                }

            }).disposed(by: disposedBag)
    }
    
    private func updateUI(with image: UIImage) {
        self.photImageView.image = image
        self.applyFilterButton.isHidden = false
    }
}

