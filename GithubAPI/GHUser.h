//
//  GHUser.h
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

@class GHRepository;



@interface GHUser : NSManagedObject

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSURL *avatarURL;
@property (nonatomic, strong) NSString *gravatarIdentifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *blog;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, strong) NSSet *repositories;

+ (void)userWithName:(NSString *)name completionHandler:(void(^)(GHUser *user, NSError *error))completionHandler;

@end



@interface GHUser (CoreDataGeneratedAccessors)

- (void)addRepositoriesObject:(GHRepository *)value;
- (void)removeRepositoriesObject:(GHRepository *)value;
- (void)addRepositories:(NSSet *)values;
- (void)removeRepositories:(NSSet *)values;

- (void)repositoriesWithCompletionHandler:(void(^)(NSArray *repositories, NSError *error))completionHandler;

@end
