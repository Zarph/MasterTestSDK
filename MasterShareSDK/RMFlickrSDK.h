//
//  RMFlickrSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 16/05/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "AFOAuth1Client.h"

@protocol FlickrDelegate <NSObject>
@optional

@end

@interface RMFlickrSDK : AFOAuth1Client

+ (RMFlickrSDK *)sharedClient;

@end
