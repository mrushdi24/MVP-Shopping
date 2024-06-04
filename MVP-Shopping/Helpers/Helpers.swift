
import UIKit

class Helpers {
    
    static let shared: Helpers = Helpers()
    
     func getRatingStars(_ rating: Int)-> String{
        if rating == 1 {
            return "★☆☆☆☆"
        }else if rating == 2 {
            return "★★☆☆☆"
        }else if rating == 3 {
            return "★★★☆☆"
        }else if rating == 4 {
            return "★★★★☆"
        }else if rating == 5 {
            return "★★★★★"
        }else{
            return "☆☆☆☆☆"
        }
    }
}
