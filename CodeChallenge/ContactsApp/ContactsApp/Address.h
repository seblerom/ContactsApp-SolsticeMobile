//
//  Address.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject
-(id)initWithStreet:(NSString*)street city:(NSString*)city state:(NSString*)state countr:(NSString*)country zipCode:(NSString*)zip latitude:(double)latitude longitude:(double)longitude;

-(double)getLatitude;
-(double)getLongitude;
-(NSString*)getStreet;
-(NSString*)getCity;
-(NSString*)getState;
-(NSString*)getZip;
-(NSString*)getCountry;

@end
