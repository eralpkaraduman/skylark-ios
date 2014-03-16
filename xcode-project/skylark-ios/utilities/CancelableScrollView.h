//
//  CancelableScrollView.h
//  CevapTV_iPad
//
//  Created by eralp on 12/24/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CanelableScrollViewDelegate <NSObject>

-(BOOL)shouldStartScrollingAtPoint:(CGPoint)_point;

@end

@interface CancelableScrollView : UIScrollView
@property NSObject<CanelableScrollViewDelegate> *cancelableScrollDelegate;
@end
