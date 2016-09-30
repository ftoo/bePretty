//
//  OurArtists.m
//  bePretty
//
//  Created by ilabafrica on 30/09/2016.
//  Copyright © 2016 ILabAfrica. All rights reserved.
//

#import "OurArtists.h"

@implementation OurArtists
@synthesize name, mobile_no, service, price, city, area;

- (id)initWithOrderName: (NSString *)oName andOrderMobile_no: (NSString *)oMobile_no andOrderService: (NSString *)oService andOrderPrice: (NSString *)oPrice andOrderCity: (NSString *)oCity andOrderArea: (NSString *)oArea
{
    self = [super init];
    if (self)
    {
        name = oName;
        mobile_no = oMobile_no;
        service = oService;
        price = oPrice;
        city = oCity;
        area = oArea;
        
    }
    return self;
}
@end
