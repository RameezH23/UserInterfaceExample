//
//  ViewController.swift
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    lazy var imageModel = {
        return ImageModel.sharedInstance()
    }()
    
    lazy private var imageView: UIImageView? = {
        return UIImageView.init(image: self.imageModel.getImageWithName(displayImageName))
    }()
    
    @IBOutlet weak var switchVar: UISegmentedControl!
    @IBOutlet weak var onOff: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var displayImageName = "Eric"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.wraps = true
          stepper.autorepeat = true
          stepper.maximumValue = 10

        if let size = self.imageView?.image?.size{
            self.scrollView.addSubview(self.imageView!)
            self.scrollView.contentSize = size
            self.scrollView.minimumZoomScale = 0.1
            self.scrollView.delegate = self
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        valueLabel.text = Int(sender.value).description
    }
    
    
    @IBAction func nswfOnOff(_ sender: Any) {
        switch switchVar.selectedSegmentIndex
            {
            case 0:
                onOff.text = "This is not NSFW"
            case 1:
                onOff.text = "This is NSFW"
            default:
                break
            }
    }
    

//    @IBAction func NSFWupdate(_ sender: NSFWswitch) {
//        blurImage(boolean: NSFWswitch.value)
//    }
    
//    func blurImage(boolean: NSFWswitch.value) -> UIImage? {
//        let context = CIContext(options: nil)
//        let inputImage = CIImage(image: imageModel)
//
//        let filter = CIFilter(name: "CIGaussianBlur")
//        filter?.setValue(inputImage, forKey: NSFW)
//        filter?.setValue(10.0, forKey: NSFW)
//
//        let outputImage = filter?.outputImage
//
//        var cgImage:CGImage?
//
//        if let asd = outputImage{
//            cgImage = context.createCGImage(asd, from: (inputImage?.extent)!)
//        }
//        if let cgImageA = cgImage{
//            return UIImage(cgImage: cgImageA, scale: image.scale, orientation: image.imageOrientation)
//        }
//        return nil
//    }


}
