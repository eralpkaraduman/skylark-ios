//
//  CancelableScrollView.m
//  CevapTV_iPad
//
//  Created by eralp on 12/24/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import "CancelableScrollView.h"

@implementation CancelableScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if(self.cancelableScrollDelegate!=nil){
        if([self.cancelableScrollDelegate respondsToSelector:@selector(shouldStartScrollingAtPoint:)]){

            //NSLog(@"del");

            return [self.cancelableScrollDelegate shouldStartScrollingAtPoint:[gestureRecognizer locationInView:self]];
            
        }
    }
    
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
