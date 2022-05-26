//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

     private var backView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.backgroundColor = .white
         return view
     }()

     private var photoLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Photos"
         label.textColor = .black
         label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
         return label
     }()

     private var photoStack: UIStackView = {
         var stack = UIStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.axis = .horizontal
         stack.spacing = 8
         return stack
     }()

     private var arrowImage: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.image = UIImage(named: "arrow")
         image.contentMode = .scaleAspectFill
         return image
     }()

     private var photoImage1: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.clipsToBounds = true
         image.layer.cornerRadius = 6
         image.image = photos[0]
         image.contentMode = .scaleAspectFill
         image.layer.borderWidth = 0.5
         image.layer.borderColor = UIColor.gray.cgColor
         return image
     }()

     private var photoImage2: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.clipsToBounds = true
         image.layer.cornerRadius = 6
         image.image = photos[1]
         image.contentMode = .scaleAspectFill
         image.layer.borderWidth = 0.5
         image.layer.borderColor = UIColor.gray.cgColor
         return image
     }()

     private var photoImage3: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.clipsToBounds = true
         image.layer.cornerRadius = 6
         image.image = photos[2]
         image.contentMode = .scaleAspectFill
         image.layer.borderWidth = 0.5
         image.layer.borderColor = UIColor.gray.cgColor
         return image
     }()

     private var photoImage4: UIImageView = {
         let image = UIImageView()
         image.translatesAutoresizingMaskIntoConstraints = false
         image.clipsToBounds = true
         image.layer.cornerRadius = 6
         image.image = photos[3]
         image.contentMode = .scaleAspectFill
         image.layer.borderWidth = 0.5
         image.layer.borderColor = UIColor.gray.cgColor
         return image
     }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.addSubview(backView)
         self.backView.addSubview(photoLabel)
         self.backView.addSubview(arrowImage)
         self.backView.addSubview(photoStack)
         self.photoStack.addArrangedSubview(photoImage1)
         self.photoStack.addArrangedSubview(photoImage2)
         self.photoStack.addArrangedSubview(photoImage3)
         self.photoStack.addArrangedSubview(photoImage4)
         self.addConstraints()
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     private func addConstraints() {
         
         NSLayoutConstraint.activate([

         backView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
         backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
         backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
         backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

         photoLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12),
         photoLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12),
         photoLabel.bottomAnchor.constraint(equalTo: self.photoStack.topAnchor, constant: -12),

         arrowImage.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12),
         arrowImage.centerYAnchor.constraint(equalTo: self.photoLabel.centerYAnchor),
         arrowImage.heightAnchor.constraint(equalToConstant: 24),
         arrowImage.widthAnchor.constraint(equalToConstant: 24),
         
         photoImage1.widthAnchor.constraint(equalToConstant:(UIScreen.main.bounds.width - 48) / 4),
         photoImage2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
         photoImage3.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),
         photoImage4.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),

         photoImage1.heightAnchor.constraint(equalTo: photoImage1.widthAnchor, multiplier: 1),
         photoImage2.heightAnchor.constraint(equalTo: photoImage2.widthAnchor, multiplier: 1),
         photoImage3.heightAnchor.constraint(equalTo: photoImage3.widthAnchor, multiplier: 1),
         photoImage4.heightAnchor.constraint(equalTo: photoImage4.widthAnchor, multiplier: 1),

         photoStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12),
         photoStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12),
         photoStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
         ])
     }
 }
