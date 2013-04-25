//
//  RMTwitterSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "AFOAuth1Client.h"

@protocol TwitterDelegate <NSObject>


@end
@interface RMTwitterSDK : AFOAuth1Client

+ (RMTwitterSDK *)sharedClient;

@end
