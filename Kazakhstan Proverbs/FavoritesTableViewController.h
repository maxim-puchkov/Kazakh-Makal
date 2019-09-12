//
//  FavoritesTableViewController.h
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-06-01.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesTableViewController : UITableViewController

@property (strong, nonatomic) NSUserDefaults *defaults;
@property (strong, nonatomic) NSArray *content;

@end
