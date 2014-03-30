//
//  ExploreThumbnailCell.h
//  skylark-ios
//
//  Created by eralp on 30/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKListing.h"

@interface ExploreThumbnailCell : UICollectionViewCell
@property (strong,nonatomic) IBOutlet UIImageView *imageView;
-(void)updateWithListing:(SKListing*)listing;
@end
