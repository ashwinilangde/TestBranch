//
//  ApiCall.swift
//  InstagramTestApp
//
//  Created by Ashwini on 15/03/20.
//  Copyright © 2020 Ashwini. All rights reserved.
//

import Foundation

struct ServerResponse {
    
    func getApiResponse(completionHandler: @escaping ([UserListModel]) -> Void)  {
        let url = URL(string: Constants().api)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
            return
          }
          
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
            return
          }

          if let data = data,
            let userData = try? JSONDecoder().decode([UserListModel].self, from: data) {
            completionHandler(userData)
          }
        })
        // execute the HTTP request
        task.resume()
    }
}
