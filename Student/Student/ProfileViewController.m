//
//  ProfileViewController.m
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ProfileViewController.h"
#import "ViewController.h"
#import "SignUp.h"
#import "MyCell.h"
#import "HomeViewController.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize userDetailArray;  //user detail array
@synthesize currentUserDetailsDict; //current user Details
@synthesize currentUserDetailArray; //store current user details in array
@synthesize userDetailDictionary,keyArray;

#pragma mark - view Methods

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
    
    isEdit = NO;
    
    keyArray = [[NSArray alloc]initWithObjects:@"Id",@"UserName",@"FirstName",@"LastName",@"EmailId",@"Password",@"Phone",@"Education",@"Address1",@"Address2", nil];
    
    //To display image in circular 
    self.profileImageView.layer.cornerRadius =self.profileImageView.frame.size.width/2;
    self.profileImageView.clipsToBounds =YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    // Do any additional setup after loading the view from its nib.
    
    userDetailArray = [[NSMutableArray alloc]init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //to store all data in userDetailsArray
    userDetailArray = [[userDefaults objectForKey:@"AllSignUpDetails"]mutableCopy];

    
    //to store current user details from userdefault
    currentUserDetailsDict = [[NSMutableDictionary alloc]init];
    currentUserDetailsDict = [[ userDefaults objectForKey:@"CurrentUserDetail"]mutableCopy];
    
    currentUserDetailArray = [[NSMutableArray alloc]init];
    currentUserDetailArray = [NSMutableArray arrayWithObjects:
        [currentUserDetailsDict objectForKey:@"Id" ],
        [currentUserDetailsDict objectForKey:@"UserName"],
        [currentUserDetailsDict objectForKey:@"FirstName"],
        [currentUserDetailsDict objectForKey:@"LastName"],
        [currentUserDetailsDict objectForKey:@"EmailId"],
        [currentUserDetailsDict objectForKey:@"Password"],
        [currentUserDetailsDict objectForKey:@"Phone"],
        [currentUserDetailsDict objectForKey:@"Education"],
        [currentUserDetailsDict objectForKey:@"Address1"],
        [currentUserDetailsDict objectForKey:@"Address2"],nil];
    
    
    //user id in string
    NSString *userIdString = [[userDefaults objectForKey:@"CurrentUserId"]mutableCopy];
    
    //user id in int
    userId = [userIdString intValue];
    
    arrayList = [[NSMutableArray alloc]init];
    arrayList = [NSMutableArray arrayWithObjects:userIdString,@"UserName",@"First Name",@"Last Name",@"Email Id",@"Password",@"Phone",@"Education",@"Address 1",@"Address 2", nil];
    educationArray = [NSArray arrayWithObjects:@"10th",@"12th",@"Graduation",@"Higher Education", nil];
    
    pickerObject.delegate=self;
    pickerObject.dataSource=self;
    pickerViewObject.hidden =true;
    
    self.navigationItem.title=[NSString stringWithFormat:@"%@ Profile",[currentUserDetailsDict objectForKey:@"UserName"]];
    
}

#pragma mark - Table View Methods
//==========table View methods start here ============////////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayList.count;
    
}

/*
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *str = @"Profile";
    return str;
}
*/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creating cell object
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
        cell = (MyCell *)[arrayNib firstObject];
    }
    
    //NSString *placeholder
    //cell.textFieldObject.placeholder =[arrayList objectAtIndex:indexPath.row];
    cell.textFieldObject.text = [currentUserDetailsDict objectForKey:[keyArray objectAtIndex:indexPath.row]];
   
   // cell.textFieldObject.text = [currentUserDetailArray objectAtIndex:indexPath.row];
    cell.textFieldObject.tag=indexPath.row+1;
    cell.textFieldObject.delegate =self;
    
    
    if (cell.textFieldObject.tag ==1) {
        cell.textFieldObject.enabled=NO;
    }
    if (cell.textFieldObject.tag==6) {
        [cell.textFieldObject setSecureTextEntry:YES];
    }
    if (isEdit) {
        cell.textFieldObject.enabled=YES;
    }
    else
        cell.textFieldObject.enabled =NO;
    
    return cell;
}
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textFieldObject.tag=indexPath.row+1;
    if (!isEdit) {
        cell.textFieldObject.enabled = NO;
    }
    
        
}
 */

//---------table view methods ends here -----------//////


#pragma mark - Picker View methods
//============methods for picker view start here =============///

//only one compnent in picker view
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//for row in picker view which is equal to number of element in education array
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return educationArray.count;
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
    [currentUserDetailsDict setObject:tempTextField.text forKey:@"Education"];
}

//---------   picker view methods ends here -------


