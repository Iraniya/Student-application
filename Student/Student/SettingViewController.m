//
//  SettingViewController.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "ViewController.h"
#import "ContactViewController.h"
#import "AppDelegate.h"
@interface SettingViewController ()

@end

@implementation SettingViewController
{
    AppDelegate *appDelegateObject;
}
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
    
    //array to display button name
    settingArrayList = [[NSArray alloc]initWithObjects:@"Logout",@"Contanct", nil];
    self.navigationItem.title=@"Settings";
}


//===============Table View methods starts here ===============//////


//number of section in table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//number of rows in section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return settingArrayList.count;

}

//height for the cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 40.0;
}

//creting cell and initializating
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //custom cell for setting
    SettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil) {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"SettingTableViewCell" owner:self options:nil];
        cell = (SettingTableViewCell *)[arrayNib firstObject];
    }
    
    [cell.settingButton setTitle:[settingArrayList objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    cell.settingButton.tag = indexPath.row +1;
    
    [cell.settingButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(IBAction)btnClick:(UIButton*)sender
{
    
    if (sender.tag == 1) {
//        ViewController *viewControllerObject = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//        [appDelegateObject.tabBarControllerObject release];
//        [self.navigationController pushViewController:viewControllerObject animated:YES];
        
        appDelegateObject = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        //[appDelegateObject.tabBarControllerObject release];
        [[[appDelegateObject tabBarControllerObject] view]removeFromSuperview];
    }
    if (sender.tag == 2) {
        ContactViewController *contactViewControllerObject = [[ContactViewController alloc]initWithNibName:@"ContactViewController" bundle:nil];
        
        [self.navigationController pushViewController:contactViewControllerObject animated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


