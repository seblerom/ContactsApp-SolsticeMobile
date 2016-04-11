//
//  Address.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "Address.h"

@interface Address()

@property (nonatomic,strong) NSString * street;
@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) NSString * state;
@property (nonatomic,strong) NSString * country;
@property (nonatomic,strong) NSString * zip;

@property(nonatomic) double latitude;
@property(nonatomic) double longitude;

@end

@implementation Address


-(id)initWithStreet:(NSString*)street city:(NSString*)city state:(NSString*)state countr:(NSString*)country zipCode:(NSString*)zip latitude:(double)latitude longitude:(double)longitude{
    
    self = [super init];
    if( self )
    {
        // This property can only be accessed within the class
        self.street = street;
        self.city = city;
        self.state = state;
        self.country = country;
        self.zip = zip;
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

-(double)getLatitude{
    return  self.latitude;
}
-(double)getLongitude{
    return  self.longitude;
}
-(NSString*)getStreet{
    return  self.street;
}
-(NSString*)getCity{
    return  self.city;
}
-(NSString*)getState{
    return  self.state;
}
-(NSString*)getZip{
    return  self.zip;
}
-(NSString*)getCountry{
    return  self.country;
}
@end
