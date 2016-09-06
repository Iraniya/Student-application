//
//  AppDelegate.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"      //Is Same educationViewController
#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "NSString+Utility.h"
#import "AboutUsViewController.h"
#import "MeViewController.h"

@implementation AppDelegate

@synthesize tabBarControllerObject,allUserDetailArray;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //to create Main Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *viewControllerObject = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    UINavigationController *navigationObject = [[UINavigationController alloc]initWithRootViewController:viewControllerObject];
    
    self.window.rootViewController = navigationObject;
    
    [self.window makeKeyAndVisible];
    
    [self settingTabBarController];
    
    //[self gettingAllUserData];
    //[self writeDataToPlistFile];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - SettingTabBarController

//functtion to create tab bar controller for educaion page
-(void)settingTabBarController
{
    //Setting Tab bar controller for Education (eg. Home ViewController)
    self.tabBarControllerObject = [[UITabBarController alloc]init];
    
    //creating objects for tabbar
    HomeViewController *homeViewControllerObject=[[HomeViewController alloc]init];
    ProfileViewController *profileViewControllerObject=[[ProfileViewController alloc]init];
    SettingViewController *settingViewControllerObject=[[SettingViewController alloc]init];
    MeViewController *meViewControllerObject=[[MeViewController alloc]init];
    
    
    //creating object for navigating tab bar
    UINavigationController *homeNavigationObject=[[UINavigationController alloc]initWithRootViewController:homeViewControllerObject];
    
    UINavigationController *profileNavigationObject=[[UINavigationController alloc]initWithRootViewController:profileViewControllerObject];
    
    UINavigationController *settingNavigationObject=[[UINavigationController alloc]initWithRootViewController:settingViewControllerObject];
    
    UINavigationController *meNavigationObject=[[UINavigationController alloc]initWithRootViewController:meViewControllerObject];
    
    //storing all views in array
    NSArray *viewControllerObjectsArray=[[NSArray alloc]initWithObjects:homeNavigationObject,profileNavigationObject,settingNavigationObject,meNavigationObject, nil];
    
    //setting views in tabbarcontroller
    [self.tabBarControllerObject setViewControllers:viewControllerObjectsArray];
    
    //setting title for views
    UITabBarItem *homeItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:0];
    homeItem.title=@"Education";
    
    UITabBarItem *profileItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:1];
    profileItem.title=@"Profile";
    
    UITabBarItem *settingItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:2];
    settingItem.title=@"Setting";
    
    UITabBarItem *aboutAsItem = [self.tabBarControllerObject.tabBar.items objectAtIndex:3];
    aboutAsItem.title =@"Me";
}


-(void)gettingAllUserData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    allUserDetailArray = [[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];
}


-(void)writeDataToPlistFile
{
   // NSMutableArray *allUserDataArray = [[NSMutableArray alloc]init];
    
    NSString *strPath = [NSString getPathForFileName:@"StudentDetails" withFileType:@"plist"];
    
    NSLog(@"%@",strPath);
   // allUserDataArray = [[NSMutableArray alloc] initWithContentsOfFile:strPath];
    NSLog(@"str path %@",strPath);
    NSLog(@"alluserdata%@",allUserDetailArray);
    [allUserDetailArray writeToFile:strPath atomically:YES];
    
}

@end
