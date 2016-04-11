//
//  ContactoDetalle.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
@interface ContactoDetalle : NSObject
- (id)initWithId:(int)employeeId isFavorite:(int)favorite imageUrl:(NSString*)largeImageURL email:(NSString*)email webSite:(NSString*)website address:(Address*)address;

-(int)getEmployeeId;
-(int)getIsFavorite;
-(NSString*)getLargeImageURL;
-(NSString*)getEmail;
-(NSString*)getWebsite;

@end
