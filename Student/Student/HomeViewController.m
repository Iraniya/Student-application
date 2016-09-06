//
//  HomeViewController.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//
#import "ViewController.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "HomeTableViewCell.h"
#import "AddSemesterViewController.h"
#import "AppDelegate.h"
#import "NSFileManager+Utility.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
{
    AppDelegate *appDelegateObject;
    ViewController *viewControllerObject;
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
   
    //adding navigation button
    [self navigationBar];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary* currentUserDetailsDict = [[NSMutableDictionary alloc]init];
    currentUserDetailsDict = [[ userDefaults objectForKey:@"CurrentUserDetail"]mutableCopy];
    NSLog(@"%@",currentUserDetailsDict);
    
    
    //To create user Folder in Document Folder
    NSString *userName = [currentUserDetailsDict objectForKey:@"UserName"];
    
    [NSFileManager createFolderInDocumentDirectory:userName ];

    
    [tableViewObject reloadData];
    
    
}


-(void)navigationBar{

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(BtnAdd:)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    self.navigationItem.title=@"EDUCATION";

}

-(IBAction)BtnAdd:(UIButton*)sender
{
    AddSemesterViewController *addSemesterViewControllerObject = [[AddSemesterViewController alloc]initWithNibName:@"AddSemesterViewController" bundle:nil];
    
    [self.navigationController pushViewController:addSemesterViewControllerObject animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//tableViewProperty

//number of secton in table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //number of semsester
    return 1;       //currenty temp as 1 need to change later
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //number of semsester
    return 8;       //currenty temp as 8 need to change later
}

//heigh for the cell

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}
//cell method for table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creating cell object
    HomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        cell = (HomeTableViewCell *)[arrayNib firstObject];
    }
    
    //NSString *placeholder
    cell.semLableObject.text = @"Sem Default Temp"; // temporary store need to change later
    
    cell.semDetailsLableObject.text = @"Details of Sem Temp";//need to change later
    
    
    return cell;
}

@end

