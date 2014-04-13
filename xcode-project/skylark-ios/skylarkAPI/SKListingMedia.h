//
//  SKListingMedia.h
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKListingMedia : NSObject
@property (strong,nonatomic) NSURL *thumbnailURL;
@property NSArray *low_res;
@property NSArray *high_res;
@property (nonatomic,readonly) NSArray *auto_res;
-(id)initWithAttributes:(NSDictionary*)attributes;
@end
