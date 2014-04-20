//
//  SegmentedViewController.h
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const SegmentedViewControllerContentSizeChangedEvent;

@protocol SegmentedViewControllerDelegate <NSObject>
-(void)segmentedViewController:(NSObject*)segmentedViewController didShowViewController:(UIViewController*)viewController;
@end

@protocol SegmentedViewControllerContentViewController <NSObject>
-(CGFloat)contentHeightInSegmentedViewController:(UIViewController*)segmentedViewController;
@end

@interface SegmentedViewController : UIViewController
@property (strong,nonatomic) NSLayoutConstraint *heightConstraint;
@property (strong,nonatomic) IBOutletCollection(UIView) NSArray *contentViews;
@property (strong,nonatomic) NSObject<SegmentedViewControllerDelegate> *delegate;
@end
