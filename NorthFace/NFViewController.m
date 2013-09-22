//
//  NFViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/19/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFViewController.h"
#import "NFCollectionViewCell.h"

@interface NFViewController ()

@end

@implementation NFViewController
@synthesize products = _products;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  //load database
  NSString *path = [NFViewController bundlePathForFille:@"Products.plist"];
  self.products = [NSArray arrayWithContentsOfFile:path];
  
  // datasources
  self.collectionView.dataSource = self;
  self.pickerView.delegate = self;
  self.pickerView.dataSource = self;
  self.selectActivity.delegate = self;

  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark Actions
- (IBAction)onButtonPressed:(id)sender {
  
  self.startSelling.enabled = NO;
  self.startSelling.hidden = YES;
  self.selectActivity.hidden = NO;
  self.activityLabel.hidden = NO;
  
}
- (IBAction)selectActivityEditing:(id)sender {
  //self.pickerView.hidden = NO;

  
  
}

+ (NSString *) bundlePathForFille:(NSString *)fileName{
  
  NSString *path      = [[NSBundle mainBundle] bundlePath];
  NSString *finalPath = [path stringByAppendingPathComponent:fileName];
  
  return finalPath;
}

#pragma mark collectionView Data Source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  
  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
  return  [self.products count];

  
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *cellIdentifier = @"customCell";
  NFCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

  NSDictionary *product = [self.products objectAtIndex:indexPath.row];
  cell.productName.text = [product valueForKey:@"name"];
  UIImage *image = [UIImage imageNamed:[product valueForKey:@"url"]];
  
  cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
  cell.productImage.clipsToBounds = YES;
  [cell.productImage setImage:image];
  //[cell.productImage.contentView addSubview:cell.productImage];
  return  cell;
}

#pragma mark picker view delegate & datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  
  return 1;
  
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  
  return [self.products count];
  
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  
  return [[self.products objectAtIndex:row] valueForKey:@"activity"];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  
  self.selectActivity.text = [[self.products objectAtIndex:row] valueForKey:@"activity"];
  pickerView.hidden = YES;
  self.selectActivity.hidden = NO;
  
}


#pragma mark textField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  self.pickerView.hidden = NO;
  textField.hidden = YES;

  return NO;
}

@end
