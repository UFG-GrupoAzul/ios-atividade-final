//
//  PostDetailViewController.swift
//  AbstractApp
//
//  Created by Silvano Maneck Malfatti on 05/04/25.
//

import UIKit

class PostDetailViewController: UIViewController {

    var post: Post?

    private let titleTextView: UITextView = {
        let textView = UITextView()
        textView.font = .boldSystemFont(ofSize: 24)
        textView.textAlignment = .center
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes de post"
    
        setupViews()

        titleTextView.text = post?.title
        contentTextView.text = post?.body
    }

    private func setupViews() {
        view.addSubview(titleTextView)
        view.addSubview(contentTextView)

        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            contentTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 16),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentTextView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
