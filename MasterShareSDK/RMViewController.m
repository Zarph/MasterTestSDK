//
//  RMViewController.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMViewController.h"
#import "RMMasterSDK.h"
@interface RMViewController ()

@end

@implementation RMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //FACEBOOK SDK testing:
    //[[RMMasterSDK FacebookSDK] getPublicPageWithQuery:@"platform" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPlaceWithQuery:@"coffee" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPlaceWithQuery:@"coffee" WithLatitude:@"37.7" WithLongitude:@"-122.427" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPostsWithQuery:@"watermelon" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicGroupsWithQuery:@"programming" WithParams:nil AndWithDelegate:nil];

    //GOOGLE+ SDK testing:
    //[[RMMasterSDK GooglePlusSDK] getPublicPeopleProfileWithUserId:@"104560124403688998123" AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPeopleSearchWithQuery:@"Mark" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPeopleListByActivityWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndCollection:@"plusoners" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPublicActivitiesListWithUserId:@"104560124403688998123" AndCollection:@"public" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getActivityWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getActivitySearchWithQuery:@"Party" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getCommentsListWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getCommentWithCommentId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0.1316111505324000" AndWithDelegate:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
