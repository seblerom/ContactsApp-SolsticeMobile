//
//  CacheImage.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/10/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "CacheImage.h"

static CacheImage * sharedInstance;

@interface CacheImage()
@property (nonatomic, strong) NSCache * imageCache;
@end

@implementation CacheImage

+ (CacheImage*)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CacheImage alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageCache = [[NSCache alloc] init];
    }
    return self;
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key {
    [self.imageCache setObject:image forKey:key];
}

- (UIImage*)getCachedImageForKey:(NSString*)key {
    return [self.imageCache objectForKey:key];
}
@end
