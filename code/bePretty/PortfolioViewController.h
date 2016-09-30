//
//  PortfolioViewController.h
//  bePretty
//
//  Created by ilabafrica on 28/09/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OurArtists.h"

@interface PortfolioViewController : UIViewController
- (IBAction)btnBook:(id)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *dpBook;
@property (strong, nonatomic) IBOutlet UITextField *txtService;
@property (strong, nonatomic) IBOutlet UITextField *txtClientMobile;
@property (strong, nonatomic) IBOutlet UITextField *txtClientName;

@property (strong, nonatomic) IBOutlet UILabel *lblService;


@property (strong, nonatomic) IBOutlet UIImageView *imgPortfolio;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblMobile;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblCity;
@property (strong, nonatomic) IBOutlet UILabel *lblArea;





//@property (nonatomic, strong) NSString *artistName;
@property(nonatomic, strong) OurArtists * currentOrder;
#pragma mark -
#pragma mark Methods

- (void)getMyOrder:(id)myorderObject;
- (void)setLabels;







@end
