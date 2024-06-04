

import Foundation


protocol ViewProtocol: AnyObject{
    func fetchDataSucces()
}
protocol ViewCellProtocol: AnyObject{
    func displayTitle(title: String)
    func displayImage(url: String)
    func displayPrice(price: Double)
    func displayRating(rating: Double)
    func displayRatingCount(rating: Int)
}
protocol ShoppingProtocol: AnyObject{
    func featchData()
    func numberOfRowsInSection()-> Int
    func configureCell(_ cell: ViewCellProtocol, for item: Int)
}

class ShoppingPresenter: ShoppingProtocol {
    
    weak var delegate : ViewProtocol!
    var shopping = [Product]()
    init(_ delegate: ViewProtocol){
        self.delegate = delegate
    }
    func featchData() {
        let url = "https://dummyjson.com/products/category/mobile-accessories"
        Networking<ShoppingModel>().fetchData(url: url){ data in
            if let data = data {
                self.shopping = data.products
                self.shopping.shuffle()
               self.delegate?.fetchDataSucces()
            }
        }
    }
    func numberOfRowsInSection() -> Int {
        shopping.count
    }
    func configureCell(_ cell: ViewCellProtocol, for item: Int) {
        cell.displayTitle(title: shopping[item].title)
        cell.displayImage(url: shopping[item].images[0])
        cell.displayPrice(price: shopping[item].price)
        cell.displayRatingCount(rating: shopping[item].reviews.count)
        var finalRate:Double = 0.0
        var rateSum:Int = 0
        for rate in shopping[item].reviews {
             rateSum += rate.rating
            finalRate = Double(rateSum / 5)
        }
        cell.displayRating(rating: finalRate)

    }
 
}
