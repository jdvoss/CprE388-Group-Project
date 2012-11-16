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
    self.games = [defaults objectForKey:@"games"];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { /*
    if ([segue.identifier isEqualToString:@"wordChain"]) {
        WordChainViewController* wcvc = (WordChainViewController*)[segue destinationViewController];
        if (sender != nil)
            wcvc.game = sender;
        
        [self presentViewController:wcvc animated:YES completion:nil]; 
    } */
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
    cell.textLabel.text = [(Game*)[self.games objectAtIndex:indexPath.row] partner] ;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* gameID = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    for (Game* game in self.games) {
        if ([game.partner isEqualToString:gameID])
            [self performSegueWithIdentifier:@"wordChain" sender:game];
    }
}

- (IBAction)newGame:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"wordChain" sender:nil];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    
}
@end
