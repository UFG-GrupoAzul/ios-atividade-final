//
//  ErrorView.swift
//  AbstractApp
//
//  Created by Mathias Matos on 17/04/25.
//

import Foundation
import UIKit

protocol ErrorViewDelegate: AnyObject {
    func didTapRetryButton(in errorView: ErrorView)
} 

class ErrorView: UIView {
    
    //working with XIB.
    //This class will load the .xib by its name
    //then it loads the UIView from the .xib
    //adds the UIview as a child
    //adjusts size
    @IBOutlet weak var showError: UILabel!
    
    
    
    weak var delegate: ErrorViewDelegate?
    
    
    // Required initializers for UIView subclasses
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit() // calling config func
        }
    
    
    required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          commonInit() // calling config func
      }
    
    // Load view  from XIB
        private func commonInit() {
           
            guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else {
                 print("Error: Could not load view from nib file.")
                 return
            }

            // Adds view as a subview of this class
            addSubview(view)

            // Fill the size!
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    
    @IBAction func againButton(_ sender: UIButton) {
        print("Botão Tentar Novamente clicado DENTRO da ErrorView!")
        
        delegate?.didTapRetryButton(in: self)

    }
    
    func configure(message: String) {
            showError.text = message //change label msg
        }

        

}
    

