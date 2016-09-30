//
//  BookViewController.h
//  bePretty
//
//  Created by ilabafrica on 28/09/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *dpBook;
@property (strong, nonatomic) IBOutlet UITextField *txtBookService;
@property (strong, nonatomic) IBOutlet UITextField *txtClientMobile;
@property (strong, nonatomic) IBOutlet UITextField *txtAtistName;
@property (strong, nonatomic) IBOutlet UITextField *txtArtistMobile;

@end
