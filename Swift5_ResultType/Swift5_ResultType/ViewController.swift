//
//  ViewController.swift
//  Swift5_ResultType
//
//  Created by pm on 2019/4/11.
//  Copyright © 2019 pm. All rights reserved.
//


// https://www.youtube.com/watch?v=9iazQQdNoNU
// https://api.letsbuildthatapp.com/jsondecodable/courses


import UIKit


struct Course: Decodable {
    var id: Int
    var name: String
    var link: String
    var imageUrl: String
    var number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        fetchCourseJsonResult { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let course):
                _ = course.map({print($0.name)})
            }
        }
    }
    
    
    // swift5 Result
    fileprivate func fetchCourseJsonResult(completion: @escaping (Result<[Course], Error>)-> ()){
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode([Course].self, from: data)
                completion(.success(jsonData))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // old
    fileprivate func fetchCourseJsonOld(completion: @escaping ([Course]?, Error?)-> ()){
        guard let url = URL(string: "https://api.letsbuildthatapp.com/jsondecodable/courses") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            if let error = error {
                print("error", error)
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode([Course].self, from: data)
                completion(jsonData, nil)
            } catch let error {
                completion(nil, error)
                print("json decodable error")
            }
            }.resume()
    }
 
}

