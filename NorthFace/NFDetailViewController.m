//
//  NFDetailViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/25/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFDetailViewController.h"
#import "NFCollectionViewCell.h"
#import "NFFullScreenViewController.h"


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
  [self.imageButton setBackgroundImage:image forState:UIControlStateNormal];
  self.specs.text = [product valueForKey:@"specs"];
  self.details.text = [product valueForKey:@"details"];
  self.name.text = [product valueForKey:@"name"];
 // self.stockLabel.text = [product valueForKey:@"stock"];
  self.priceLabel.text = [product valueForKey:@"price"];
  
  
  //Details Rounded border
  self.specs.layer.borderWidth = 1.0f; /* grosor del borde */
  self.specs.layer.cornerRadius = 10; /* radio de las esquinas redondeadas (opcional, claro)*/
  self.specs.layer.borderColor = [[UIColor redColor] CGColor]; /* color (opcional también) */
  //image Rounded border
  self.imageButton.layer.borderWidth = 1.0f; /* grosor del borde */
  self.imageButton.layer.cornerRadius = 10; /* radio de las esquinas redondeadas (opcional, claro)*/
  self.imageButton.layer.borderColor = [[UIColor redColor] CGColor]; /* color (opcional también) */
  // details  Rounded border
  self.details.layer.borderWidth = 1.0f; /* grosor del borde */
  self.details.layer.cornerRadius = 10; /* radio de las esquinas redondeadas (opcional, claro)*/
  self.details.layer.borderColor = [[UIColor redColor] CGColor]; /* color (opcional también) */

  //relaciondos Label
  [self.relacionadosLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"img10.png"]]];
  self.relacionadosLabel.layer.borderWidth = 1.0f; /* grosor del borde */
  self.relacionadosLabel.layer.cornerRadius = 10; /* radio de las esquinas redondeadas (opcional, claro)*/
  self.relacionadosLabel.layer.borderColor = [[UIColor redColor] CGColor]; /* color (opcional también) */

  //price label round
  [self.relacionadosLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"img10.png"]]];
  self.priceTitleLabel.layer.borderWidth = 1.0f; /* grosor del borde */
  self.priceTitleLabel.layer.cornerRadius = 10; /* radio de las esquinas redondeadas (opcional, claro)*/
  self.priceTitleLabel.layer.borderColor = [[UIColor redColor] CGColor]; /* color (opcional también) */

  
  
  //back button
  
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
  
  backButton.tintColor = [UIColor whiteColor];
  
  [self.navigationItem setLeftBarButtonItem:backButton];
  
  

}
- (void)viewWillAppear:(BOOL)animated{
  
  [self.collectionView reloadData];
  
}

-(void) backButtonPressed{
  
  [self.navigationController popToRootViewControllerAnimated:true];
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
#pragma mark Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
  if ([[segue identifier] isEqualToString:@"fullScreenImage"]) {
    NFFullScreenViewController *fvc = [segue destinationViewController];
    fvc.product = self.product;
  }
}



@end
