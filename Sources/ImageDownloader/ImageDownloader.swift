import UIKit

public func downloadImage(url: URL, timeOut: Double, completion: @escaping (UIImage?) -> Void) {
    var request = URLRequest(url: url)
    request.timeoutInterval = timeOut
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print(error)
            return
        }
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else {
                  print ("サーバエラー")
                  return
              }
        if response.statusCode == 200 {
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    task.resume()
}
