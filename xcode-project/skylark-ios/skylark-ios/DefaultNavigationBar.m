//
//  DefaultNavigationBar.m
//  skylark-ios
//
//  Created by eralp on 07/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "DefaultNavigationBar.h"
#import "UIImage+Color.h"

@implementation DefaultNavigationBar

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        //[self setBackgroundColor:[UIColor yellowColor]];
        
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xff8DB1BF]] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}



@end
