//
//  Event.h
//  EventApp
//
//  Created by almodad on 9/29/16.
//  Copyright © 2016 almodad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (nonatomic, strong) NSString *name; // name of event
@property (nonatomic, strong) NSString *description; // event description
@property (nonatomic, strong) NSString *image; // event logo
@end
