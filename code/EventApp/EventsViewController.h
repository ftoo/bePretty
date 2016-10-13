//
//  EventsViewController.h
//  EventApp
//
//  Created by almodad on 9/29/16.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "DetailViewController.h"

@interface EventsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *eventView;
@end
