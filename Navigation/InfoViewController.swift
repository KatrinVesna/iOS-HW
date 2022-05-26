//
//  InfoViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Information"
        makeButton()
    }
    
    private func makeButton() {
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
        alertButton.center = view.center
        alertButton.setTitle("Change post", for: .normal)
        alertButton.backgroundColor = .systemBlue
        alertButton.layer.cornerRadius = 12
        alertButton.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc private func tapAlertAction () {
        let alert = UIAlertController(title: "Post changed", message: "Do you want to save?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            print("Save")
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Cancel")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: false)
    }
}
