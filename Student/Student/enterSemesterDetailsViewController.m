//
//  enterSemesterDetailsViewController.m
//  Student
//
//  Created by agile on 02/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "enterSemesterDetailsViewController.h"
#import "HomeViewController.h"

//#import "StudentData.h"

@interface enterSemesterDetailsViewController ()

@end

@implementation enterSemesterDetailsViewController

@synthesize numnerOfSubjects,semesterNumber;

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
    
    //navigation
    self.navigationItem.title=@"Semester Details";
    
    // Do any additional setup after loading the view from its nib.
    [scrollViewObject setContentSize:CGSizeMake(320, 1000)];
    
    NSLog(@"number of Semester %ld",(long)semesterNumber);
    NSLog(@"number of subject %ld",(long)numnerOfSubjects);
    
    //[self SettingView];
    [self navigationMethods];
    
}

#pragma mark - Navigation
-(void)navigationMethods
{
    self.navigationController.navigationBarHidden = false;
    self.navigationItem.title = @"Education Details";
    UIBarButtonItem *cancleBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancle" style:UIBarButtonItemStyleBordered target:self action:@selector(canclePressed:)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(donePressed:)];
    self.navigationItem.rightBarButtonItem = doneBtn;
    self.navigationItem.leftBarButtonItem =cancleBtn;
}

-(void)canclePressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)donePressed: (id)sender
{
    
    //  StudentData *studentDataObject = [[ StudentData alloc]init];
    NSMutableDictionary *studentSemesterDetailsDict = [[NSMutableDictionary alloc]init];
    NSMutableArray *studentSubjectsArray = [[NSMutableArray alloc]init];
    for (int i=0; i<numnerOfSubjects; i++) {
        NSMutableDictionary *studentsMarksDictionary = [[NSMutableDictionary alloc]init];
        [studentsMarksDictionary setObject:MarksTextField.text forKey:SubjectTextField.text];
        [studentSubjectsArray addObject:studentsMarksDictionary];
    }
    
    [studentSemesterDetailsDict setObject:studentSubjectsArray forKey:[NSString stringWithFormat:@"Semester %ld",(long)semesterNumber]];
    NSLog(@"student sem %@",studentSemesterDetailsDict);
}

#pragma mark - Setting View
//=====setting scroll view ==========////

-(void)SettingView
{
    int count = (int)numnerOfSubjects;
    
    int xPos=40,yPos=100,height=40,width=100;
    for (int i=1; i<=count; i++)
    {
        SubjectTextField=[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        SubjectTextField.placeholder=[NSString stringWithFormat:@"Subject%d",i];
        
        SubjectTextField.delegate=self;
        SubjectTextField.tag =i+100;
        [scrollViewObject addSubview:SubjectTextField];
        xPos=xPos+width+20;
        
        MarksTextField=[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        MarksTextField.placeholder=[NSString stringWithFormat:@"Marks%d",i];
        MarksTextField.delegate=self;
        MarksTextField.tag =i+200;
        [scrollViewObject addSubview:MarksTextField];
        xPos=xPos+width+20;
        
        UILabel *outOfMarks=[[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [outOfMarks setText:@"/100"];
        [outOfMarks setTextColor:[UIColor whiteColor]];
        [scrollViewObject addSubview:outOfMarks];
        yPos=yPos+height+20;
        xPos=40;
    }
    
    
}

- (IBAction)submitBtnClick:(UIButton *)sender {
  //  StudentData *studentDataObject = [[ StudentData alloc]init];
    NSMutableDictionary *studentSemesterDetailsDict = [[NSMutableDictionary alloc]init];
    NSMutableArray *studentSubjectsArray = [[NSMutableArray alloc]init];
    for (int i=0; i<numnerOfSubjects; i++) {
        NSMutableDictionary *studentsMarksDictionary = [[NSMutableDictionary alloc]init];
        [studentsMarksDictionary setObject:MarksTextField.text forKey:SubjectTextField.text];
        [studentSubjectsArray addObject:studentsMarksDictionary];
    }
    
    [studentSemesterDetailsDict setObject:studentSubjectsArray forKey:[NSString stringWithFormat:@"Semester %ld",(long)semesterNumber]];
    NSLog(@"student sem %@",studentSemesterDetailsDict);
}

#pragma mark - TextField Delegate

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    for (int i=101; i<numnerOfSubjects+100+1; i++) {
        
        if (textField.tag== i) {
            marksDict = [[NSMutableDictionary alloc]init];
            [marksDict setObject:@"" forKey:textField.text];
        }
    }
    for (int i=201; i<numnerOfSubjects+200+1; i++) {
        NSArray *keyArray = [marksDict allKeys];
        NSLog(@"allkeys%@",keyArray);
        if (textField.tag== i) {
            [marksDict setObject:@"" forKey:[keyArray objectAtIndex:i-100]];
            subjectsArray = [[NSMutableArray alloc]init];
            
        }
    }
}
//for textfield return methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
