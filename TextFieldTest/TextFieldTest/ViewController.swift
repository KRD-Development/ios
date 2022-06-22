//
//  ViewController.swift
//  TextFieldTest
//
//  Created by Thrace on 6/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    var toobarTop:UIToolbar!
    var toobarBottom:UIToolbar!
    var imageView:UIImageView!
    var stackView:UIStackView!
    var spacerView:UIView!
    var scrollView:UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        setupViews()
    }

    func setupViews() {
        print("SETUP VIEWS")
        imageView = createUIImageView(named: "WilliamMario")
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
        toobarTop = createToolbar()
        toobarBottom = createToolbar()
        stackView = makeStackView(withOrientation: .vertical)
        spacerView = makeSpacerView()
        scrollView = makeScrollView()
    }

    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.backgroundColor = .darkGray
        
        return toolbar
    }
    
    func makeView(color: UIColor = .red) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color

        return view
    }
    
    func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0

        return stackView
    }
    
    public func makeSpacerView(height: CGFloat? = nil) -> UIView {
        let spacerView = UIView(frame: .zero)

        if let height = height {
            spacerView.heightAnchor.constraint(equalToConstant: height).setActiveBreakable()
        }
        spacerView.translatesAutoresizingMaskIntoConstraints = false

        return spacerView
    }
    
    func makeScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }
    
//    func createUIImageView(named: String) -> UIImageView {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        imageView.contentMode = .scaleAspectFit
//
//        imageView.image = UIImage(named: named)
//        imageView.backgroundColor = .orange
//
//        // By making the image hug itself a little bit less and less resistant to being compressed
//        // we allow the image to stretch and grow as required
//    //    imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
//    //    imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
//
//        return imageView
//    }
    
    public func createUIImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .green
        view.image = UIImage(named: named)

        // By making the image hug itself a little bit less and less resistant to being compressed
        // we allow the image to stretch and grow as required
//        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
//        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)

        return view
    }
    
    
}

public extension NSLayoutConstraint {
    @objc func setActiveBreakable(priority: UILayoutPriority = UILayoutPriority(900)) {
        self.priority = priority
        isActive = true
    }
}

extension UIColor {
    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
    static let darkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
    static let darkRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
    static let darkTeal = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
    static let darkYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
}


