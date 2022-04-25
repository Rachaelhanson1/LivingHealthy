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
    
    
    //user profile photo
    @IBOutlet var userPhoto: UIImageView!
    @IBOutlet weak var addPicButton: UIButton!
    
    
    // user comparison photos - before and after
    @IBOutlet weak var beforeImage: UIImageView!
    @IBOutlet weak var afterImage: UIImageView!
    @IBOutlet weak var addBeforeButton: UIButton!
    
    var imageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let SIvc = SignupViewController()
        firstName.text = "\(SIvc.firstname)"
        
        seperators.layer.cornerRadius = 10
        separator2.layer.cornerRadius = 10
        separator3.layer.cornerRadius = 10

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(didTapChangeBeforePic))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(didTapChangeBeforePic))
        
            
        addPicButton.addGestureRecognizer(gesture)
        addBeforeButton.addGestureRecognizer(gesture2)
        afterImage.addGestureRecognizer(gesture3)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabbar = tabBarController as! mainTabBarViewController
        firstName.text = String(describing: tabbar.firstnameValue)
        
    }
    
    
    
    // invoked when user taps on profile picture
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    // invoked when the user taps on the Before Picture
    @objc private func didTapChangeBeforePic() {
        presentBeforeActionSheet()
    }
    
    // invoked when the user taps on the After Picture
    @objc private func didTapChangeAfterPic() {
        presentBeforeActionSheet()
    }

    

    // trying to get data from sign up view controller**********
    @IBAction func didTapButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "other") as! SignupViewController
        vc.fnSent = { text in
            self.firstName.text = text
        }
    }

    
    // user signs out
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
//selection of profile photo
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        imageNum = 1
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture for you profile?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self]_ in self?.presentCamera()}))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self]_ in self?.presentPhotoPicker()}))
        present(actionSheet, animated: true)
    }
    //selection of before picture
    func presentBeforeActionSheet(){
        imageNum = 2
        let actionSheet = UIAlertController(title: "Before Picture", message: "How would you like to select a picture of you?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self]_ in self?.presentCamera()}))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self]_ in self?.presentPhotoPicker()}))
        present(actionSheet, animated: true)
    }
    //selection of After picture
    func presentAfterActionSheet(){
        imageNum = 2
        let actionSheet = UIAlertController(title: "After Picture", message: "How would you like to select a current or recent picture of you?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self]_ in self?.presentCamera()}))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self]_ in self?.presentPhotoPicker()}))
        present(actionSheet, animated: true)
    }
    //function to allow user to select to inport a photo using the camera
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    // function to allow users to import a photo from their camera roll
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    //which picture and where it should be displayed.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if imageNum == 1 {
            guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
                        self.userPhoto.image = selectedImage
        }
        else if imageNum == 2 {
            guard let selectedImage2 = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
            self.beforeImage.image = selectedImage2
        }
        else if imageNum == 3 {
            guard let selectedImage3 = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
            self.afterImage.image = selectedImage3
  
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    }
}
