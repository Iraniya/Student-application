//
//  SignUp.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SignUp.h"
#import "MyCell.h"
#import "HomeViewController.h"
#import "NSString+Utility.h"

@interface SignUp ()
@end
@implementation SignUp
{
    AppDelegate *appDelegateObject;
}

@synthesize userDetailArray;  //user detail array
@synthesize userDetailDictionary; //for current dictionary

#pragma mark - Initialization

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
    
    //allocation
    appDelegateObject=[[UIApplication sharedApplication]delegate];
    userDetailArray = [[NSMutableArray alloc]init];
    userDetailDictionary = [[NSMutableDictionary alloc]init];
    arrayList = [[NSMutableArray alloc]init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //storing previous data
    userDetailArray = [[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];
    
    
    //temp variable to count number of user already register
    int index = (int)userDetailArray.count;
    
    NSString *idString = [NSString stringWithFormat:@"%d",index+1];
    //stroing Id in Dictionary
    [userDetailDictionary setObject:idString forKey:@"Id"];
    
    
    arrayList = [NSMutableArray arrayWithObjects:idString,@"User Name",@"First Name",@"Last Name",@"Email Id",@"Password",@"Phone",@"Education",@"Address 1",@"Address 2", nil];
    
    educationArray = [NSArray arrayWithObjects:@"10th",@"12th",@"Graduation",@"Higher Education", nil];
    
    pickerObject.delegate=self;
    pickerObject.dataSource=self;
    pickerViewObject.hidden =true;
    
    //new Updates belows
    
    aryScreenData = [[self CreateSignUpDataArray]mutableCopy];
    
    //Navigation Methods
    
    
    [self navigationMethods];
}

#pragma mark - Navigation
-(void)navigationMethods
{
    self.navigationController.navigationBarHidden = false;
    self.navigationItem.title = @"Sign Up";
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(donePressed:)];
    self.navigationItem.rightBarButtonItem = btn;
    
}

-(void)donePressed: (id)sender
{
    
}

#pragma mark - TableView Methods
//===========  TableView Delegate methods starts here==========//////////

//number of section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //only one section
}

//number of rows in section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayList.count; //number of value to store in sign up

}

//title for section SignUP
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *str = @"Sign Up";
    return str;
}

//for each cell in table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creating cell object
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //if cell is nil (for 1st time without reusable)
    if (cell==nil) {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
        cell = (MyCell *)[arrayNib firstObject];
    }
    
    //to display placeholder in the textfield
    cell.textFieldObject.placeholder =[arrayList objectAtIndex:indexPath.row];
    
    //giving tag to each textfield from 1 to 10
    cell.textFieldObject.tag=indexPath.row+1;
    cell.textFieldObject.delegate =self;
    
    //if textfield is Id (user can't change)defaut new number
    if (cell.textFieldObject.tag ==1) {
        cell.textFieldObject.enabled=NO;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
////-----------table view methods end here----------------///////


#pragma mark - pickerView
//===============for iner picker view =========/////////

////======= methods for picker view starts here ======//////////

//only one compnent in picker view
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//for row in picker view
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return educationArray.count; // number of educaion catagory
}

//to show the value title in picker view
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [educationArray objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UITextField *tempTextField=(UITextField*)[tableViewObject viewWithTag:8];
    tempTextField.text=[educationArray objectAtIndex:row];
    
    //storing education details in dictionary
    [userDetailDictionary setObject:tempTextField.text forKey:@"Education"];
}

///-----------------Picker view methods ends here ----------//////////



//buttons for picker views

//done button
- (IBAction)pickerViewDoneBtnClick:(id)sender {
    pickerViewObject.hidden=true;
}
//-----------inner view ends here---------///




#pragma mark - textfield methods
//=========textfield methods start here=============///

//text field return
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//begin editing
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //if text field is id user can't edit
    if (textField.tag == 1) {
        textField.enabled =NO;
        return NO;
    }
    //if text field is education picker view will open and keyboad will hide
    if (textField.tag ==8) {
        [textField resignFirstResponder];
        pickerViewObject.hidden  =false;
        [self.view endEditing:YES];
        return NO;
    }
    
    return YES;
}

