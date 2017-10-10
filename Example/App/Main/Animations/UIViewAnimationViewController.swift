//
//  UIViewAnimationViewController.swift
//  Example
//
//  Created by Fong Zhou on 10/10/2017.
//  Copyright © 2017 Fong Zhou. All rights reserved.
//

import UIKit

class UIViewAnimationViewController: UIViewController {

    @IBOutlet weak var durationTextfield: UITextField!
    @IBOutlet weak var delayTextField: UITextField!
    @IBOutlet weak var dampingTextfield: UITextField!
    @IBOutlet weak var velocityTextfield: UITextField!


    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        [durationTextfield, delayTextField, dampingTextfield, velocityTextfield].forEach({ $0?.delegate = self })
    }

    func stopAnimating() {
        imageView.transform = .identity
        imageView.layer.removeAllAnimations()
    }

    func startAnimating() {
        self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        UIView.animate(
            withDuration: getValueFromTextfield(textField: durationTextfield),
            delay: getValueFromTextfield(textField: delayTextField),
            usingSpringWithDamping: CGFloat(getValueFromTextfield(textField: dampingTextfield)),
            initialSpringVelocity: CGFloat(getValueFromTextfield(textField: velocityTextfield)),
            options: [.autoreverse, .repeat],
            animations: {
                self.imageView.transform = .identity
            },
            completion: nil)
    }

    func getValueFromTextfield(textField: UITextField) -> Double {
        guard let string = textField.text else { return 0 }
        guard let value = Double(string) else { return 0 }

        return value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewAnimationViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        stopAnimating()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        startAnimating()
        return true
    }

}
