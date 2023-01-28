//
//  ViewController.swift
//  UsingURLSession
//
//  Created by 이재영 on 2023/01/27.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func randomQuote(_ sender: Any) {
        
        let url = URL(string: "https://api.kanye.rest/")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print("Error", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("올바른 응답이 아닙니다.")
                return
            }
            
            guard (200...2999).contains(httpResponse.statusCode) else {
                print("Error, status code", httpResponse.statusCode)
                return
            }
            
            guard let data = data else {
                print("bad data")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                DispatchQueue.main.async {
                    self.label.text = json?["quote "]
                }
                catch let error {
                    print("Error", error)
                }
            }
            task.resume()
        }
    }
            


