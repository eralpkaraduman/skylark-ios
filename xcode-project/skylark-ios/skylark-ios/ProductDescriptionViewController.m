//
//  ProductDescriptionViewController.m
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ProductDescriptionViewController.h"

@interface ProductDescriptionViewController ()

@end

@implementation ProductDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)contentHeightInSegmentedViewController:(UIViewController *)segmentedViewController{
    return self.descriptionText.frame.origin.y + self.descriptionText.frame.size.height + 8.0f;
    
    //return 200;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SegmentedViewControllerContentSizeChangedEvent object:nil];
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
