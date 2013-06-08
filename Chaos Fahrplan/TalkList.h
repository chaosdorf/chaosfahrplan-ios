//
//  TalkList.h
//  Chaos Fahrplan
//
//  Copyright (C) 2013  Gerrit Giehl <r4mp@chaosdorf.de>
//
//  This program is free software: you can redistribute it and/or modify it under
//  the terms of the GNU General Public License as published by the Free Software
//  Foundation, either version 3 of the License, or (at your option) any later
//  version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
//  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
//  details.
//
//  You should have received a copy of the GNU General Public License along with
//  this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <UIKit/UIKit.h>
#import "TalkCell.h"
#import "TalkListNavigation.h"
#import "Information.h"

@interface TalkList : UITableViewController

@property (strong, nonatomic) NSMutableArray *mArrEvents;

- (void)editingButtonPressed:(id)sender;
- (void)showInfoView:(id)sender;
- (void)refreshTalkList:(id)sender;

@end
