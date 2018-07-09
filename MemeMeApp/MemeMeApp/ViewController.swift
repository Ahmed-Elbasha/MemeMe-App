//
//  ViewController.swift
//  MemeMeApp
//
//  Created by Ahmed Elbasha on 7/8/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var pickButton: UIBarButtonItem!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        showImagePickerController(sourceType: .camera)
    }
    
    @IBAction func pickAnImageFromPhotoLibrary(_ sender: Any) {
        showImagePickerController(sourceType: .photoLibrary)
    }
    
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        if sourceType == .camera {
            imagePickerController.cameraDevice = .rear
        }
        imagePickerController.sourceType = sourceType
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

