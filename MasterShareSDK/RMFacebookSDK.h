//
//  RMFacebookSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@protocol FacebookDelegate <NSObject>


@end
@interface RMFacebookSDK : NSObject

+ (RMFacebookSDK *)sharedClient;

@end
