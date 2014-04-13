//
//  GalleryViewController.h
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKListing.h"

@interface GalleryViewController : UIViewController <UIScrollViewDelegate>
@property SKListingMedia *media;
@property NSLayoutConstraint *heightConstraint;
-(void)reload;
@end
