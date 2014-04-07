//
//  TabBarController.m
//  skylark-ios
//
//  Created by eralp on 16/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "TabBarController.h"
#import "SKClient.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setSelectedIndex:1];
    
    //[[UITabBar appearance] setTintColor:[UIColor colorWithHex:0xffD35E69]];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    //[SKClient sharedInstance]
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController*)childViewControllerForStatusBarStyle{
    return self.selectedViewController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
