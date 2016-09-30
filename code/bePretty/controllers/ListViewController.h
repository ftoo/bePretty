//
//  ListViewController.h
//  bePretty
//
//  Created by SAF01-iMac on 01/08/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UITableViewController


//@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSMutableArray * ordersArray;

#pragma mark -
#pragma mark Class Methods

- (void) retrieveData;

@end

