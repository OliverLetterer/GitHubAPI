//
//  GHUser.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

#import "GHUser.h"
#import "GHRepository.h"
#import "SLRESTfulCoreData.h"


@implementation GHUser

@dynamic identifier;
@dynamic login;
@dynamic avatarURL;
@dynamic gravatarIdentifier;
@dynamic name;
@dynamic company;
@dynamic blog;
@dynamic email;
@dynamic createdAt;
@dynamic repositories;

+ (void)initialize
{
    [self registerCRUDBaseURL:[NSURL URLWithString:@"/users/:login/repos"] forRelationship:@"repositories"];
}


+ (void)userWithName:(NSString *)name completionHandler:(void(^)(GHUser *user, NSError *error))completionHandler
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"/users/%@", name]];
    [self fetchObjectFromURL:URL completionHandler:completionHandler];
}

@end
