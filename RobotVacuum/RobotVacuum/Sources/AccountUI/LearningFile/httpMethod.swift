import Foundation

func httpRequestGetMehod(){
    if let url = URL(string: "https://www.baidu.com") {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            }else if let data = data {
                let responseString = String(data: data, encoding: .utf8)
                print("Response:\(String(describing: responseString))")
            }
                
        }
        task.resume()
    }
}

func httpRequestPostMehod(){
    if let url = URL(string: "https://www.baidu.com") {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters:[ String: Any] = [
            "name": "Jone Done",
            "email":"jonedone@example.com"
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //handle response
        }
        task.resume()
    }
}
