//
//  LogInViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default
    
    private var scrollView: UIScrollView = {
             let scrollView = UIScrollView()
             scrollView.translatesAutoresizingMaskIntoConstraints = false
             scrollView.backgroundColor = .white
             scrollView.isScrollEnabled = true
             return scrollView
         }()

         private var contentView: UIView = {
             let contentView = UIView()
             contentView.translatesAutoresizingMaskIntoConstraints = false
             contentView.backgroundColor = .white
             return contentView
         }()

         private var logoImage: UIImageView = {
             let logo = UIImageView()
             logo.translatesAutoresizingMaskIntoConstraints = false
             logo.image = UIImage(named: "logo")
             return logo
         }()

         private var emailTextField: UITextField = {
             let textField  = UITextField()
             textField.translatesAutoresizingMaskIntoConstraints = false
             textField.textColor = .black
             textField.backgroundColor = .systemGray6
             textField.font = UIFont.systemFont(ofSize: 16)
             textField.autocapitalizationType = .none
             textField.placeholder = "Email or phone"
             textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
             textField.leftViewMode = .always
             textField.tintColor = .lightGray
             textField.clearButtonMode = .always
             textField.layer.borderColor = UIColor.lightGray.cgColor
             textField.layer.borderWidth = 0.5
             textField.returnKeyType = .done
             textField.keyboardAppearance = .alert
             return textField
         }()
    
    private var passwordTextField: UITextField = {
                 let textField = UITextField()
                 textField.textColor = .black
                 textField.backgroundColor = .systemGray6
                 textField.font = UIFont.systemFont(ofSize: 16)
                 textField.autocapitalizationType = .none
                 textField.placeholder = "Password"
                 textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
                 textField.leftViewMode = .always
                 textField.tintColor = .lightGray
                 textField.clearButtonMode = .always
                 textField.isSecureTextEntry = true
                 textField.returnKeyType = .done
                 textField.keyboardAppearance = .alert
                 textField.translatesAutoresizingMaskIntoConstraints = false
                 return textField
             }()
    
          private var emailPasswordStack: UIStackView = {
                 let stack = UIStackView()
                 stack.translatesAutoresizingMaskIntoConstraints = false
                 stack.axis = .vertical
                 stack.layer.borderColor = UIColor.lightGray.cgColor
                 stack.layer.borderWidth = 0.5
                 stack.layer.cornerRadius = 10
                 stack.clipsToBounds = true
                 stack.distribution = .fillEqually
                 return stack
             }()
         
         private var logInButton: UIButton = {
             let button = UIButton()
             button.setTitle("Log In", for: .normal)
             button.titleLabel?.textColor = .white
             button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
             button.layer.cornerRadius = 10
             button.clipsToBounds = true
             button.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
             button.translatesAutoresizingMaskIntoConstraints = false
             return button
         }()
         @objc func didTapLogInButton(){
             alphaForButton()
             let profileVC = ProfileViewController()
             profileVC.closure = {
             }
             self.navigationController?.pushViewController(profileVC, animated: true)
         }
    
         private func alphaForButton() {
             switch logInButton.state {
             case .normal:
                 self.logInButton.alpha = 1.0
             case .selected, .disabled, .highlighted:
                 self.logInButton.alpha = 0.8
             default:
                 self.logInButton.alpha = 0.8
             }
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.contentSize = view.bounds.size
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(emailPasswordStack)
        emailPasswordStack.addArrangedSubview(self.emailTextField)
        emailPasswordStack.addArrangedSubview(self.passwordTextField)
        contentView.addSubview(logInButton)
        layout()
        alphaForButton()
        
    }
    
 override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private func layout() {

             let srollViewTopConstraint = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
             let srollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
             let srollViewLeadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
             let srollViewTrailingConstraint = scrollView.trailingAnchor.constraint(equalTo:view.trailingAnchor)

             let contentViewTopConstraint = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor)
             let contentViewHeightXConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
             let contentViewBottomConstraint = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
             let contentViewWidthConstraint = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)

             let imageViewTopConstraint = logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120)
             let imageViewWidthConstraint = logoImage.widthAnchor.constraint(equalToConstant: 100)
             let imageViewHeigthConstraint = logoImage.heightAnchor.constraint(equalToConstant: 100)
             let imageViewCenterXConstraint = logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)

             let stackViewTopConstraint = emailPasswordStack.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120)
             let stackViewTrailingConstraint = emailPasswordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
             let stackViewLeadingConstraint = emailPasswordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
             let stackViewConstaint = emailPasswordStack.heightAnchor.constraint(equalToConstant: 100)

             let logInButtonTopConstraint = logInButton.topAnchor.constraint(equalTo: emailPasswordStack.bottomAnchor, constant: 16)
             let logInButtonHeightConstraint = logInButton.heightAnchor.constraint(equalToConstant: 50)
             let logInButtonWidthConstraint = logInButton.widthAnchor.constraint(equalTo: emailPasswordStack.widthAnchor)
             let logInButtonLeadingConstraint = logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)

             NSLayoutConstraint.activate([
                 srollViewTopConstraint, srollViewBottomConstraint, srollViewLeadingConstraint, srollViewTrailingConstraint, contentViewTopConstraint, contentViewHeightXConstraint, contentViewBottomConstraint, contentViewWidthConstraint, stackViewTopConstraint, stackViewTrailingConstraint, stackViewLeadingConstraint, stackViewConstaint, imageViewTopConstraint, imageViewWidthConstraint, imageViewHeigthConstraint, imageViewCenterXConstraint, logInButtonHeightConstraint, logInButtonTopConstraint, logInButtonWidthConstraint, logInButtonLeadingConstraint
             ].compactMap({ $0 }))
    }
}
    
extension LogInViewController: UITextFieldDelegate {
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           view.endEditing(true)
           return true
       }
}

