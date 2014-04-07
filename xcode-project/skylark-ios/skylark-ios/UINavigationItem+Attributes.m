//
//  UINavigationItem+Attributes.m
//  skylark-ios
//
//  Created by eralp on 08/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "UINavigationItem+Attributes.h"

@implementation UINavigationItem (Attributes)

-(void)addLogo{
    self.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"skylark_header_logo"]];
}

@end
