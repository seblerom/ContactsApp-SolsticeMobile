//
//  CacheImage.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/10/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface CacheImage : NSObject

+ (CacheImage*)sharedInstance;
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;
- (UIImage*)getCachedImageForKey:(NSString*)key;
@end
