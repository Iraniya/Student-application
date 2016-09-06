//
//  ViewController.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ViewController.h"
#import "SignUp.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "StudentData.h"

@interface ViewController ()
@end

@implementation ViewController
{
    AppDelegate *appDelegateObject;
}

@synthesize EmailIdTextField,PasswordTextField;

#pragma mark - View methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Navigation Methods call (Bar property)
    [self NavigationProperty];
    
    //Scroll View settings
    [self ScrollViewMethods];
    
    //NSUserDefaults use
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    UserSignUpData =[[NSMutableArray alloc]init];
    UserSignUpData =[[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];
    NSLog(@"all user details%@",UserSignUpData);
}

#pragma mark - Navigation Bar Methods
-(void)NavigationProperty
{
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - ScrollView Methods
-(void)ScrollViewMethods
{
    //setting context size for sroll view
    [scrollViewObject setContentSize:CGSizeMake(320, 650)];
    [self.view addSubview:scrollViewObject];
    
    //Not Working
    //scrollViewObject.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    //scrollViewObject.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    
}

#pragma mark - TextField methods
//=========== Textfield methods Starts ============//

//for scrollRect to visible
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag>0){
        [scrollViewObject scrollRectToVisible:CGRectMake(textField.frame.origin.x, textField.frame.origin.y+310, textField.frame.size.width, textField.frame.size.height) animated:YES];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//---------------- TextField methods ends here-----------------//


#pragma mark - SignUp Button

//For signUp button
- (IBAction)signUpBtnClick:(id)sender {
    
    SignUp *signUpObject = [[SignUp alloc]initWithNibName:@"SignUp" bundle:nil];
    [self.navigationController pushViewController:signUpObject animated:YES];
    
}

#pragma mark - Signin Button

//For sign In button
- (IBAction)signInBtnClick:(id)sender {

    //Flag to check signIn status
    //if signIn = Yes allow else if SignIn = NO don't allow default NO
    isSignIn = NO;
    
    
    NSString *email = EmailIdTextField.text;
    NSString *password = PasswordTextField.text;
    
    
    isSignIn =[self checkEmailPassword:email andPasswordIs:password];
    
    if (isSignIn) {
        appDelegateObject = (AppDelegate *)[[UIApplication sharedApplication] delegate];
       [[appDelegateObject window]addSubview:[[appDelegateObject tabBarControllerObject]view]];
        
        //[appDelegateObject.window setRootViewController:appDelegateObject.tabBarControllerObject];
    }
    else{
        
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View"message:@"Please enter valid username or Password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alt show];
    }
}


//modify later to store userdata using plist or local database
/*
-(void)storeUserData
{
    
}
*/

#pragma mark - dataVarification
//check if user enter correct email password if enter correct data store his/her data in user defauls 
-(BOOL)checkEmailPassword :(NSString*)emailId andPasswordIs:(NSString*)password
{
    
    int numOfusers = (int)UserSignUpData.count;
    
    for (int i=0; i<numOfusers; i++){
        
        BOOL isEmailIdMatch = NO;
        BOOL isPasswordMatch= NO;
        
        //temp dictinary
        NSMutableDictionary *tempDict=[UserSignUpData objectAtIndex:i];
        NSLog(@"userdata %@",UserSignUpData);
        NSString *storeEmail=[tempDict valueForKey:@"EmailId"];
        NSString *storePassword=[tempDict valueForKey:@"Password"];
        
        isEmailIdMatch  = [emailId isEqualToString:storeEmail];
        isPasswordMatch = [password isEqualToString:storePassword];
        
        //if email id match with exsisting email id
        if (isEmailIdMatch && isPasswordMatch)
        {
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:tempDict forKey:@"CurrentUserDetail"];
            [userDefaults setObject:[NSString stringWithFormat:@"%d",numOfusers+1] forKey:@"CurrentUserId"];
            [userDefaults synchronize];
            return YES;
            
        }
        
    }
    
    return NO;
    
}

#pragma mark - SettingProperty
//setting textField
-(void)settingTextFieldproperty

{
    //setting placeholer for textfield
    EmailIdTextField.placeholder = @"EMAIL ID";
    PasswordTextField.placeholder= @"PASSWORD";
    
}


#pragma mark - gettingUserData
-(void)gettingUserData
{
    //storing previous signUp data from userDefault to UserSignUpdataArray
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    UserSignUpData = [[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];
    
}


@end
