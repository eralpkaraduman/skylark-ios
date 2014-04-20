//
//  ListingDetailViewController.h
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKListing.h"

@interface ListingDetailViewController : UIViewController <UIScrollViewDelegate>
@property (strong,nonatomic) SKListing *listing;
@end
