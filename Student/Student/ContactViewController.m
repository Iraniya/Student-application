//
//  ContactViewController.m
//  Student
//
//  Created by agile on 05/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ContactViewController.h"
#import "AppDelegate.h"

@interface ContactViewController ()

@end

@implementation ContactViewController
{

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
    
    self.navigationItem.title=@"Contacts";
    // Do any additional setup after loading the view from its nib.
    userContact = [[NSMutableDictionary alloc]init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    allUserDetailsArray = [[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];
    
    NSLog(@"%@",allUserDetailsArray);
    
    usersContactArray = [[ NSMutableArray alloc]init];
    
    int numberOfUser =(int)allUserDetailsArray.count;
    
    for (int i =0 ; i<numberOfUser ; i++) {

        NSMutableDictionary *tempDictAllUser = [[NSMutableDictionary alloc]init];
        NSMutableDictionary *tempDict =[[NSMutableDictionary alloc]init];
        tempDictAllUser = [allUserDetailsArray objectAtIndex:i];
        
        [userContact setValue:[tempDictAllUser objectForKey:@"Phone"] forKey:[tempDictAllUser objectForKey:@"UserName"]];
        
        [tempDict setValue:[tempDictAllUser objectForKey:@"Phone"] forKey:[tempDictAllUser objectForKey:@"UserName"]];
       
      [usersContactArray addObject:tempDict];
    }
   
    
    
   // NSArray *sortedKeys= [userContact allKeys];
    
   
}

//========== Table View Methods ================///

//number of section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //only one section
}

//number of rows in section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return userContact.count; //number of value to store in sign up
    
}

//title for section SignUP
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *str = @"Contact";
    return str;
}

//for each cell in table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSLog(@"%@",sortedKeys);
    cell.textLabel.text =[sortedKeys objectAtIndex:indexPath.row];
    //cell.textLabel.text = [[usersContactArray objectAtIndex:indexPath.row] objectForKey:@"test"];;
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
//sorting dictionary
- (NSArray *)sortKeysByIntValue:(NSDictionary *)dictionary {
    
    NSArray *sortedKeys = [dictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        if (v1 < v2)
            return NSOrderedAscending;
        else if (v1 > v2)
           return NSOrderedDescending;
       else
            return NSOrderedSame;
    }];
    return sortedKeys;
}
*/

@end
