//
//  SKListingMedia.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "SKListingMedia.h"

@implementation SKListingMedia
-(id)initWithAttributes:(NSDictionary*)attributes{
    self = [super init];
    if(self){
        self.thumbnailURL = [NSURL URLWithString:[attributes valueForKeyPath:@"thumbnail"]];
        self.low_res = [self getURLsInArray:[attributes valueForKeyPath:@"high_res"]];
        self.high_res = [self getURLsInArray:[attributes valueForKeyPath:@"low_res"]];
    }
    return self;
}

-(NSArray*)getURLsInArray:(NSArray*)array{
    NSMutableArray *m_array = [[NSMutableArray alloc] init];
    if(true){
        for(NSString *urlString in array){
            NSURL *url = [NSURL URLWithString:urlString];
            [m_array addObject:url];
        }
    }
    return [NSArray arrayWithArray:m_array];
}

-(NSArray*)auto_res{
    if([[UIScreen mainScreen] scale]>1){
        return self.high_res;
    }else{
        return self.low_res;
    }
}

@end
