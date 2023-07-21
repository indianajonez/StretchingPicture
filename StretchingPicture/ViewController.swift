//
//  ViewController.swift
//  StretchingPicture
//
//  Created by Ekaterina Saveleva on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Private properties

    private lazy var bobView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bob1.png")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.addSubview(bobView)
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentInset = UIEdgeInsets(top: 270, left: 0, bottom: scrollView.safeAreaInsets.bottom, right: 0)
        scrollView.contentOffset = CGPoint(x: 0, y: -scrollView.contentInset.top)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        bobView.frame = CGRect(x: 0, y: -270, width: scrollView.bounds.width, height: 270)
    }

}



// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        
        if offsetY < -270 {
            var frame = bobView.frame
            frame.origin.y = offsetY
            frame.size.height = -offsetY
            bobView.frame = frame
            scrollView.verticalScrollIndicatorInsets.top = -offsetY - scrollView.safeAreaInsets.top
        }
    }
}



