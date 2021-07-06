//
//  ViewController.swift
//  CombineFramework101
//
//  Created by Windy on 06/07/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @Published var youtuber: [String] = []
    var cancelables = Set<AnyCancellable>()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reactive Way
        $youtuber
            .sink { value in
                print(value)
            }.store(in: &cancelables)
        
        youtuber.append("New Video 1")
        youtuber.append("New Video 2")
        youtuber.append("New Video 3")
        
//        // Imperative Way
//        youtuber = [] // Reset Only
//        youtuber.append("New Video 1")
//        print(youtuber)
//        youtuber.append("New Video 2")
//        print(youtuber)
//        youtuber.append("New Video 3")
//        print(youtuber)
    }

}

