//
//  PlaceholderViewController.m
//  skylark-ios
//
//  Created by eralp on 07/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "BaseRootViewController.h"
#import "UINavigationItem+Attributes.h"

@interface BaseRootViewController ()

@end

@implementation BaseRootViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationItem addLogo];
    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
