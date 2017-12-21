//
//  ViewController.swift
//  PDFKitDemo
//
//  Created by Vipul on 12/19/17.
//  Copyright © 2017 Vipul. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var page1ImageView: UIImageView!
    @IBOutlet weak var page2ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "geographic", ofType: "pdf") {
            let url = URL(fileURLWithPath: path)
            if let pdfDocument = PDFDocument(url: url) {
                pdfView.autoScales = true
                pdfView.displayMode = .singlePageContinuous
                pdfView.displayDirection = .vertical
                pdfView.document = pdfDocument
                
                captureThumbnails(pdfDocument:pdfDocument)
            }
        }
    }
    
    func captureThumbnails(pdfDocument:PDFDocument) {
        if let page1 = pdfDocument.page(at: 1) {
            page1ImageView.image = page1.thumbnail(of: CGSize(
                width: page1ImageView.frame.size.width,
                height: page1ImageView.frame.size.height), for: .artBox)
        }
        
        if let page2 = pdfDocument.page(at: 2) {
            page2ImageView.image = page2.thumbnail(of: CGSize(
                width: page2ImageView.frame.size.width,
                height: page2ImageView.frame.size.height), for: .artBox)
        }
    }
}

