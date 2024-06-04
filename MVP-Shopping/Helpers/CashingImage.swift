

import UIKit
import Kingfisher


class CashingImage {
    static let shared: CashingImage = CashingImage()
    
     func KingFisher(_ imgv: UIImageView ,_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        imgv.kf.indicatorType = .activity
        imgv.kf.setImage(with: url,placeholder: UIImage(named: "placeholder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
}