//done button
- (IBAction)pickerViewDoneBtnClick:(id)sender {
    pickerViewObject.hidden=true;
}


#pragma mark - TextField Methods
//========textfield delegate methods start here ==========/////

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (textField.tag == 1) {
        textField.enabled =NO;
        return NO;
    }
    
   // if(isEdit){
    if (textField.tag ==8) {
        [textField resignFirstResponder];
        pickerViewObject.hidden  =false;
        return NO;
    }
    
      //  textField.enabled = YES;
      //  return YES;
    //}
//    else{
//        
//        textField.enabled = NO;
//        return NO;
//    }
    
    return YES;
}

//when textfield end edditing
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //username
    if (textField.tag ==2) {
        [currentUserDetailsDict setObject:textField.text forKey:@"UserName"];
    }
    //first name
    else if (textField.tag==3){
        [currentUserDetailsDict setObject:textField.text forKey:@"FirstName"];
    }
    //last Name
    else if (textField.tag==4){
        [currentUserDetailsDict setObject:textField.text forKey:@"LastName"];
    }
    //Email Id
    else if (textField.tag==5){
        
        //tag 5 == email for email Verification tag 5 is email Id
        
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        
        BOOL isEmailValid = [emailTest evaluateWithObject:textField.text];
        //if user Enter Invalide email Id alert msg will pop Up
        if (isEmailValid == 0) {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Valid emaild address" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            
            [alt show];
        }
        else{
            isEmailValid = YES;
            [currentUserDetailsDict setObject:textField.text forKey:@"EmailId"];
        }
    }
    //password
    else if (textField.tag==6){
        
        NSString *stricterFilterString = @"^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d$@$!%*?&]{12,20}";
        
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
        
        BOOL check= [passwordTest evaluateWithObject:textField.text];
        
        //If user Enter Invalid password
        if (check==0){
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter atlist 1 Number And 1 capital letter in Password lengh shoud be in range og 12 to 20" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
        }
        
        //if Lenght of password is less than 8 or gretter than 20
        if (textField.text.length<8 || textField.text.length>20){
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Pasword within rage of 12 to 20" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
            check =0;
        }
        if (check!=0) {
            [currentUserDetailsDict setObject:textField.text forKey:@"Password"];
        }
    }
    //Phone Number
    else if(textField.tag==7){
        BOOL IsPhoneNumber = NO;
        if (textField.text.length <=9 || textField.text.length >=11){
            
            IsPhoneNumber = NO;
            UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Enter Valid Phone Number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alt show];
        }
        else{
            IsPhoneNumber = YES;
            [currentUserDetailsDict setObject:textField.text forKey:@"Phone"];
        }
    }
    //Education
    else if (textField.tag ==8){
        [currentUserDetailsDict setObject:textField.text forKey:@"Education"];
    }
    //Address 1
    else if (textField.tag==9){
        [currentUserDetailsDict setObject:textField.text forKey:@"Address1"];
    }
    //Address 2
    else if(textField.tag==10){
        [currentUserDetailsDict setObject:textField.text forKey:@"Address2"];
    }
    
}



//---------- textfield methods ends here ----------///



//submit button - will store all the data of dictonary  in user default array and navigate user to profile page

- (IBAction)editBtnClick:(id)sender{
   
   
    if ([editbutton.titleLabel.text isEqual:@"Edit"]) {
        BOOL isPasswordMatch = YES;
        /*
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Confirmation" message:@"Please enter your Password:" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField * alertTextField = [alert textFieldAtIndex:0];
        alertTextField.keyboardType = UIKeyboardAppearanceDefault;
        [alertTextField setSecureTextEntry:YES];
        alertTextField.placeholder = @"Enter your Password";
        [alert show];
        
        NSString *tempPassword = [[alert textFieldAtIndex:0] text];

       isPasswordMatch= [tempPassword isEqual:[currentUserDetailsDict objectForKey:@"Password"]];
        */
        if (isPasswordMatch) {
            isEdit = YES;
            [editbutton setTitle:@"Submit" forState:UIControlStateNormal];
            [tableViewObject reloadData];
        }
    }
    else{
        
        isEdit = NO;
        [editbutton setTitle:@"Edit" forState:UIControlStateNormal];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:currentUserDetailsDict forKey:@"CurrentUserDetail"];
        
        
        [userDetailArray replaceObjectAtIndex:[[currentUserDetailsDict objectForKey:@"Id"] integerValue]-1 withObject:currentUserDetailsDict];
       
        [userDefaults setObject:userDetailArray forKey:@"AllSignUpDetails"];
        [userDefaults synchronize];
        [self viewDidLoad];
        [tableViewObject reloadData];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
