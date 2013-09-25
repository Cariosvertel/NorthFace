//
//  NFViewController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/19/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFViewController.h"
#import "NFCollectionViewCell.h"
#import "NFQuestion.h"
#import "NFAsker.h"

@interface NFViewController ()

@end

@implementation NFViewController
@synthesize asker = _asker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  //load database
  NSString *path = [NFViewController bundlePathForFille:@"Products.plist"];
  self.searcher = [[NFSearcher alloc]initWithData: [NSArray arrayWithContentsOfFile:path]];
  self.NumberOfProductsLabel.text = [NSString stringWithFormat:@"%i",[self.searcher.result count]];
  

  
  
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
  
  NSArray *questionsString = [NSArray arrayWithObjects:
                        @"Que actividad practicas", //question 1
                        @"Que beneficios esperas", // question 2
                        @"Que genero eres", // question 3
                        nil ];
  NSArray *questionsTag = [NSArray arrayWithObjects:@"activity", @"benefits", @"category", nil];
  
  //create questions obj
  NFAsker *asker = [[NFAsker alloc] init]; //asker
  for (int i = 0; i<[questionsString count]; i++) {
    [asker addQuestion:[[NFQuestion alloc] initWithQuestion:[questionsString objectAtIndex:i]]];
    [asker questionAtIndex:i].tag  = [questionsTag objectAtIndex:i];
  }

  //add possible answers
  for (int i = 0; i<[self.searcher.result count]; i++) {
    [[asker questionAtIndex:0] addPossibleAnswer:[[self.searcher.result objectAtIndex:i] valueForKey:@"activity"]];
    [[asker questionAtIndex:1] addPossibleAnswer:[[self.searcher.result objectAtIndex:i] valueForKey:@"benefits"]];
    [[asker questionAtIndex:2] addPossibleAnswer:[[self.searcher.result objectAtIndex:i] valueForKey:@"category"]];
    
  }
  self.asker = asker;
  [self showQuestionFromAsker];

}

- (IBAction)nextButtonPressed:(id)sender {
  
  [self.asker addAnswerForCurrentQuestion:self.selectActivity.text]; //save answer
  //make query
  [self.searcher search:self.asker.answers];
  [self.collectionView reloadData]; // reload database
  self.NumberOfProductsLabel.text = [NSString stringWithFormat:@"%i",[self.searcher.result count]]; // number of items
  if (self.asker.currentIndex<2) {
    [self.asker incrementQuestion];
    [self showQuestionFromAsker];
  } else {
    self.nextButton.hidden = YES;
    self.nextButton.enabled = NO;
  }
  
  
}

- (IBAction)finishButtonPressed:(id)sender {

  
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
  
  return  [self.searcher.result count];

  
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

#pragma mark picker view delegate & datasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  
  return 1;
  
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
  NSMutableArray *answers = [[self.asker.questions objectAtIndex:self.asker.currentIndex] answers];
  int numberOfRows = [answers count];
  
  return numberOfRows;
  
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  NSMutableArray *answers = [[self.asker.questions objectAtIndex:self.asker.currentIndex] answers];
  return [answers objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  
  NSMutableArray *answers = [[self.asker.questions objectAtIndex:self.asker.currentIndex] answers];
  self.selectActivity.text = [answers objectAtIndex:row];
  pickerView.hidden = YES;
  self.selectActivity.hidden = NO;
  
}


#pragma mark textField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  self.pickerView.hidden = NO;
  textField.hidden = YES;

  return NO;
}

#pragma mark Helpers

-(void) showQuestionFromAsker{
  
  
  switch (self.asker.currentIndex) {
    case 0: // question 1
      //set up UIControls questions #2
      
      self.questionLabel.text = [[self.asker questionAtIndex:self.asker.currentIndex] question];
      self.selectActivity.text = [[[self.asker questionAtIndex: self.asker.currentIndex] answers] objectAtIndex:1]; // show 1st possible answer
      
      //set up Uicontros question #1
      self.startSelling.hidden = YES;
      self.selectActivity.hidden = NO;
      self.questionLabel.hidden = NO;


      
      break;
    case 1: //question 2
      
      //set up UIControls questions #2
      self.questionLabel.text = [[self.asker questionAtIndex:self.asker.currentIndex] question];
      self.selectActivity.text = [[[self.asker questionAtIndex: self.asker.currentIndex] answers] objectAtIndex:1]; // show 1st possible answer
      
      break;
    case 2: //question 3
      self.questionLabel.text = [[self.asker questionAtIndex:self.asker.currentIndex] question];
      self.selectActivity.text = [[[self.asker questionAtIndex: self.asker.currentIndex] answers] objectAtIndex:1]; // show 1st possible answer
      //self.nextButton.hidden =true;

    case 3:
      
    default:
      break;
  }
  [self.pickerView reloadAllComponents];
  
}

@end
