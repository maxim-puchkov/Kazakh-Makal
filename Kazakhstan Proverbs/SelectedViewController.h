//
//  SelectedViewController.h
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-05-31.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import "ViewController.h"

@interface SelectedViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextView *proverbTextView;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong, nonatomic) NSUserDefaults *defaults;
@property BOOL favorite;

@end
