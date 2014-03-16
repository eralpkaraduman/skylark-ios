//
//  UIViewController+ScreenShot.h
//  adphorus
//
//  Created by eralp on 9/8/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ScreenShot)

-(UIImage*)screenshot;
-(UIImage*)screenshotRotatedToOrientation:(UIInterfaceOrientation)orientation;
@end
