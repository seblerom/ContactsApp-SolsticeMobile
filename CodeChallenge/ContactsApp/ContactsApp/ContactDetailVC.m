//
//  ContactDetailVC.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "ContactDetailVC.h"
#import "Conexion.h"
#import "ContactoDetalle.h"
#import "Address.h"
#import "CacheImage.h"
#import "AppDelegate.h"

static NSString * const LARGEKEY = @"largeKey";

@interface ContactDetailVC ()

@property (weak, nonatomic) IBOutlet UIView *viewImageContainer;
@property (weak, nonatomic) IBOutlet UIImageView *largeImage;
@property (weak, nonatomic) IBOutlet UILabel *contactName;
@property (weak, nonatomic) IBOutlet UILabel *contactCompany;
@property (weak, nonatomic) IBOutlet UIImageView *contactFavoriteImage;
@property (weak, nonatomic) IBOutlet UILabel *contactPhone;
@property (weak, nonatomic) IBOutlet UILabel *contactAddressStreet;
@property (weak, nonatomic) IBOutlet UILabel *contactAddressCity;
@property (weak, nonatomic) IBOutlet UILabel *contactBirthday;
@property (weak, nonatomic) IBOutlet UILabel *contactEmail;

@end

@implementation ContactDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadContactDetailInfoWithUrl:[self.contacto valueForKey:@"detailsURL"]];
    self.contactFavoriteImage.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)downloadContactDetailInfoWithUrl:(NSString*)url{

    [AppDelegate showGlobalProgressHUDWithTitle:@""];
    [Conexion jsonRequestWithBaseURL:url parameters:@"" completion:^(NSDictionary *json, BOOL success) {
        [AppDelegate dismissGlobalHUD];
        if (success) {
            NSLog(@"%@",json);
            self.contactName.text = [self.contacto getName];
            self.contactCompany.text = [self.contacto getCompany];
            self.contactPhone.text = [[self.contacto getPhone] getHomePhone];
            self.contactBirthday.text = [self getBirthDateWithMiliseconds:[[self.contacto getBirthDay] longLongValue]];
            
            Address * address = [[Address alloc]initWithStreet:[[json valueForKey:@"address"]valueForKey:@"street"] city:[[json valueForKey:@"address"]valueForKey:@"city"] state:[[json valueForKey:@"address"]valueForKey:@"state"] countr:[[json valueForKey:@"address"]valueForKey:@"country"] zipCode:[[json valueForKey:@"address"]valueForKey:@"zip"] latitude:[[[json valueForKey:@"address"]valueForKey:@"latitude"] doubleValue] longitude:[[[json valueForKey:@"address"]valueForKey:@"longitude"] doubleValue]];
            
            ContactoDetalle * detalle = [[ContactoDetalle alloc]initWithId:[[json valueForKey:@"employeeId"] intValue] isFavorite:[[json valueForKey:@"favorite"] intValue] imageUrl:[json valueForKey:@"largeImageURL"] email:[json valueForKey:@"email"] webSite:[json valueForKey:@"website"] address:address];
            
            self.contactEmail.text = [detalle getEmail];
            
            if ([detalle getIsFavorite] == 1) {
                self.contactFavoriteImage.hidden = NO;
            }

            NSString * key = [LARGEKEY stringByAppendingString:[NSString stringWithFormat:@"%i",[detalle getEmployeeId]]];
            
            UIImage * imageCached = [[CacheImage sharedInstance]getCachedImageForKey:key];
            
            if (imageCached) {
                self.largeImage.image = imageCached;
                self.largeImage.layer.cornerRadius = 10;
                [self.largeImage clipsToBounds];
                self.viewImageContainer.layer.cornerRadius = 10;
                self.viewImageContainer.layer.borderColor = [UIColor lightGrayColor].CGColor;
                self.viewImageContainer.layer.borderWidth = 1;
            }else{
                NSURL * url = [NSURL URLWithString:[detalle getLargeImageURL]];
                [self downloadLargImageForContactWithUrl:url contactoDetalle:detalle];
            }                        
            
            self.contactAddressStreet.text = [address getStreet];
            self.contactAddressCity.text = [[[address getCity] stringByAppendingString:@", "] stringByAppendingString:[address getState]];
            
            
        }
    }];
    
}

-(void)downloadLargImageForContactWithUrl:(NSURL*)url contactoDetalle:(ContactoDetalle*) detalle{
    
    [Conexion downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image) {
        if (succeeded) {
            if (image != nil) {
                self.largeImage.image = image;
                self.largeImage.layer.cornerRadius = 10;
                [self.largeImage clipsToBounds];
                self.viewImageContainer.layer.cornerRadius = 10;
                self.viewImageContainer.layer.borderColor = [UIColor lightGrayColor].CGColor;
                self.viewImageContainer.layer.borderWidth = 1;
                
                NSString * key = [LARGEKEY stringByAppendingString:[NSString stringWithFormat:@"%i",[detalle getEmployeeId]]];
                [[CacheImage sharedInstance]cacheImage:image forKey:key];

            }
        }
    }];
    
}

-(NSString*)getBirthDateWithMiliseconds:(long)dateInMiliseconds{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(dateInMiliseconds / 1000.0)];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy "];
    NSString *dateString = [format stringFromDate:date];
    return dateString;
}
@end
