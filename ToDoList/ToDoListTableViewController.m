//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by ITHS on 2016-02-12.
//  Copyright © 2016 Kozue Wendén. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"

@interface ToDoListTableViewController ()


@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell" forIndexPath:indexPath];
    
    cell.textLabel.text=[self.list[indexPath.row]objectForKey:@"text"];
    if ([[self.list[indexPath.row]objectForKey:@"importance"] isEqualToString:@"yes"]) {
         cell.backgroundColor=[UIColor colorWithRed:200/255.f green:34/255.f blue:12/255.f alpha:0.5];
    }
   
    
    return cell;
}

-(NSArray*)list{
    if(!_list){
        _list = [[NSMutableArray alloc]init];
    }
    return _list;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}*/



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showList"]) {
        
        UIViewController *destination = [segue destinationViewController];
        destination.title=@"show detail";
        
        UITableViewCell *cell = sender;
    
        int row = (int)[self.tableView indexPathForCell:cell].row;
        
        DetailViewController *detailViewController =[segue destinationViewController];
        detailViewController.list = self.list;
        detailViewController.row = row;
        
        
    }else if ([segue.identifier isEqualToString:@"addList"]){
        AddViewController *addViewController =[segue destinationViewController];
        addViewController.list = self.list;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [self.list removeObjectAtIndex:indexPath.row];
    // Request table view to reload
    [tableView reloadData];
}




@end
