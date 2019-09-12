//
//  SelectedViewController.m
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-05-31.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import "SelectedViewController.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *proverb = [self.defaults objectForKey:@"SelectedCell"];
    NSLog(@"%@", proverb);
    NSString *original = [proverb[0] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    NSString *translation = [proverb[1] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    
    self.proverbTextView.text = [NSString stringWithFormat:@"%@\n\n%@", original, translation];
    
    self.favorite = NO;
    NSArray *favorites = [self.defaults objectForKey:@"favorites"];
    for (int i = 0; i < [favorites count]; i++) {
        if ([[favorites[i] componentsSeparatedByString:@" > "][0] isEqualToString:proverb[0]]) {
            NSLog(@"already in fav");
            [self.favoriteButton setTitle:@"Удалить из Любимых" forState:UIControlStateNormal];
            self.favorite = YES;
        }
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.png"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    
    self.proverbTextView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)favoriteButtonPressed:(id)sender {    
    NSArray *proverb = [self.defaults objectForKey:@"SelectedCell"];
    NSMutableArray *addToFavorites = [[NSMutableArray alloc] init];
    addToFavorites = [[self.defaults objectForKey:@"favorites"] mutableCopy];
    if (addToFavorites == nil) {
        addToFavorites = [[NSMutableArray alloc] init];
    }
    NSArray *favorites;
    NSString *currentObject = [NSString stringWithFormat:@"%@ > %@", proverb[0], proverb[1]];
    
    if (self.favorite) {
        // delete from favorites
        NSLog(@"deleting");
        [addToFavorites removeObject:currentObject];
        [self.favoriteButton setTitle:@"Добавить в Любимые" forState:UIControlStateNormal];
        self.favorite = NO;
    } else {
        // add to favorites
        NSLog(@"adding");
        [addToFavorites addObject:currentObject];
        [self.favoriteButton setTitle:@"Удалить из Любимых" forState:UIControlStateNormal];
        self.favorite = YES;
    }
    
    favorites = [addToFavorites sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self.defaults setObject:favorites forKey:@"favorites"];
    [self.defaults synchronize];
    NSLog(@"%@", [self.defaults objectForKey:@"favorites"]);
}

@end
