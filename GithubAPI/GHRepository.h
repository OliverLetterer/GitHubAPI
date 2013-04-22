//
//  GHRepository.h
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//


@class GHUser, GHIssue;



@interface GHRepository : NSManagedObject

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *repositoryDescription;
@property (nonatomic, strong) NSNumber *private;
@property (nonatomic, strong) NSNumber *fork;
@property (nonatomic, strong) NSURL *htmlURL;
@property (nonatomic, strong) NSURL *cloneURL;
@property (nonatomic, strong) NSURL *gitURL;
@property (nonatomic, strong) NSURL *sshURL;
@property (nonatomic, strong) NSURL *svnURL;
@property (nonatomic, strong) NSURL *mirrorURL;
@property (nonatomic, strong) NSURL *homepage;

@property (nonatomic, strong) GHUser *owner;

@end



@interface GHRepository (CoreDataGeneratedAccessors)

- (void)issuesWithCompletionHandler:(void(^)(NSArray *issues, NSError *error))completionHandler;
- (void)addIssuesObject:(GHIssue *)issue withCompletionHandler:(void(^)(GHIssue *issue, NSError *error))completionHandler;
- (void)deleteIssuesObject:(GHIssue *)issue withCompletionHandler:(void(^)(GHIssue *issue, NSError *error))completionHandler;

@end