//when textfield end edditing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //username
    if (textField.tag ==2) {
        [userDetailDictionary setObject:textField.text forKey:@"UserName"];
    }
    //first name
    else if (textField.tag==3){
        [userDetailDictionary setObject:textField.text forKey:@"FirstName"];
    }
    //last Name
    else if (textField.tag==4){
        [userDetailDictionary setObject:textField.text forKey:@"LastName"];
    }
    //Email Id
    else if (textField.tag==5){
        
        //tag 5 == email for email Verification tag 5 is email Id
        
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            
        BOOL isEmailValid = [emailTest evaluateWithObject:textField.text];
        //if user Enter Invalide email Id alert msg will pop Up
            if (isEmailValid == 0) {
                UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Valid emaild address" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                
                [alt show];
            }
            else{
                isEmailValid = YES;
                [userDetailDictionary setObject:textField.text forKey:@"EmailId"];
            }
    }
    //password
    else if (textField.tag==6){
        
        NSString *stricterFilterString = @"^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d$@$!%*?&]{12,20}";
        
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
        
        BOOL check= [passwordTest evaluateWithObject:textField.text];
        
        //If user Enter Invalid password
        if (check==0){
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter atlist 1 Number And 1 capital letter in Password lengh shoud be in range og 12 to 20" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alt show];
        }
        
        //if Lenght of password is less than 8 or gretter than 20
        if (textField.text.length<8 || textField.text.length>20){
            check =0;
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Pasword within rage of 12 to 20" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alt show];
            
        }
        if (check!=0) {
            [userDetailDictionary setObject:textField.text forKey:@"Password"];
        }
    }
    //Phone Number
    else if(textField.tag==7){
        BOOL IsPhoneNumber = NO;
            if (textField.text.length <=9 || textField.text.length >=11)
            {
                IsPhoneNumber = NO;
                UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Enter Valid Phone Number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alt show];
             }
            else{
                IsPhoneNumber = YES;
                [userDetailDictionary setObject:textField.text forKey:@"Phone"];
            }
    }
    //Education
    else if (textField.tag ==8){
        [userDetailDictionary setObject:textField.text forKey:@"Education"];
    }
    //Address 1
    else if (textField.tag==9){
        [userDetailDictionary setObject:textField.text forKey:@"Address1"];
    }
    //Address 2
    else if(textField.tag==10){
        [userDetailDictionary setObject:textField.text forKey:@"Address2"];
    }
    
}
/////------------- TextField methods ends here -----------/////



#pragma mark - Submit Button
//=====submit button start here ===========//////

//submit button - will store all the data of dictonary  in user default array and navigate user to profile page
- (IBAction)submitBtnClick:(id)sender {
    
  //  [userDetailArray addObject:userDetailDictionary];
    if (!userDetailArray) {
            userDetailArray=[[NSMutableArray alloc]
                         init];
            [userDetailArray addObject:userDetailDictionary];
    }
    else
        [userDetailArray addObject:userDetailDictionary];
    
    [self writeDataToPlistFile];
    
    // Get the standardUserDefaults object, store your user details data array against a key,and then synchronize the defaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userDetailArray forKey:@"AllSignUpDetails"];
    [userDefaults synchronize];
    
    //navigate to login page using tab bar object
    ViewController *viewControllerObject = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    //[self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController pushViewController:viewControllerObject animated:YES];

}


//================ plist data store and retrive ============///////

//retrive data from plist
#pragma mark - readToPlist
-(void)readDataFromPlist
{
    //for later
}

//store all uesr data in local databse
#pragma mark - writeToPlist
-(void)writeDataToPlistFile
{
    NSMutableArray *allUserDataArray = [[NSMutableArray alloc]init];
    
    NSString *strPath = [NSString getPathForFileName:@"StudentDetails" withFileType:@"plist"];
    NSLog(@"%@",strPath);
    allUserDataArray = [[NSMutableArray alloc] initWithContentsOfFile:strPath];
    
    [allUserDataArray addObject:userDetailArray];
    NSLog(@"alluserdata%@",allUserDataArray);
    [allUserDataArray writeToFile:strPath atomically:YES];
    
}

#pragma mark - ScreenSginUpArray

-(NSMutableArray*)CreateSignUpDataArray
{
    
    NSMutableArray *aryTemp = [NSMutableArray new];
    
    //Student Id
    NSMutableDictionary *dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //user Name
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //First Name
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //Last Name
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //Email Id
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //Password
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //Phone
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //Education
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"pickerView"];
    [aryTemp addObject:dictTemp];
    
    //address 1
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    //address 2
    dictTemp = [NSMutableDictionary new];
    [dictTemp setObject:@"" forKey:@"textFieldText"];
    [aryTemp addObject:dictTemp];
    
    return aryTemp;
//    
//    NSMutableArray *screenSignUpArray = [[NSMutableArray alloc]init];
//    [screenSignUpArray initWithObjects:@"Id",@"User Name",@"First Name",@"Last Name",@"Email Id",@"Password",@"Phone Number",@"Education",@"Address 1",@"Address 2", nil];
//    NSLog(@"%@",screenSignUpArray);
//    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





