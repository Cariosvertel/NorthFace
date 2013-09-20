//
//  NFViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/19/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFViewController.h"
#import "NFDatabaseController.h"

@interface NFViewController ()

@end

@implementation NFViewController
@synthesize products = _products;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.products = [[NFDatabaseController alloc] init];

  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
