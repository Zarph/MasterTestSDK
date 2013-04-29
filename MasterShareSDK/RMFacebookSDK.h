//
//  RMFacebookSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol FacebookDelegate <NSObject>

@end

@interface RMFacebookSDK : AFHTTPClient {
    NSString *accessToken;
}


+ (RMFacebookSDK *)sharedClient;
-(void)authenticateApp;
-(void)getPublicPageWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate;
-(void)getPublicPlaceWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate;
-(void)getPublicPlaceWithQuery:(NSString *)query WithLatitude:(NSString *)latitude WithLongitude:(NSString *)longitude WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate;
-(void)getPublicPostsWithQuery:(NSString *)query WithParams:(NSDictionary *)params AndWithDelegate:(NSObject <FacebookDelegate> *)delegate;

@end
