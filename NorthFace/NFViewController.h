//
//  NFViewController.h
//  NorthFace
//
//  Created by Carlos Rios on 9/19/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFAsker.h"
#import "NFSearcher.h"

@interface NFViewController : UIViewController <UICollectionViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIButton *startSelling;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UITextField *selectActivity;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *finishButton;
@property (strong, nonatomic) IBOutlet UILabel *NumberOfProductsLabel;
@property (strong, nonatomic) NFAsker * asker;
@property (strong, nonatomic) NFSearcher *searcher;

- (IBAction)onButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;
- (IBAction)finishButtonPressed:(id)sender;


- (void)activateQuestion:(NSInteger) questionNumber;
-(void) showQuestionFromAsker;
+ (NSString *) bundlePathForFille:(NSString *)fileName;

@end
