//
//  Webservice.swift
//  NewsApplication
//
//  Created by Veysel Can Bingöl on 2.06.2022.
//

import Foundation


class Webservice {
    func downlaodNews(url: URL, completion: @escaping ([News]?) -> ()) {
        URLSession.shared.dataTask(with: url) { Data, Response, Error in
            if let Error = Error {
                print(Error.localizedDescription)
                completion(nil)
            } else if let Data = Data {
                let newsArray = try? JSONDecoder().decode([News].self, from: Data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
        }.resume()
    }
}
