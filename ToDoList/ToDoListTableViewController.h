//
//  ToDoListTableViewController.h
//  ToDoList
//
//  Created by ITHS on 2016-02-12.
//  Copyright © 2016 Kozue Wendén. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController
@property (nonatomic)NSMutableArray *list;
-(void)save;
-(void)load;
@end
