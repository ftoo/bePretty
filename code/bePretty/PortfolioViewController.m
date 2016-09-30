//
//  PortfolioViewController.m
//  bePretty
//
//  Created by ilabafrica on 28/09/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import "PortfolioViewController.h"

@interface PortfolioViewController ()

@end

@implementation PortfolioViewController
@synthesize lblName, lblMobile, lblPrice, lblCity,lblArea, lblService, currentOrder;


@synthesize txtClientName = _client_name;
@synthesize txtClientMobile = _client_mobile_no;
@synthesize txtService = _service;
@synthesize dpBook = _date;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Load up the UI
    [self setLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Methods

- (void)getMyOrder:(id)myorderObject
{
    //MyOrders * object = orderTypeLabel;
    currentOrder = myorderObject;
}

- (void)setLabels
{
   lblName.text = currentOrder.name;
    lblMobile.text = currentOrder.mobile_no;
    lblPrice.text = currentOrder.price;
    lblCity.text = currentOrder.city;
   lblArea.text = currentOrder.area;
    lblService.text = currentOrder.service;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnBook:(id)sender {
    if([_client_name.text isEqualToString:@""]
       ||[_client_mobile_no.text isEqualToString:@""]
         ||[currentOrder.mobile_no isEqualToString:@""]
       ||[_service.text isEqualToString:@""]
       ){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooooops" message:@"You must fill all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else {
        [self book];
    }
    
}

-(void) book {
    
    NSInteger success = 1;
    @try {
        
        NSString *post =[[NSString alloc] initWithFormat:@"client_name=%@&client_no=%@&service=%@&artist_no=%@&date=%@",[self.txtClientName text],[self.txtClientMobile text],[self.txtService text],currentOrder.mobile_no,[self.dpBook date]];
        NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://www.codeninja.co.ke/faith/bepretty/book.php"];
        
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
                NSLog(@"Booking successful");
            } else {
                
                NSString *error_msg = (NSString *) jsonData[@"error_message"];
                [self alertStatus:error_msg :@"Booking  successful!" :0];
            }
            
        } else {
            if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Connection Failed" :@"Booking  creation  Failed!" :0];
        }
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Booking Failed." :@"Error!" :0];
    }
    if (success == 1) {
        //HomeViewController *controller=[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        //[self performSegueWithIdentifier:@"profile_success" sender:self];
        [self alertStatus:@"You have successfully booked. We will contact you" :@"Booking successful" :0];
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
