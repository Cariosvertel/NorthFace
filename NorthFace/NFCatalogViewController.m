//
//  NFCatalogViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/26/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFCatalogViewController.h"

@interface NFCatalogViewController ()

@end

@implementation NFCatalogViewController

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
  
  //datasources & delegations
  self.sexLabel.delegate = self;
  self.collectionLabel.delegate = self;
  self.benefitsLabel.delegate = self;
  
  self.sexPickerView.delegate = self;
  self.sexPickerView.dataSource = self;
  self.collectionPickerView.delegate = self;
  self.collectionPickerView.dataSource = self;
  self.benefitsPickerView.delegate = self;
  self.benefitsPickerView.dataSource = self;
  
  
  
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;

  [self.collectionView reloadData];
  
  [self.sexPickerView reloadAllComponents];
  [self.collectionPickerView reloadAllComponents];
  [self.benefitsPickerView reloadAllComponents];
  
  
  //back button
  
  UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"< Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
  
  backButton.tintColor = [UIColor whiteColor];
  
  [self.navigationItem setLeftBarButtonItem:backButton];
  
}
-(void) backButtonPressed{
  
  [self.navigationController popToRootViewControllerAnimated:true];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark collectionView Delegate & Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  
  return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return [self.searcher.result count];
  
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
  static NSString *cellIdentifier = @"customCell";
  NFCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
  
  NSDictionary *product = [self.searcher.result objectAtIndex:indexPath.row];
  cell.productName.text = [product valueForKey:@"name"];
  UIImage *image = [UIImage imageNamed:[product valueForKey:@"url"]];
  
  cell.productImage.contentMode = UIViewContentModeScaleAspectFit;
  cell.productImage.clipsToBounds = YES;
  [cell.productImage setImage:image];
  
  return  cell;
}

#pragma mark segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
  const NSString *segueId = [segue identifier];
  
  //detail view
  if ([segueId isEqualToString:@"detailView"]) {
    NFDetailViewController *destViewController = [segue destinationViewController];
    destViewController.product = [self.searcher.result objectAtIndex:[[[self.collectionView indexPathsForSelectedItems] objectAtIndex:0] row]];
    destViewController.products = self.searcher.data;
    
  }
  
}

#pragma mark Sexo UIpikerView Delegate & Datasources
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  
  return 1;
  
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  //sex pickerView
  if ([pickerView isEqual:self.sexPickerView]) {
    return ([[[self.questions objectAtIndex:2] answers] objectAtIndex:row]);
  }
  
  //collection pickerView
  if ([pickerView isEqual:self.collectionPickerView]) {
    return ([[[self.questions objectAtIndex:0] answers] objectAtIndex:row]);
  }
  
  //benefits pickerView
  if ([pickerView isEqual:self.benefitsPickerView]) {
    return ([[[self.questions objectAtIndex:1] answers] objectAtIndex:row]);
  }
  
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  
  // sex pickerVIew
  if ([pickerView isEqual:self.sexPickerView]) {
    NSArray *answers = [[self.questions objectAtIndex:2] answers];
    self.sexLabel.text = [answers objectAtIndex:row];
    pickerView.hidden = YES;
    self.sexLabel.hidden = NO;
  }
  
  //collection pickerView
  if ([pickerView isEqual:self.collectionPickerView]) {
    NSArray *answers = [[self.questions objectAtIndex:0] answers];
    self.collectionLabel.text = [answers objectAtIndex:row];
    pickerView.hidden = YES;
    self.collectionLabel.hidden = NO;
  }
  
  // benefits pickerview
  if ([pickerView isEqual:self.benefitsPickerView]) {
    NSArray *answers = [[self.questions objectAtIndex:1] answers];
    self.benefitsLabel.text = [answers objectAtIndex:row];
    pickerView.hidden = YES;
    self.benefitsLabel.hidden = NO;
  }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  
  //sex pixkerView
  if ([pickerView isEqual:self.sexPickerView]) {
    return ([[[self.questions objectAtIndex:2] answers] count]);
  }
  
  //collection pickerView
  if ([pickerView isEqual:self.collectionPickerView]) {
    return ([[[self.questions objectAtIndex:0] answers] count]);
  }
  
  //benefits pickerView
  if ([pickerView isEqual:self.benefitsPickerView]) {
    return ([[[self.questions objectAtIndex:1] answers] count]);
  }
  
}

#pragma mark UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  
  // Sex textField
  if ([textField isEqual:self.sexLabel]) {
    self.sexPickerView.hidden = NO;
    textField.hidden = YES;
  }
  
  // collection TexField
  if ([textField isEqual:self.collectionLabel]) {
    self.collectionPickerView.hidden = NO;
    textField.hidden = YES;
  }
  // benefits TextField
  if ([textField isEqual:self.benefitsLabel]) {
    self.benefitsPickerView.hidden = NO;
    textField.hidden = YES;
  }
  
  return NO;
}







@end
