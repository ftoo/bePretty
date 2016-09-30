
//

//  ListViewController.m

//  bePretty

//

//  Created by SAF01-iMac on 01/08/2016.

//  Copyright © 2016 ILabAfrica. All rights reserved.

//



#import "ListViewController.h"
#import "OurArtists.h"
#import "PortfolioViewController.h"
#define getDataURL @"http://www.codeninja.co.ke/faith/bepretty/artist_details.php"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize jsonArray, ordersArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set the title of our VC
    self.title = @"My Orders";
    
    //Load data
    [self retrieveData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    
    //Return the number of rows in the section
    return ordersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    OurArtists * myorderObject;
    myorderObject = [ordersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = myorderObject.name;
    
    
   
    /*NSMutableString *text;
    
    text = [NSString stringWithFormat: [myorderObject name]];
    
    cell.textLabel.text = text;
   
    NSMutableString *detail;
    
    detail = [NSString stringWithFormat:@"Service : %@ , City: %@"
              
              ,[myorderObject service]
              
              ,[myorderObject city]];
    cell.detailTextLabel.text= detail;*/
    
    //Accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"showArtistDetail"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        
        //Get the object for the selected row
      OurArtists * object = [ordersArray objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getMyOrder:object];
    }
}


#pragma mark -
#pragma mark Class Methods

- (void) retrieveData
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up our Orders array
    ordersArray = [[NSMutableArray alloc] init];
    
    //  Loop through our jsonArray
    for (int i = 0; i < jsonArray.count; i++)
    {
        //Create our Orders object
        NSString * oName = [[jsonArray objectAtIndex:i] objectForKey:@"name"];
        NSString * oMobile_no = [[jsonArray objectAtIndex:i] objectForKey:@"mobile_no"];
        NSString * oService = [[jsonArray objectAtIndex:i] objectForKey:@"service"];
        NSString * oPrice = [[jsonArray objectAtIndex:i] objectForKey:@"price"];
        NSString * oCity = [[jsonArray objectAtIndex:i] objectForKey:@"city"];
        NSString * oArea = [[jsonArray objectAtIndex:i] objectForKey:@"area"];
        
        //Add the orders object to our orders array
        [ordersArray addObject:[[OurArtists alloc] initWithOrderName:oName andOrderMobile_no:oMobile_no andOrderService:oService andOrderPrice:oPrice andOrderCity:oCity andOrderArea:oArea]];
    }
    
    //Reload our table view
    
    [self.tableView reloadData];
    //[self.MyTableView reloadData];
    
}

@end



