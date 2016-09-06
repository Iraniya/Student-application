//
//  AboutUsViewController.m
//  Student
//
//  Created by agile on 19/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

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
    
    //navigation
    self.navigationItem.title=@"About As";
    
    [self loadWebView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebView methods

//loading Web view
 -(void)loadWebView
{
    //urls string
    NSString *urlString = @"http://www.google.com";
    
    //passing url string to nsurl
    NSURL *urlLink = [[NSURL alloc]initWithString:urlString];
    
    //requesting url
    NSURLRequest *objRequest = [[NSURLRequest alloc]initWithURL:urlLink] ;
    
    aboutAsWebViewObject.delegate =self;
    
    [aboutAsWebViewObject loadRequest:objRequest];
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    NSLog(@"didFailLoadWithError %@",error.description);
}

@end
