//
//  SKClient.h
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "AFOAuth2Client.h"

@interface SKClient : AFOAuth2Client

+ (instancetype)sharedInstance;

@end
