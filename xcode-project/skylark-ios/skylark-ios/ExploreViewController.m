//
//  ExploreViewController.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ExploreViewController.h"
#import "SKListing.h"

@interface ExploreViewController ()
@property (nonatomic,assign) NSUInteger next_offset;
@end

@implementation ExploreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reload];

}

-(void)reload{
    self.next_offset = 0;
    [self loadMore];
}

-(void)loadMore{
    [SKListing exploreListingsWithOffset:self.next_offset withBlock:^(NSArray *listings, NSError *error, NSUInteger *next_offset) {
        if(error){
            
            
            return;
        }
    }];
}

@end
