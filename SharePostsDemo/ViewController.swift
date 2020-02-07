//
//  ViewController.swift
//  SharePostsDemo
//
//  Created by Gurleen Osahan on 2/4/20.
//  Copyright © 2020 Gurleen Osahan. All rights reserved.
//

import MobileCoreServices
import UIKit
import FacebookShare

 class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,
  SharingDelegate {

    var selectedImage = UIImage()
    
    
  func showShareDialog<C: SharingContent>(_ content: C, mode: ShareDialog.Mode = .automatic) {
    let dialog = ShareDialog(fromViewController: self, content: content, delegate: self)
    dialog.mode = mode
    dialog.show()
  }
    
  // MARK: - Link Content
//Automatic
    @IBAction func shareDialogModeAutomatic(_ sender: Any) {
        guard let url = URL(string: "https://newsroom.fb.com/") else { return }
           let content = ShareLinkContent()
           content.contentURL = url
           showShareDialog(content, mode: .automatic)
    }
  //Web
    @IBAction func ShareDialogMode(_ sender: Any) {
         guard let url = URL(string: "https://newsroom.fb.com/") else { return }
           let content = ShareLinkContent()
           content.contentURL = url
         showShareDialog(content, mode: .web)
    }
    //Photo
  @IBAction private func showShareDialogPhotoContent() {
//     let imagePickerController = UIImagePickerController()
//     imagePickerController.delegate = self
//     imagePickerController.sourceType = .photoLibrary
//     present(imagePickerController, animated: true, completion: nil)
//
   
    let content = SharePhotoContent()
    content.photos = [SharePhoto(image: UIImage(named: "iPhone-11-dummy.jpg")!, userGenerated: true)]
  showShareDialog(content, mode: .web)
    
 }
 
func sharePhoto(){
    let content = SharePhotoContent()
    content.photos = [SharePhoto(image: selectedImage, userGenerated: true)]
   
    showShareDialog(content, mode: .automatic)
  
}
  func sharer(_ sharer: Sharing, didCompleteWithResults results: [String: Any]) {
    let title = "Share Success"
    let message = "Succesfully shared: \(results)"
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in}
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }

  func sharer(_ sharer: Sharing, didFailWithError error: Error) {
    let title = "Share Failed"
    let message = "Sharing failed with error \(error)"
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in}
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
  }

  func sharerDidCancel(_ sharer: Sharing) {
    let title = "Share Cancelled"
    let message = "Sharing was cancelled by user."
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in}
      alertController.addAction(OKAction)
      self.present(alertController, animated: true, completion: nil)
  }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedImage = pickedImage
            self.sharePhoto() ///SHARING PHOTO //////
           
           
        }
        dismiss(animated: true, completion: nil)
    }
}
