//
//  RMFlickrSDK.h
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

#import "AFOAuth1Client.h"

@protocol FlickrDelegate <NSObject>
@optional

@end

@interface RMFlickrSDK : AFOAuth1Client

+ (RMFlickrSDK *)sharedClient;

//METHODS THAT DON'T REQUIRE AUTHENTICATION:
//blogs
-(void)getBlogsServicesWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//cameras
-(void)getCamerasBrandModelsWithBrandId:(NSString *)brandID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getCamerasBrandsWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//collections
-(void)getCollectionsTreeWithCollectionId:(NSString *)collectionID OrUserId:(NSString *)userID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//commons
-(void)getCommonsInstitutionsWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//contacts
-(void)getContactsPublicListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//favorites
-(void)getFavoritesContextWithUserId:(NSString *)userID AndPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getFavoritesPublicPhotosListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//galleries
-(void)getGalleriesInfoWithGalleryId:(NSString *)galleryID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGalleriesListWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGalleriesListForPhotoWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGalleriesPhotosWithGalleryId:(NSString *)galleryID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//groups
-(void)getGroupsInfoWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGroupsSearchWithText:(NSString *)text AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//groups.discuss.replies
-(void)getGroupsDiscussRepliesInfoWithTopicId:(NSString *)topicID AndReplyId:(NSString *)replyID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGroupsDiscussRepliesListWithTopicId:(NSString *)topicID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//groups.discuss.topics
-(void)getGroupsDiscussTopicsInfoWithTopicId:(NSString *)topicID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGroupsDiscussTopicsListWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//groups.pools
-(void)getGroupsPoolsContextWithGroupId:(NSString *)groupID AndPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getGroupsPoolsPhotosWithGroupId:(NSString *)groupID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//interestingness
-(void)getInterestingnessListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//machinetags
-(void)getMachinetagsNamespacesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getMachinetagsPairsWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getMachinetagsPredicatesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getMachinetagsRecentValuesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getMachinetagsValuesWithNamespace:(NSString *)namesp AndPredicate:(NSString *)predicate AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//panda
-(void)getPandaListWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPandaPhotosWithPandaName:(NSString *)pandaName AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//people
-(void)getPeopleFindByEmail:(NSString *)email AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPeopleFindByUsername:(NSString *)username AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPeopleInfoWithUserId:(NSString *)userID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPeoplePhotosOfWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPeoplePublicGroupsWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPeoplePublicPhotosWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos
-(void)getPhotosAllContextWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosContactsPublicPhotosWithUserId:(NSString *)userID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosContextWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosExifWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosFavoritesWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosInfoWithPhotoId:(NSString *)photoID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosRecentWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosSizesWithPhotoId:(NSString *)photoID AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPhotosSearchWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos comment
-(void)getPhotosCommentListWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos geo
-(void)getPhotosGeoLocationWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos licenses
-(void)getPhotosLicensesWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos people
-(void)getPhotosPeopleListWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photos upload
-(void)getPhotosUploadCheckTicketsWithTickets:(NSString *)tickets WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//photosets
-(void)getPhotosetsContextWithPhotoId:(NSString *)photoId WithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
    -(void)getPhotosetsInfoWithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
    -(void)getPhotosetsListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
    -(void)getPhotosetsPhotosWithPhotosetId:(NSString *)photosetId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//places
-(void)getPlacesFindWithQuery:(NSString *)query AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesByLatitude:(NSString *)latitude WithLongitude:(NSString *)longitude WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesChildrenWithPhotosPublicWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesInfoWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesInfoByURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesTypesWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesShapeHistoryWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesTopPlacesListWithPlaceTypeId:(NSString *)placeTypeId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesForBoudingBoxWithBBox:(NSString *)boudingBox WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesForTagsWithPlaceTypeId:(NSString *)placeTypeId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getPlacesTagsForPlaceWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//push
    -(void)getPushTopicsWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//reflection
-(void)getReflectionMethodInfoWithMethodName:(NSString *)methodName WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getReflectionMethodsWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//tags
-(void)getTagsClusterPhotosWithTag:(NSString *)tag WithClusterId:(NSString *)clusterId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsClusterWithTag:(NSString *)tag WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsHotListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsListPhotoWithPhotoId:(NSString *)photoId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsListUserWithUserId:(NSString *)userId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsListUserPopularWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsListUserRawWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getTagsRelatedWithTag:(NSString *)tag WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//test
-(void)getTestEchoWithDelegate:(NSObject <FlickrDelegate> *)delegate;
//url
-(void)getUrlsGroupWithGroupId:(NSString *)groupId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getUrlsUserPhotosWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getUrlsUserProfileWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getUrlsLookupGalleryWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getUrlsLookupGroupWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;
-(void)getUrlsLookupUserWithURL:(NSString *)url WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <FlickrDelegate> *)delegate;

@end