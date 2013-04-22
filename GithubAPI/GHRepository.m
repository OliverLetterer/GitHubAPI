//
//  GHRepository.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

#import "GHRepository.h"
#import "GHUser.h"
#import "CTRESTfulCoreData.h"

@implementation GHRepository

@dynamic identifier;
@dynamic name;
@dynamic fullName;
@dynamic repositoryDescription;
@dynamic private;
@dynamic fork;
@dynamic htmlURL;
@dynamic cloneURL;
@dynamic gitURL;
@dynamic sshURL;
@dynamic svnURL;
@dynamic mirrorURL;
@dynamic homepage;
@dynamic owner;

+ (void)initialize
{
    [self registerAttributeName:@"repositoryDescription" forJSONObjectKeyPath:@"description"];
}

@end
