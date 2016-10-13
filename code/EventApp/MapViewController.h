//
//  MapViewController.h
//  EventApp
//
//  Created by almodad on 9/29/16.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
