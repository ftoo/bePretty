//
//  ProfileViewController.m
//  bePretty
//
//  Created by SAF01-iMac on 03/08/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import "ProfileViewController.h"
// Instantiate a pair of UILabels in Interface Builder



@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize txtName = _name;
@synthesize txtMobile = _mobile_no;
@synthesize txtService = _service;
@synthesize txtPrice = _price;
@synthesize txtCity = _city;
@synthesize txtArea = _area;


-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Make this controller the delegate for the map view.
    
    
    
}
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
- (IBAction)btnSave:(id)sender {
    if([_name.text isEqualToString:@""]
       ||[_mobile_no.text isEqualToString:@""]
       
       ||[_service.text isEqualToString:@""]
       ||[_price.text isEqualToString:@""]
       ||[_city.text isEqualToString:@""]
       ||[_area.text isEqualToString:@""] ){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooooops" message:@"You must fill all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else {
        [self createProfile];
    }
}

-(void) createProfile {
    
    NSInteger success = 1;
    @try {
        
        NSString *post =[[NSString alloc] initWithFormat:@"name=%@&mobile_no=%@&service=%@&price=%@&city=%@&area=%@",[self.txtName text],[self.txtMobile text],[self.txtService text],[self.txtPrice text],[self.txtCity text],[self.txtArea text]];
        NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://codeninja.co.ke/faith/bepretty/add_artist.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSLog(@"Response code: %ld", (long)[response statusCode]);
        
        if ([response statusCode] >= 200 && [response statusCode] < 300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"Response ==> %@", responseData);
            
            NSError *error = nil;
            NSDictionary *jsonData = [NSJSONSerialization
                                      JSONObjectWithData:urlData
                                      options:NSJSONReadingMutableContainers
                                      error:&error];
            
            success = [jsonData[@"success"] integerValue];
            NSLog(@"Success: %ld",(long)success);
            
            if(success == 1)
            {
                NSLog(@"Profile creation successful");
            } else {
                
                NSString *error_msg = (NSString *) jsonData[@"error_message"];
                [self alertStatus:error_msg :@"Profile creation successful!" :0];
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Connection Failed" :@"Profile creation  Failed!" :0];
        }
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Profile creation Failed." :@"Error!" :0];
    }
    if (success == 1) {
        //HomeViewController *controller=[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        [self performSegueWithIdentifier:@"profile_success" sender:self];
    }
}
- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:(YES)];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
    
    
    
}

@end


