//
//  UIViewController+ScreenShot.m
//  adphorus
//
//  Created by eralp on 9/8/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import "UIViewController+ScreenShot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (ScreenShot)

-(UIImage*)screenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            
            
            // Offset by the portion of the bounds left of and above the anchor point
            
            CGContextTranslateCTM(context,
                                      -[window bounds].size.width * [[window layer] anchorPoint].x,
                                      -[window bounds].size.height * [[window layer] anchorPoint].y);
            

            
            
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


-(UIImage*)screenshotRotatedToOrientation:(UIInterfaceOrientation)orientation{

    UIImage *image = [self screenshot];
    
    UIImageOrientation imageOrientation = UIImageOrientationUp;
    
    if(orientation == UIInterfaceOrientationPortrait){
        imageOrientation = UIImageOrientationUp;
    }
    if(orientation == UIInterfaceOrientationPortraitUpsideDown){
        imageOrientation = UIImageOrientationDown;
    }
    if(orientation == UIInterfaceOrientationLandscapeRight){
        imageOrientation = UIImageOrientationLeft;
    }
    if(orientation == UIInterfaceOrientationLandscapeLeft){
        imageOrientation = UIImageOrientationRight;
    }
    
    image = [UIImage imageWithCGImage:[image CGImage] scale:[UIScreen mainScreen].scale orientation:imageOrientation];
    
    return image;
    
}



@end
