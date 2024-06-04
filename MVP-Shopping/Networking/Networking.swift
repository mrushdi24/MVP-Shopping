

import Foundation
import Alamofire


class Networking<T: Decodable> {
    
    func fetchData(url: String, completion :@escaping(T?)->()) {
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                  case .success(let data):
                    do{
                      let jsonData = try JSONDecoder().decode(T.self, from: data!)
                        completion(jsonData)
                   } catch {
                      print(error.localizedDescription)
                   }
                 case .failure(let error):
                   print(error.localizedDescription)
                 }
            }
   }
    
    
    
}
