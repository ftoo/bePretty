//
//  EventsViewController.m
//  EventApp
//
//  Created by almodad on 9/29/16.
//  Copyright © 2016 almodad. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController{
    NSMutableArray *events;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Event *event1 = [Event new];
    event1.name = @"Strathmore sports day";
    event1.description = @"2016 sports day for Strathmore students";
    event1.image = @"sport.jpg";
    
    Event *event2 = [Event new];
    event2.name = @"INDO-AFRICA ICT SUMMIT 2016";
    event2.description = @"ICT summit for techpreneurs at KICC";
    event2.image = @"indo.jpg";
    
    Event *event3 = [Event new];
    event3.name = @"Google developer summit";
    event3.description = @"A handson bootcamp for all mobile developers in Nairobi";
    event3.image = @"dev.png";
    
    Event *event4 = [Event new];
    event4.name = @"Faith weds Philip";
    event4.description = @"Wedding is on 8th Oct. 2016";
    event4.image = @"wedding.jpg";
    
    events = [NSMutableArray arrayWithObjects:event1, event2, event3, event4, nil];
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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [events count];
    
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *cellIdentifier = @"TableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    
    Event *event = ((Event *)events[indexPath.row]);
    
    cell.textLabel.text = event.name;
    [cell.detailTextLabel setText: event.description];
    cell.imageView.image = [UIImage imageNamed:event.image];
    
    return cell;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSInteger index = [self.eventView indexPathForSelectedRow].row;
    if([segue.identifier isEqualToString:@"eventDetail"]){
        [(DetailViewController *)segue.destinationViewController setEvent:
         [self objectInListAtIndex:index]];
    }
}

-(Event *) objectInListAtIndex: (NSUInteger) index{
    return [events objectAtIndex:index];
}

@end
