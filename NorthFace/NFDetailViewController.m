//
//  NFDetailViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/25/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFDetailViewController.h"
#import "NFCollectionViewCell.h"

@interface NFDetailViewController ()

@end

@implementation NFDetailViewController
@synthesize product = _product;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
*/
- (void)viewDidLoad

{
    [super viewDidLoad];
  self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
  //random items
  int recomendItems = 5;
  self.recommendations = [[NSMutableArray alloc] init];
  for (int i=0; i<recomendItems; i++) {
    [self.recommendations addObject:[self.products objectAtIndex:arc4random_uniform([self.products count])]];
  }
  
  //load product details
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
	// Do any additional setup after loading the view.
  NSDictionary *product = self.product;
  UIImage *image = [UIImage imageNamed:[product valueForKey:@"url"]];
  self.specs.text = [product valueForKey:@"specs"];
  self.details.text = [product valueForKey:@"details"];
  self.name.text = [product valueForKey:@"name"];
  self.image.contentMode = UIViewContentModeScaleAspectFit;
  self.image.clipsToBounds = YES;
  [self.image setImage:image];
  

}
- (void)viewWillAppear:(BOOL)animated{
  
  [self.collectionView reloadData];
  
  
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark collectionView Datasource & Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  return 1;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
  return [self.recommendations count];
}
- (NFCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *cellIdentifier = @"customCell";
  NFCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  
  NSDictionary *product = [self.recommendations objectAtIndex:indexPath.row];
  cell.productName.text = [product valueForKey:@"name"];
  UIImage *image = [UIImage imageNamed:[product valueForKey:@"url"]];
  
  cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
  cell.productImage.clipsToBounds = YES;
  [cell.productImage setImage:image];
  
  return  cell;
}



@end
