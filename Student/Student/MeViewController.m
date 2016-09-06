//
//  MeViewController.m
//  Student
//
//  Created by agile on 21/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "MeViewController.h"
#import "AboutUsViewController.h"
#import "MeLocationViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self NavigationProperty];
    
    //arry
    [self CreateInfoArray];
}
#pragma mark - Navigation Bar Methods
-(void)NavigationProperty
{
    self.navigationItem.title = @"Info";
    
}

#pragma mark - Info array 
-(void)CreateInfoArray
{
    infoDetailsArray = [[NSMutableArray alloc]initWithObjects:@"About",@"Contact As", nil];
}
#pragma mark - Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return infoDetailsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text =[infoDetailsArray objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AboutUsViewController *aboutAsViewControllerObject =[[AboutUsViewController alloc]initWithNibName:@"AboutUsViewController" bundle:nil];
    
        [self.navigationController pushViewController:aboutAsViewControllerObject animated:YES];
    }
    if (indexPath.row==1) {
        MeLocationViewController *locationViewControllerObject=[[MeLocationViewController alloc]initWithNibName:@"MeLocationViewController" bundle:nil];
        [self.navigationController pushViewController:locationViewControllerObject animated:YES];
    }
}
@end
