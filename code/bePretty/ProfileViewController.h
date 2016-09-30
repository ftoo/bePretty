///
//  ProfileViewController.h
//  bePretty
//
//  Created by SAF01-iMac on 03/08/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#define kGOOGLE_API_KEY @" AIzaSyCHhGVZmEp8QauW1fUR3zIkSVUkGod3Gh4 "





@interface ProfileViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    
    
}

@property (strong, nonatomic) IBOutlet UITextField *txtCity;
- (IBAction)btnSave:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtArea;

@property (strong, nonatomic) IBOutlet UITextField *txtPrice;
@property (strong, nonatomic) IBOutlet UITextField *txtService;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtMobile;






@end