//
//  RMFlickrSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 16/05/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMFlickrSDK.h"

static NSString * const kOAuth1BaseURLString = @"http://www.flickr.com/services/";
static NSString * const kConsumerKeyString = @"";//FILL IN WITH YOUR OWN CONSUMER KEY
static NSString * const kConsumerSecretString = @"";//FILL IN WITH YOUR OWN CONSUMER SECRET
static NSString * const kTokenString = @"";//FILL IN WITH YOUR OWN TOKEN
static NSString * const kTokenSecretString = @"";//FILL IN WITH YOUR OWN TOKEN SECRET


@implementation RMFlickrSDK

+ (RMFlickrSDK *)sharedClient {
    static RMFlickrSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[RMFlickrSDK alloc] initWithBaseURL:[NSURL URLWithString:kOAuth1BaseURLString] key:kConsumerKeyString secret:kConsumerSecretString];
        
    });
    
    return _sharedClient;
}

-(void)getBaseMethodWithDelegate:(NSObject <FlickrDelegate> *)delegate{
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    NSString *path = [NSString stringWithFormat:@""];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"GET DATA RESPONSE: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

@end
