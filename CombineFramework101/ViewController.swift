//
//  ViewController.swift
//  CombineFramework101
//
//  Created by Windy on 06/07/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @Published var xValue: Int = 0
    private var cancelables = Set<AnyCancellable>()
    
    private var totalLabel: UILabel! = {
        let v = UILabel()
        v.font = .preferredFont(forTextStyle: .title1)
        v.textAlignment = .center
        return v
    }()
    
    private var xLabel: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderStyle = .roundedRect
        v.textAlignment = .center
        return v
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupAction()
        setupBinding()
        
//        setupActionImperactive()
    }

    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [totalLabel, xLabel])
        stack.spacing = 32
        stack.axis = .vertical
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        xLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // MARK: - Reactive Way
    private func setupAction() {
        xLabel.addAction(UIAction(handler: { [weak self] _ in
            self?.xValue = Int(self?.xLabel.text ?? "0") ?? 0
        }), for: .editingChanged)
    }
    
    private func setupBinding() {
        $xValue
            .sink { [weak self] x in
                self?.totalLabel.text = "\(x)"
            }.store(in: &cancelables)
    }
    
    // MARK: - Imperative Way (Common Way)
    private func setupActionImperactive() {
        xLabel.addAction(UIAction(handler: { [weak self] _ in
            let value = Int(self?.xLabel.text ?? "0") ?? 0
            self?.totalLabel.text = "\(value)"
        }), for: .editingChanged)
    }

}

