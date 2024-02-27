import Foundation

class WebService {
    func NewsDownload(url: URL, completion: @escaping ([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let NewsArray = try? JSONDecoder().decode([News].self, from: data)
                if let NewsArray = NewsArray {
                    completion(NewsArray)
                }
            }
        }.resume()
    }
}
