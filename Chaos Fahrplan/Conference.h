//
//  Conference.h
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

#import <Foundation/Foundation.h>

@interface Conference : NSObject {
    NSString *title;
    NSString *subtitle;
    NSString *venue;
    NSString *city;
    NSString *start;
    NSString *end;
    NSString *days;
    NSString *release;
    NSString *day_change;
    NSString *timeslot_duration;
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, retain) NSString *venue;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *start;
@property (nonatomic, retain) NSString *end;
@property (nonatomic, retain) NSString *days;
@property (nonatomic, retain) NSString *release;
@property (nonatomic, retain) NSString *day_change;
@property (nonatomic, retain) NSString *timeslot_duration;

@end
