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
    
//    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    
    
    [[RMMasterSDK OrkutSDK] authenticate];
    [self.view addSubview:[RMMasterSDK OrkutSDK].webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLoginFromHandle {
    
    // NSData *dataToSEnd = UIImageJPEGRepresentation([UIImage imageNamed:@"asd.png"], 0.1);
    
    // [[RMMasterSDK DeviantArtSDK] postSubmitOnStaWithFile:dataToSEnd Parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"Test", @"Title", nil] AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postMoveFileOnStaWithStashId:@"4342586905948352" Parameters:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] postRenameFolderOnStaWithFolder:@"New" WithFolderId:@"5615157401027624" AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] getAvailibleSpaceOnStaWithDelegate:nil];
    
    //  [[RMMasterSDK DeviantArtSDK] getListFoldersAndSubmissionsOnStaWithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postFetchFolderAndSubmissionDataOnStaWithStashId:@"5982545012521093" WithFolderId:@"6024923543342390" WithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postFetchSubmissionMediaOnStaWithStashId:@"5982545012521093" AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] postDeleteOnStaWithStashId:@"5982545012521093" AndWithDelegate:nil];
    
}

@end
