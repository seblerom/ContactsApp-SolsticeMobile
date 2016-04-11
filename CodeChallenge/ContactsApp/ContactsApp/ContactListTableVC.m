//
//  ContactListTableVC.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "ContactListTableVC.h"
#import "AppDelegate.h"
#import "Conexion.h"
#import "Phone.h"
#import "Contacto.h"
#import "ContactDetailVC.h"
#import "CacheImage.h"


static NSString * const SMALLKEY = @"smallKey";

@interface ContactListTableVC ()
@property (nonatomic,strong) NSMutableArray * contactListArray;
@property (strong, nonatomic) IBOutlet UITableView *contactsTableview;
@end

@implementation ContactListTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString * url = [AppDelegate getUrlFromPlistFileWithKey:@"URL_GET_CONTACTS"];
    [self downloadAllContactsWithUrl:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Download all contacts

-(void)downloadAllContactsWithUrl:(NSString*)url{

    NSLog(@"%@",url);
    [Conexion jsonRequestWithBaseURL:url parameters:@"" completion:^(NSDictionary *json, BOOL success) {
        if (success) {
            NSLog(@"%@",json);
            self.contactListArray = [NSMutableArray array];
            for (NSDictionary * singleContact in json) {
                Phone * phone = [[Phone alloc]initWithWorPhone:[[singleContact valueForKey:@"phone"] valueForKey:@"work"] homephone:[[singleContact valueForKey:@"phone"] valueForKey:@"home"] mobilePhone:[[singleContact valueForKey:@"phone"] valueForKey:@"mobile"]];
                Contacto * contacto = [[Contacto alloc]initWithName:[singleContact valueForKey:@"name"] employeeId:[[singleContact valueForKey:@"employeeId"] intValue] company:[singleContact valueForKey:@"company"] detailsUrl:[singleContact valueForKey:@"detailsURL"] smallImage:[singleContact valueForKey:@"smallImageURL"] birthDate:[singleContact valueForKey:@"birthdate"] phone:phone];
                
                [self.contactListArray addObject:contacto];
            }
            [self.contactsTableview reloadData];
        }
    }];

}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentifier = @"contactList";
    ContactListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[ContactListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Contacto * contacto = [self.contactListArray objectAtIndex:indexPath.row];
    cell.contactName.text = [contacto getName];
    Phone * phone = [contacto getPhone];
    cell.contactPhone.text = [phone getWorkPhone];
    
    NSString * key = [SMALLKEY stringByAppendingString:[NSString stringWithFormat:@"%i",[contacto getEmployeeID]]];
    UIImage * imageCached = [[CacheImage sharedInstance] getCachedImageForKey:key];
    
    if (imageCached) {
        cell.contactSmallImage.image = imageCached;
        cell.contactSmallImage.layer.cornerRadius = 5;
        cell.contactSmallImage.clipsToBounds = YES;
        cell.contactSmallImageView.layer.cornerRadius = 5;
        cell.contactSmallImageView.layer.borderWidth = 1;
        cell.contactSmallImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }else{
        NSURL * imageUrl = [NSURL URLWithString:[contacto getSmallImageURL]];
        [Conexion downloadImageWithURL:imageUrl completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                if (image != nil) {
                    cell.contactSmallImage.image = image;
                    cell.contactSmallImage.layer.cornerRadius = 5;
                    cell.contactSmallImage.clipsToBounds = YES;
                    cell.contactSmallImageView.layer.cornerRadius = 5;
                    cell.contactSmallImageView.layer.borderWidth = 1;
                    cell.contactSmallImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
                    
                    NSString * key = [SMALLKEY stringByAppendingString:[NSString stringWithFormat:@"%i",[contacto getEmployeeID]]];
                    [[CacheImage sharedInstance]cacheImage:image forKey:key];
                    
                    
                }
            }
        }];
    }

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  0.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"toContactsDetail" sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"toContactsDetail"]) {
        ContactDetailVC * detail = segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        detail.contacto = [self.contactListArray objectAtIndex:selectedIndexPath.row];
    }
}

@end
