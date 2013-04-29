//
//  RMFacebookSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMFacebookSDK.h"

static NSString * const kClientBaseURL = @"https://graph.facebook.com/";

@implementation RMFacebookSDK

+ (RMFacebookSDK *)sharedClient {
    static RMFacebookSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[RMFacebookSDK alloc] initWithBaseURL:[NSURL URLWithString:kClientBaseURL]];
        
    });
    
    return _sharedClient;
}

-(void)authenticateApp{
    
    NSString *path = [NSString stringWithFormat:@"%@oauth/access_token", kClientBaseURL];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"client_id", @"", @"client_secret", @"client_credentials", @"grant_type", nil];

    [self getPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
        NSRange access_token_range = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] rangeOfString:@"access_token="];
        if (access_token_range.length > 0) {
            int from_index = access_token_range.location + access_token_range.length;
            NSString *access_token = [[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] substringFromIndex:from_index];
            
            accessToken = access_token;
            
        }
        
        NSLog(@"ACCESS TOKEN: %@", accessToken);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    
}

-(void)getPublicPageWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate{
    
    NSString *path = [NSString stringWithFormat:@"%@search", kClientBaseURL];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    
    [parameters setValue:query forKey:@"q"];
    [parameters setValue:accessToken forKey:@"access_token"];
    [parameters setValue:@"page" forKey:@"type"];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response Object: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];

}

-(void)getPublicPlaceWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate{
    
    NSString *path = [NSString stringWithFormat:@"%@search", kClientBaseURL];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    
    [parameters setValue:query forKey:@"q"];
    [parameters setValue:accessToken forKey:@"access_token"];
    [parameters setValue:@"place" forKey:@"type"];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response Object: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    
}

-(void)getPublicPlaceWithQuery:(NSString *)query WithLatitude:(NSString *)latitude WithLongitude:(NSString *)longitude WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate{
    
    NSString *path = [NSString stringWithFormat:@"%@search", kClientBaseURL];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    
    [parameters setValue:query forKey:@"q"];
    [parameters setValue:accessToken forKey:@"access_token"];
    [parameters setValue:@"place" forKey:@"type"];
    
    NSString *coords = [NSString stringWithFormat:@"%@,%@", latitude, longitude];
    
    [parameters setValue:coords forKey:@"center"];

    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response Object: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    
}

-(void)getPublicPostsWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate{
    
    NSString *path = [NSString stringWithFormat:@"%@search", kClientBaseURL];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:params];
    
    [parameters setValue:query forKey:@"q"];
    [parameters setValue:accessToken forKey:@"access_token"];
    [parameters setValue:@"post" forKey:@"type"];
    
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Response Object: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    
}

@end
