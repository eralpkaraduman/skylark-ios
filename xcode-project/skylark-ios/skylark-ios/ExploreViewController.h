//
//  ExploreViewController.h
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FooterProgressView : UICollectionReusableView
@property (strong,nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end


@interface ExploreViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@end
