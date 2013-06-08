//
//  AppDelegate.h
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
#import "TalkList.h"
#import "TalkListNavigation.h"
#import "XmlParser.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) TalkListNavigation *navDayOne;
@property (strong, nonatomic) TalkListNavigation *navDayTwo;
@property (strong, nonatomic) TalkListNavigation *navDayThree;
@property (strong, nonatomic) TalkListNavigation *navDayFour;
@property (strong, nonatomic) TalkListNavigation *navFavorites;
@property (strong, nonatomic) XmlParser *xmlParser;

- (void)customizeAppearance;

@end
