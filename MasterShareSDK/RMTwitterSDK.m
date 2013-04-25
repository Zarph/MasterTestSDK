//
//  RMTwitterSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMTwitterSDK.h"

static NSString * const kOAuth1BaseURLString = @"https://api.twitter.com/1.1/";
static NSString * const kConsumerKeyString = @"";//FILL IN WITH YOUR OWN CONSUMER KEY
static NSString * const kConsumerSecretString = @"";//FILL IN WITH YOUR OWN CONSUMER SECRET
static NSString * const kTokenString = @"";//FILL IN WITH YOUR OWN TOKEN
static NSString * const kTokenSecretString = @"";//FILL IN WITH YOUR OWN TOKEN SECRET

@implementation RMTwitterSDK

+ (RMTwitterSDK *)sharedClient {
    static RMTwitterSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[RMTwitterSDK alloc] initWithBaseURL:[NSURL URLWithString:kOAuth1BaseURLString] key:kConsumerKeyString secret:kConsumerSecretString];
        
    });
    
    return _sharedClient;
}



@end
