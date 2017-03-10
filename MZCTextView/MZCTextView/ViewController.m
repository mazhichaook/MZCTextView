//
//  ViewController.m
//  MZCTextView
//
//  Created by Zhichao Ma on 2017/3/10.
//  Copyright © 2017年 Zhichao Ma. All rights reserved.
//

#import "ViewController.h"

#import "MZCTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MZCTextView *textView = [[MZCTextView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 300)];
    
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
    
    textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    textView.layer.borderColor = [UIColor blackColor].CGColor;
    
    textView.layer.borderWidth = 1;
    
    [self.view addSubview:textView];
    
    textView.placeholder = @"占位文字......";
    
    textView.placeHolderColor = [UIColor lightGrayColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
