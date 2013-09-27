//
//  NFFullScreenViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/26/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFFullScreenViewController.h"

@interface NFFullScreenViewController ()

@end
@implementation NFFullScreenViewController

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
	// Do any additional setup after loading the view.
  
  UIImage *image = [UIImage imageNamed:[self.product valueForKey:@"url"]];;
  
  self.imageView.contentMode = UIViewContentModeScaleAspectFit;
  self.imageView.clipsToBounds = YES;
  [self.imageView setImage:image];
  
  
  //create back button
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
  
  backButton.tintColor = [UIColor whiteColor];
  
  [self.navigationItem setLeftBarButtonItem:backButton];
  
  
}
-(void) backButtonPressed{
  
  [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
