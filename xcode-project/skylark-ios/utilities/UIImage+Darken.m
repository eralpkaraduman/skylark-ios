//
//  UIImage+Darken.m
//  CevapTV_iPad
//
//  Created by eralp on 7/16/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import "UIImage+Darken.h"
#import <QuartzCore/QuartzCore.h>



@implementation UIImage (Darken)

+ (UIImage *)darkenImage:(UIImage *)image toLevel:(CGFloat)level
{
    // retina fix
    CGFloat screenScale = [UIScreen mainScreen].scale;
    
    CGRect frame = CGRectMake(0.0, 0.0, image.size.width*screenScale, image.size.height*screenScale);
    UIView *tempView = [[UIView alloc] initWithFrame:frame];
    
    tempView.backgroundColor = [UIColor blackColor];
    tempView.alpha = level;
    

    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:frame];

    CGContextTranslateCTM(context, 0, frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, frame, image.CGImage);
    [tempView.layer renderInContext:context];
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *toReturn = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    UIGraphicsEndImageContext();
    
    tempView = nil;
    
    return toReturn;
}

@end
