//
//  UIImageView+Extension.swift
//  NewsApp
//
//  Created by Agustinch on 16/03/2023.
//

import Nuke
import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String?) {
        
        guard let urlString = urlString, let url = URL(string: urlString) else { return }

        let imageConvertible = Nuke.ImageRequest(url: url )
        let imageOptions = Nuke.ImageLoadingOptions(placeholder: UIImage(named: "image-loading"),
            failureImage: UIImage(named: "image-loading"))

        Nuke.loadImage(with: imageConvertible, options: imageOptions, into: self )
    }

}
