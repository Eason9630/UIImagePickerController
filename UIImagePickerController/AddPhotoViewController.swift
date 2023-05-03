//
//  AddPhotoViewController.swift
//  UIImagePickerController
//
//  Created by 林祔利 on 2023/5/3.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var PhotoImage: UIImageView!

    var selectImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectImage =  info[.originalImage] as? UIImage else{ return }
        
        PhotoImage.image = info[.originalImage] as? UIImage
        
        self.selectImage = PhotoImage.image!
        
        dismiss(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newCollection = segue.destination as? PhotoCollectionViewController else{
            return
        }
        print(self.selectImage)
        newCollection.photoes.append(self.selectImage)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
