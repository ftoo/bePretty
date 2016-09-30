//
//  OurArtists.h
//  bePretty
//
//  Created by ilabafrica on 30/09/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OurArtists : NSObject

@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * mobile_no;
@property (strong,nonatomic) NSString * service;
@property (strong,nonatomic) NSString * price;
@property (strong,nonatomic) NSString * city;
@property (strong,nonatomic) NSString * area;


#pragma mark -
#pragma mark Class Methods

- (id)initWithOrderName: (NSString *)oName andOrderMobile_no: (NSString *)oMobile_no andOrderService: (NSString *)oService andOrderPrice: (NSString *)oPrice andOrderCity: (NSString *)oCity andOrderArea: (NSString *)oArea;


@end
