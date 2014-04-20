//
//  SegmentedViewController.m
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "SegmentedViewController.h"

NSString * const SegmentedViewControllerContentSizeChangedEvent = @"SegmentedViewControllerContentSizeChangedEvent";

@interface SegmentedViewController ()
@property (strong,nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong,nonatomic) NSMutableArray *contentViewControllers;
@end

@implementation SegmentedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onContentSizeChanged) name:SegmentedViewControllerContentSizeChangedEvent object:nil];
    
    [self showSelectedSegment];
    
}

-(void)showSelectedSegment{
    
    CGFloat contentHeight = self.view.bounds.size.height;
    
    UIViewController *selectedViewController = self.contentViewControllers[self.segmentedControl.selectedSegmentIndex];
    if([selectedViewController respondsToSelector:@selector(contentHeightInSegmentedViewController:)]){
        
        CGRect convertedSelectedVCRect = [selectedViewController.view convertRect:selectedViewController.view.bounds toView:self.view];
        contentHeight = [(UIViewController<SegmentedViewControllerContentViewController>*)selectedViewController contentHeightInSegmentedViewController:self] + convertedSelectedVCRect.origin.y;
    }
    
    self.heightConstraint.constant = contentHeight;
    
    for(int i=0; i<self.contentViews.count; i++){
        UIView *contentView = self.contentViews[i];
        
        if(i!=self.segmentedControl.selectedSegmentIndex){
            [contentView setHidden:YES];
        }else{
            [contentView setHidden:NO];
        }
        
    }
    
    if([self.delegate respondsToSelector:@selector(segmentedViewController:didShowViewController:)]){
        [self.delegate segmentedViewController:self didShowViewController:selectedViewController];
    }
}

-(void)onContentSizeChanged{
    [self showSelectedSegment];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier hasPrefix:@"segment"]==NO)return;
    
    NSInteger segmentIndex = [[segue.identifier stringByReplacingOccurrencesOfString:@"segment" withString:@""] integerValue];
    
    if(self.contentViewControllers==nil){
        self.contentViewControllers = [[NSMutableArray alloc] initWithCapacity:self.contentViews.count];
        for(int i=0; i<self.contentViews.count; i++){
            [self.contentViewControllers addObject:@{}]; //fill empty objects
        }
    }
    
#warning TODO: burada data init etmek delegate metod yaz
    
    [self.contentViewControllers setObject:segue.destinationViewController atIndexedSubscript:segmentIndex];
    
}

- (IBAction)segmentValueChanged:(id)sender {
    [self showSelectedSegment];
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
