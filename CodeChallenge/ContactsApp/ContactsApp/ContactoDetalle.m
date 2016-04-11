//
//  ContactoDetalle.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "ContactoDetalle.h"

@interface ContactoDetalle()

@property(nonatomic) int employeeId;
@property(nonatomic) int favorite;
@property (nonatomic,strong) NSString * largeImageURL;
@property (nonatomic,strong) NSString * email;
@property (nonatomic,strong) NSString * website;
@property (nonatomic,strong) Address * address;
@end


@implementation ContactoDetalle

- (id)initWithId:(int)employeeId isFavorite:(int)favorite imageUrl:(NSString*)largeImageURL email:(NSString*)email webSite:(NSString*)website address:(Address*)address{

    self = [super init];
    if( self )
    {
        // This property can only be accessed within the class
        self.employeeId = employeeId;
        self.favorite = favorite;
        self.largeImageURL = largeImageURL;
        self.email = email;
        self.website = website;
        self.address = address;
    }
    return self;
}

-(int)getEmployeeId{
    return  self.employeeId;
}

-(int)getIsFavorite{
    return  self.favorite;
}
-(NSString*)getLargeImageURL{
    return  self.largeImageURL;
}
-(NSString*)getEmail{
    return  self.email;
}
-(NSString*)getWebsite{
    return  self.website;
}
@end
