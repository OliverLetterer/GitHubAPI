//
//  GHIssue.m
//  GithubAPI
//
//  Created by Oliver Letterer on 29.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

#import "GHIssue.h"
#import "GHUser.h"
#import "SLRESTfulCoreData.h"



@implementation GHIssue

@dynamic number;
@dynamic htmlURL;
@dynamic state;
@dynamic title;
@dynamic body;
@dynamic comments;
@dynamic closedAt;
@dynamic createdAt;
@dynamic updatedAt;
@dynamic user;
@dynamic assignee;
@dynamic repository;

+ (void)initialize
{
    [self registerUniqueIdentifierOfJSONObjects:@"number"];
    
    [self registerCRUDBaseURL:[NSURL URLWithString:@"/repos/:repository.full_name/issues"]];
}

@end
