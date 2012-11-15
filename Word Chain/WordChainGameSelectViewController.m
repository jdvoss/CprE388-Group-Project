//
//  WordChainGameSelectViewController.m
//  Word Chain
//
//  Created by Jamison Voss on 11/15/12.
//  Copyright (c) 2012 Jamison Voss. All rights reserved.
//

#import "WordChainGameSelectViewController.h"

@interface WordChainGameSelectViewController ()

@end

@implementation WordChainGameSelectViewController

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 320, 400) style:UITableViewStyleGrouped];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    self.games = [defaults arrayForKey:@"games"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return self.games.count;
    else
        return 0;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = (NSString*)[self.games objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)newGame:(UIBarButtonItem *)sender {
    
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    self presentViewController:<#(UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>
}
@end
