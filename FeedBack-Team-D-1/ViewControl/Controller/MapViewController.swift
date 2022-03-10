//
//  MapViewController.swift
//  FeedBack-Team-D-1
//
//  Created by  David Gonzalez on 3/10/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
            let lc = CLLocationCoordinate2D(latitude: 17.2220, longitude: -89.6237)
            
            let ms = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            
            let rg = MKCoordinateRegion(center: lc, span: ms)
            
            //kaplm
        myMap.setRegion(rg,  animated: true)
                           
            let annot = MKPointAnnotation()
                           
            annot.coordinate = lc
             annot.title = "City Escape Provider"
            annot.subtitle = "Change Coupon Here"
        myMap.addAnnotation(annot)
    }
    

    // MARK: - Navigation
}
