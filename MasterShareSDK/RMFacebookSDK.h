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

@interface RMFacebookSDK : AFHTTPClient


+ (RMFacebookSDK *)sharedClient;
-(void)authenticateApp;

@end
