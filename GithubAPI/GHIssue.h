//
//  GHIssue.h
//  GithubAPI
//
//  Created by Oliver Letterer on 29.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GHUser, GHRepository;

@interface GHIssue : NSManagedObject

@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSString *htmlURL;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSNumber *comments;
@property (nonatomic, strong) NSDate *closedAt;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) GHUser *user;
@property (nonatomic, strong) GHUser *assignee;
@property (nonatomic, strong) GHRepository *repository;

@end
