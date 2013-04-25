//
//  RMTwitterSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Social/Social.h>
#import <Accounts/Accounts.h>

@protocol TwitterDelegate <NSObject>


@end

@interface RMTwitterSDK : NSObject

+ (RMTwitterSDK *)sharedClient;
- (void)fetchTimelineForUser:(NSString *)username;

@end
