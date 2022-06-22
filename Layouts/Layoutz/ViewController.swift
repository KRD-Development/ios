//
//  ViewController.swift
//  Layoutz
//
//  Created by Thrace on 5/19/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    func setupViews() {
        
        // Option 1: Sized Explicitly
//        let redView = makeView()
//        view.addSubview(redView)
//        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        redView.heightAnchor.constraint(equalToConstant: 600).isActive = true
//        redView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//
//
//        let foo = labelFactory(withText: "UPPER LEFT LABEL")
//
//        view.addSubview(foo)
//        foo.topAnchor.constraint(equalTo: view.topAnchor, constant: 280).isActive = true
//        foo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
//        let font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 40.0)
//        foo.font = font
//        foo.textColor = UIColor.white
//
//        let bar = labelFactory(withText: "BAR")
//        view.addSubview(bar)
//        bar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        bar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//
//        let button1 = buttonFactory(withText: "PRESS ME, DAWG")
//        view.addSubview(button1)
//        button1.sizeToFit()
//        button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
//        button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        
        let das  = labelFactory(withText: "Die")
        view.addSubview(das)
        
        das.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        das.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        let dasFont = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20.0)
        das.font = dasFont
        das.textColor = .white
        das.backgroundColor = .lightGray
        
        
        let auto = labelFactory(withText: "Autobahn")
        view.addSubview(auto)
        
        auto.leadingAnchor.constraint(equalTo: das.trailingAnchor, constant: 10).isActive = true
        auto.lastBaselineAnchor.constraint(equalTo: das.firstBaselineAnchor).isActive = true
        let autoFont = UIFont(name: "HelveticaNeue-CondensedBlack", size: 60.0)
        auto.font = autoFont
        auto.textColor = .white
        auto.backgroundColor = .lightGray

    }
    
    func labelFactory(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .lightGray
        return label
    }
    
    func buttonFactory(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false // important
        button.setTitle(text, for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
    
    func makeView() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        
        return v
    }

}

