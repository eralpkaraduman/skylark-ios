//
//  DefaultNavigationController.m
//  skylark-ios
//
//  Created by eralp on 07/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "DefaultNavigationController.h"

@interface DefaultNavigationController ()

@end

@implementation DefaultNavigationController

-(UIViewController*)childViewControllerForStatusBarStyle{
    return self.topViewController;
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
