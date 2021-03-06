//
//  RMFlickrSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero & Marco Graciano on 16/05/13.
//    Copyright (c) 2013 Weston McBride
//
//    Permission is hereby granted, free of charge, to any
//    person obtaining a copy of this software and associated
//    documentation files (the "Software"), to deal in the
//    Software without restriction, including without limitation
//    the rights to use, copy, modify, merge, publish,
//    distribute, sublicense, and/or sell copies of the
//    Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice
//    shall be included in all copies or substantial portions of
//    the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
//    KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//    WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//    OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//    OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "RMFlickrSDK.h"

static NSString * const kOAuth1BaseURLString = @"http://api.flickr.com/services/rest/";
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



//METHODS THAT DON'T REQUIRE AUTHENTICATION:
//blogs
-(void)getBlogsServicesWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.blogs.getServices" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//cameras
-(void)getCamerasBrandModelsWithBrandId:(NSString *)brandID AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.cameras.getBrandModels" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:brandID forKey:@"brand"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getCamerasBrandsWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.cameras.getBrands" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//collections
-(void)getCollectionsTreeWithCollectionId:(NSString *)collectionID OrUserId:(NSString *)userID AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.collections.getTree" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:collectionID forKey:@"collection_id"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//commons
-(void)getCommonsInstitutionsWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.commons.getInstitutions" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//contacts
-(void)getContactsPublicListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate{
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.contacts.getPublicList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//favorites
-(void)getFavoritesContextWithUserId:(NSString *)userID AndPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate{
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.favorites.getContext" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getFavoritesPublicPhotosListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.favorites.getPublicList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//galleries
-(void)getGalleriesInfoWithGalleryId:(NSString *)galleryID AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.galleries.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:galleryID forKey:@"gallery_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGalleriesListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.galleries.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGalleriesListForPhotoWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.galleries.getListForPhoto" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGalleriesPhotosWithGalleryId:(NSString *)galleryID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.galleries.getPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:galleryID forKey:@"gallery_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//groups
-(void)getGroupsInfoWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:groupID forKey:@"group_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGroupsSearchWithText:(NSString *)text AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.search" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:text forKey:@"text"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

//groups.discuss.replies
-(void)getGroupsDiscussRepliesInfoWithTopicId:(NSString *)topicID AndReplyId:(NSString *)replyID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.discuss.replies.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:topicID forKey:@"topic_id"];
    [mutableParameters setValue:replyID forKey:@"reply_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGroupsDiscussRepliesListWithTopicId:(NSString *)topicID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.discuss.replies.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:topicID forKey:@"topic_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//groups.discuss.topics
-(void)getGroupsDiscussTopicsInfoWithTopicId:(NSString *)topicID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.discuss.topics.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:topicID forKey:@"topic_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGroupsDiscussTopicsListWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.discuss.topics.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:groupID forKey:@"group_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//groups.pools
-(void)getGroupsPoolsContextWithGroupId:(NSString *)groupID AndPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.pools.getContext" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:groupID forKey:@"group_id"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getGroupsPoolsPhotosWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.groups.pools.getPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:groupID forKey:@"group_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//interestingness
-(void)getInterestingnessListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate; {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.interestingness.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

//machinetags
-(void)getMachinetagsNamespacesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.machinetags.getNamespaces" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getMachinetagsPairsWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.machinetags.getPairs" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getMachinetagsPredicatesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.machinetags.getPredicates" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getMachinetagsRecentValuesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.machinetags.getRecentValues" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getMachinetagsValuesWithNamespace:(NSString *)namesp AndPredicate:(NSString *)predicate AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.machinetags.getValues" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:namesp forKey:@"namespace"];
    [mutableParameters setValue:predicate forKey:@"predicate"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//panda
-(void)getPandaListWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.panda.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPandaPhotosWithPandaName:(NSString *)pandaName AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.panda.getPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:pandaName forKey:@"panda_name"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//people
-(void)getPeopleFindByEmail:(NSString *)email AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.findByEmail" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:email forKey:@"find_email"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPeopleFindByUsername:(NSString *)username AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.findByUsername" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:username forKey:@"username"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPeopleInfoWithUserId:(NSString *)userID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPeoplePhotosOfWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.getPhotosOf" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPeoplePublicGroupsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.getPublicGroups" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPeoplePublicPhotosWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.people.getPublicPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}


//photos
-(void)getPhotosAllContextWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate; {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getAllContexts" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosContactsPublicPhotosWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getContactsPublicPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userID forKey:@"user_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosContextWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getContext" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosExifWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getExif" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosFavoritesWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getFavorites" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosInfoWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];

}

-(void)getPhotosRecentWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getRecent" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosSizesWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.getSizes" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoID forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosSearchWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.search" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Separate ---

-(void)getPhotosCommentListWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.comments.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoId forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosGeoLocationWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.geo.getLocation" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoId forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosLicensesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.licenses.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosPeopleListWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.people.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoId forKey:@"photo_id"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosUploadCheckTicketsWithTickets:(NSString *)tickets WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photos.upload.checkTickets" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:tickets forKey:@"tickets"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosetsContextWithPhotoId:(NSString *)photoId WithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photosets.getContext" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoId forKey:@"photo_id"];
    [mutableParameters setValue:photosetId forKey:@"photoset_id"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosetsInfoWithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photosets.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photosetId forKey:@"photoset_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosetsListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photosets.getList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPhotosetsPhotosWithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.photosets.getPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photosetId forKey:@"photoset_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesFindWithQuery:(NSString *)query AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.find" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:query forKey:@"query"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesByLatitude:(NSString *)latitude WithLongitude:(NSString *)longitude WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.findByLatLon" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:latitude forKey:@"lat"];
    [mutableParameters setValue:longitude forKey:@"lon"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesChildrenWithPhotosPublicWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getChildrenWithPhotosPublic" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesInfoWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesInfoByURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getInfoByUrl" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:url forKey:@"url"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesTypesWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getPlaceTypes" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesShapeHistoryWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getShapeHistory" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesTopPlacesListWithPlaceTypeId:(NSString *)placeTypeId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.getTopPlacesList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:placeTypeId forKey:@"place_type_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesForBoudingBoxWithBBox:(NSString *)boudingBox WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.placesForBoundingBox" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:boudingBox forKey:@"bbox"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesForTagsWithPlaceTypeId:(NSString *)placeTypeId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.placesForTags" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:placeTypeId forKey:@"place_type_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPlacesTagsForPlaceWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.places.tagsForPlace" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getPushTopicsWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.push.getTopics" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getReflectionMethodInfoWithMethodName:(NSString *)methodName WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.reflection.getMethodInfo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:methodName forKey:@"method_name"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getReflectionMethodsWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.reflection.getMethods" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsClusterPhotosWithTag:(NSString *)tag WithClusterId:(NSString *)clusterId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getClusterPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:tag forKey:@"tag"];
    [mutableParameters setValue:clusterId forKey:@"cluster_id"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsClusterWithTag:(NSString *)tag WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getClusters" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:tag forKey:@"tag"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsHotListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getHotList" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsListPhotoWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getListPhoto" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:photoId forKey:@"photo_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsListUserWithUserId:(NSString *)userId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getListUser" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:userId forKey:@"user_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsListUserPopularWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getListUserPopular" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsListUserRawWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getListUserRaw" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTagsRelatedWithTag:(NSString *)tag WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.tags.getRelated" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:tag forKey:@"tag"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getTestEchoWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.test.echo" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsGroupWithGroupId:(NSString *)groupId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.getGroup" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:groupId forKey:@"group_id"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsUserPhotosWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.getUserPhotos" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsUserProfileWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.getUserProfile" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsLookupGalleryWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.lookupGallery" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:url forKey:@"url"];

    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsLookupGroupWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.lookupGroup" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:url forKey:@"url"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

-(void)getUrlsLookupUserWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate {
    
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutableParameters setValue:kConsumerKeyString forKey:@"api_key"];
    [mutableParameters setValue:@"flickr.urls.lookupUser" forKey:@"method"];
    [mutableParameters setValue:@"json" forKey:@"format"];
    [mutableParameters setValue:url forKey:@"url"];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self getPath:nil parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *badJSON = [NSData dataWithData:responseObject];
        NSString *dataAsString = [NSString stringWithUTF8String:[badJSON bytes]];
        NSString *correctedJSONString = [NSString stringWithString:[dataAsString substringWithRange:NSMakeRange(14, dataAsString.length-14-1)]];
        correctedJSONString = [correctedJSONString stringByReplacingOccurrencesOfString:@"\\'" withString:@"'"];
        NSData *correctedData = [correctedJSONString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:correctedData options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"JSON correction failed.");
        } else {
            NSLog(@"JSON RESPONSE: %@", json);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
    }];
}

@end
