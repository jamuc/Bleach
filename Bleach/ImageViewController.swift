//
//  ImageViewController.swift
//  Bleach
//
//  Created by Jason Franklin on 03/10/2016.
//  Copyright © 2016 Jason Franklin. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL: URL? { didSet { fetchImage() } }

    var image: UIImage? { didSet { updateImageView() } }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 4.0
        scrollView.delegate = self
    }

    @IBOutlet weak var scrollView: UIScrollView!

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    override func awakeFromNib() {
        imageURL = BleachURLS.mapURL()
        navigationItem.title = "Bleach One"
    }

    // - MARK: private
    fileprivate var imageView = UIImageView()

    fileprivate func fetchImage() {
        let queue = DispatchQueue(label: "com.franklin.jason.bleach.fetchImage")
        let url = imageURL

        queue.async(qos: .userInitiated) { [weak weakSelf = self] in
            let imageData = try? Data(contentsOf: (weakSelf?.imageURL!)!)

            DispatchQueue.main.async {
                if url == weakSelf?.imageURL {
                    weakSelf?.image = UIImage(data: imageData!)
                }
            }
        }
    }

    fileprivate func updateImageView() {
        imageView.image = image
        imageView.sizeToFit()
        scrollView.contentSize = imageView.bounds.size
        scrollView.zoomScale = 0.3
    }
}
