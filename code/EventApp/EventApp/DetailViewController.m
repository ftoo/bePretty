//
//  DetailViewController.m
//  EventApp
//
//  Created by almodad on 9/29/16.
//  Copyright © 2016 almodad. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize event = _event;
@synthesize  img = _img, lblName = _lblName, lblDescription = _lblDescription;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_img setImage:[UIImage imageNamed:_event.image]];
    [_lblName setText:_event.name];
    [_lblDescription setText:_event.description];
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentTitle= _event.name;
    content.contentDescription= _event.description;
    
    content.contentURL = [NSURL
                          URLWithString:@"https://www.facebook.com"], [UIImage imageNamed:_event.name];
    //content.imageURL=[NSURL URLWithString:_event.image];
    //content.image= _event.image;
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    shareButton.shareContent = content;
    shareButton.center = self.view.center;
    [self.view addSubview:shareButton];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
