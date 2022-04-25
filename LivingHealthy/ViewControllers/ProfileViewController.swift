//
//  ProfileViewController.swift
//  LivingHealthy
//
//  Created by Rachael Hanson on 28/03/2022.
//

import Photos
import PhotosUI
import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    //constraints for side menu
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    var menuOut = false
    @IBOutlet weak var seperators: UIView!
    @IBOutlet weak var separator2: UIView!
    @IBOutlet weak var separator3: UIView!
    
    
    // labels for username
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    
    //user photo
    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet weak var addPicButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let SIvc = SignupViewController()
        firstName.text = "\(SIvc.firstname)"
        
        seperators.layer.cornerRadius = 10
        separator2.layer.cornerRadius = 10
        separator3.layer.cornerRadius = 10

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
            
            addPicButton.addGestureRecognizer(gesture)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! mainTabBarViewController
        firstName.text = String(describing: tabbar.firstnameValue)
        
    }
    
    
    
    // invoked when user taps on profile picture
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }


    

    // trying to get data from sign up view controller**********
    @IBAction func didTapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! SignupViewController
        vc.fnSent = { text in
            self.firstName.text = text
        }
    }

    
    
    @IBAction func signOut(_ sender: Any) {
        try? Auth.auth().signOut()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "signInVC")
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated:true)
    }
    
    //move view to the side for the side menu to come out
    @IBAction func menuTapped(_ sender: Any) {
        if menuOut == false {
            leading.constant = 150
            trailing.constant = -150
            menuOut = true
        } else  {
            leading.constant = 0
            trailing.constant = 0
            menuOut = false
        }
        
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture for you profile?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self]_ in self?.presentCamera()}))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self]_ in self?.presentPhotoPicker()}))
        present(actionSheet, animated: true)
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        
        
        self.userPhoto.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


