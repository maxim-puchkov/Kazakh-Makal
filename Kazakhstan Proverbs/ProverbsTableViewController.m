//
//  ProverbsTableViewController.m
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-05-20.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import "ProverbsTableViewController.h"
#import "STKColorAccessoryView.h"

@interface ProverbsTableViewController ()

@end

@implementation ProverbsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.content = [self readContentsOfFile:@"content" ofType:@"txt"];
    self.alphabet = [self readContentsOfFile:@"kazakh_alphabet" ofType:@"txt"];
    self.defaults = [NSUserDefaults standardUserDefaults];
    
    [self determineNumberOfSections:self.content];
    [self rowsInSectionWithInitialLetter:self.alphabet[0]];
    
    if ([self.tableView respondsToSelector:@selector(layoutMargins)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.png"]];
    self.tableView.backgroundView = imageView;
    
    // Question #1
    //
    // Вопрос №1
    
    // Array of type NSArray of objects of type NSString
    //
    // Массив типа NSArray объектов типа NSString
    NSArray *letters = @[@"в", @"у", @"и", @"п", @"х", @"т", @"е", @"я", @"т", @" "];
    // Array of type NSArray of 64-bit integers of type NSInteger
    //
    // Массив типа NSInteger 64-бит целочисленных номеров
    NSInteger order[10] = {0, 2, 5, 7, 9, 3, 6, 8, 1, 4};
    // Object of type NSString with value "" (It is not undefined/nil/null. Its value
    // is empty string.
    //
    // Объект типа NSString со значением "" (Это не undefined/nil/null. Его значение –
    // пустая строка
    NSString *result = @"";
    
    // Loop 'for' that will create variable 'i' with value of 0 and continue as long as
    // 'i' is less than length of letters array. Variable 'i' will increate by positive
    // 1 every time.
    //
    // Цикл 'for' который создаст переменную 'i' со значением 0 и продолжит выполнение
    // пока 'i' меньше, чем длина массива letters. Переменная 'i' будет возрастать на
    // 1 каждый раз.
    for (int i = 0; i < [letters count]; i++) {
        // Result will equal to current string result value and appended object of
        // type NSString from array of type NSArray named letters. The index of the
        // required object will be obtained by finding the right order from array of
        // type NSArray named order. It will then find value of type NSInteger at
        // position 'i' and find the right object of type NSString to append using
        // the value found. The loop will add only ONE symbol every time it runs.
        // Overall, all of the symbols from letters array will be added. They will
        // produce a word, sentence, or other type of message.
        //
        // Результат будет равен значению result и значению объекта типа NSString из
        // массива типа NSArray letters. Индекс необходимого объекта будет получен в
        // результате нахождения правильного порядка из массива типа NSArray order.
        // После этого найдется значение типа NSInteger на позиции 'i' и найдет
        // правильный объект типа NSString для прикрепления, используя найденное
        // знаение. Цикл будет добавлять только ОДИН символ при каждом выполнении.
        // После всего, все значения массива letters будут добавлены. Они составят
        // слово, предложение или другой тип сообщения.
        result = [result stringByAppendingString:letters[order[i]]];
    }
    
    // Objective-C alternative of print, writeln, etc.
    // Will print a message beginning with "Result:".
    // The rest of the message will be variable result created before.
    //
    // Альтернатива print, writeln и других комманд в Objective C
    // Напечатает сообщение, начинающееся с "Result:".
    // Конец сообщения будет определен значением переменной result, созданной ранее.
    NSLog(@"Result: %@", result);
    
    
    
    
    
    
    
    
    
    
    // Question #2
// Pragmatic argument
#pragma mark – Constants
// Define constant BOARD_WIDTH = 6
#define BOARD_WIDTH 6
// Define constant BOARD_HEIGHT = 10
#define BOARD_HEIGHT 10
// Pragmatic Argument
#pragma mark – Implementation
    // Two dimensional array of type NSInteger with sizes BOARD_HEIGHT and BOARD_WIDTH
    NSInteger board[BOARD_HEIGHT][BOARD_WIDTH];
    // Integer of type NSInteger with value 0
    NSInteger res = 0;
    // Loop 'for' as long as 'i' is less than BOARD_HEIGHT
    for (int i = 0; i < BOARD_HEIGHT; i++) {
        // Loop 'for as long as 'k' is less than BOARD_WIDTH
        for (int k = 0; k < BOARD_WIDTH; k++) {
            // Conditional statement that is true if 'i' does not equal zero
            if (i != 0) {
                // Set value of array board of type NSInteger to 5
                board[i][k] = 5;
            } else {
                // Set value of array board of type NSInteger to 0
                board[i][k] = 0;
            }
            // Conditional statement that is true if 'board[i][k]' does not equal 5
            if (board[i][k] != 5) {
                // Add value of 'board[i][k]' to variable 'res' of type NSInteger
                res += board[i][k];
            }
        }
    }
    // Switch statement for varaible 'res' of type NSInteger
    switch (res) {
        // If 'res' = 0 then set 'res' to 1. Stop executing 'switch' statement.
        case 0:
            res = 1;
            break;
        // If 'res' = 5 then set 'res' to 0. Stop executing 'switch' statement.
        case 5:
            res = 0;
            break;
        // If 'res' is neither 0 nor 5, set 'res' to 100.
        default:
            res = 100;
            break;
    }
    // Objective-C alternative of print, writeln, etc.
    // Will print a message beginning with "Result:".
    // The rest of the message will be variable 'res' created before.
    NSLog(@"Result: %li", (long)res);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:(0.20)
                     animations:^ {
                         self.tabBarController.tabBar.alpha = 1.0;
                     }];
    self.navigationController.navigationBar.topItem.title = @"Мақал";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self determineNumberOfSections:self.content] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    return [[self rowsInSectionWithInitialLetter:sectionTitles[section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    return sectionTitles[section];
}

- (NSArray *)readContentsOfFile:(NSString *)file ofType:(NSString *)type {
    NSString *resource = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSError *error;
    NSString *fileContent = [NSString stringWithContentsOfFile:resource encoding:NSUTF8StringEncoding error:&error];
    NSArray *content = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    return content;
}

- (NSArray *)determineNumberOfSections:(NSArray *)array {
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        NSString *letter;
        letter = [[array[i] substringToIndex:1] capitalizedString];
        if ([sections count] == 0) {
            [sections addObject:letter];
        } else {
            for (int k = 0; k < [sections count]; k++) {
                if ([sections[k] isEqualToString:letter]) {
                    break;
                }
                if (k == ([sections count] - 1)) {
                    [sections addObject:letter];
                }
            }
        }
    }
    NSArray *sectionsArray = [sections sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return sectionsArray;
}

- (NSArray *)rowsInSectionWithInitialLetter:(NSString *)letter {
    NSMutableArray *sort = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.content count]; i++) {
        if ([[[self.content[i] substringToIndex:1] capitalizedString] isEqualToString:letter]) {
            [sort addObject:self.content[i]];
        }
    }
    NSArray *rows = [sort sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if ([cell respondsToSelector:@selector(layoutMargins)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }
    
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    NSArray *rows = [self rowsInSectionWithInitialLetter:sectionTitles[indexPath.section]];

    NSArray *titles = [rows[indexPath.row] componentsSeparatedByString:@" > "];
    NSString *cellTitle = titles[0];
    NSString *detailTitle;
    if ([titles count] > 1) {
        detailTitle = titles[1];
    }
    
    cellTitle = [cellTitle stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];
    detailTitle = [detailTitle stringByReplacingOccurrencesOfString:@"\\n" withString:@" "];

    cell.textLabel.text = cellTitle;
    cell.detailTextLabel.text = detailTitle;
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryView = [STKColorAccessoryView accessoryViewWithColor:[UIColor blackColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellTitle = [cell.textLabel.text stringByReplacingOccurrencesOfString:@" " withString:@"\n"];
    NSString *detailTitle = [cell.detailTextLabel.text stringByReplacingOccurrencesOfString:@" " withString:@"\n"];
    
    NSArray *contentOfCell = @[cellTitle, detailTitle];
    [self.defaults setObject:contentOfCell forKey:@"SelectedCell"];
    [self.defaults synchronize];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [UIView animateWithDuration:(0.05)
                     animations:^ {
                         self.tabBarController.tabBar.alpha = 0.0;
                     }];
}

- (void) configureSlideLayer:(CALayer *)layer {
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOpacity = 0;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

@end
