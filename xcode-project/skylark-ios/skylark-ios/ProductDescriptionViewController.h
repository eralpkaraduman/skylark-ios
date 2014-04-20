//
//  ProductDescriptionViewController.h
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedViewController.h"

@interface ProductDescriptionViewController : UIViewController <SegmentedViewControllerContentViewController>
@property (strong,nonatomic) IBOutlet UILabel *descriptionText;
@end
