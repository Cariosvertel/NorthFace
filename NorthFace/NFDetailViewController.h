//
//  NFDetailViewController.h
//  NorthFace
//
//  Created by Carlos Rios on 9/25/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NFDetailViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UITextView *specs;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UITextView *details;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockTitleLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *relacionadosLabel;
@property (strong, nonatomic) NSArray *products;
@property (nonatomic, strong) NSDictionary *product;
@property (nonatomic, strong) NSMutableArray *recommendations;
@end
