//
//  NFCatalogViewController.h
//  NorthFace
//
//  Created by Carlos Rios on 9/26/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFSearcher.h"
#import "NFCollectionViewCell.h"
#import "NFDetailViewController.h"
#import "NFQuestion.h"
@interface NFCatalogViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate >
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NFSearcher *searcher;
@property (weak, nonatomic) IBOutlet UITextField *sexLabel;
@property (weak, nonatomic) IBOutlet UITextField *collectionLabel;
@property (weak, nonatomic) IBOutlet UITextField *benefitsLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *sexPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *collectionPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *benefitsPickerView;
@property (nonatomic, strong) NSArray *questions;
@end
