//
//  AddSemesterViewController.m
//  Student
//
//  Created by agile on 02/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "AddSemesterViewController.h"
#import "enterSemesterDetailsViewController.h"

@interface AddSemesterViewController ()
@end

@implementation AddSemesterViewController

@synthesize SemesterDetailTextField,numOfSubjectTextField;

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
    
    //allocate 
  //  studentEducationDetailsArray = [[NSMutableArray alloc]init];
    
    [self navigationMethods];
    
}

#pragma mark - navigation Methods
-(void)navigationMethods
{
    self.navigationController.navigationBarHidden =false;
    self.navigationItem.title = @"Add Details";
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Cancle" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelPressed:)];
    //UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(donePressed:)];
    self.navigationItem.leftBarButtonItem =cancelBtn;
    //self.navigationItem.rightBarButtonItem =doneBtn;
}

//-(void)donePressed:(id)sender
//{
//
//}
-(void)cancelPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Submit Button

- (IBAction)enterSemesterBtn:(id)sender {
    
    NSInteger semesterNumber = [SemesterDetailTextField.text integerValue];
    NSInteger numberOfSubjects = [numOfSubjectTextField.text integerValue];
    
    enterSemesterDetailsViewController *enterSemesterDetailsViewControllerObject = [[enterSemesterDetailsViewController alloc]initWithNibName:@"enterSemesterDetailsViewController" bundle:nil];
    enterSemesterDetailsViewControllerObject.semesterNumber = semesterNumber;
    enterSemesterDetailsViewControllerObject.numnerOfSubjects=numberOfSubjects;
    [self.navigationController pushViewController:enterSemesterDetailsViewControllerObject animated:YES];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}

@end
