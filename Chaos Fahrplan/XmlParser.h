//
//  XmlParser.h
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

#import <libxml/tree.h>
#import <libxml/parser.h>
#import <libxml/HTMLparser.h>
#import <libxml/xpath.h>
#import <libxml/xpathInternals.h>

#import "Conference.h"
#import "Schedule.h"

@class Conference;

@interface XmlParser : NSObject {
    Conference *conference;
    Schedule *schedule;
}

@property (nonatomic, retain) Conference *conference;
@property (nonatomic, retain) Schedule *schedule;

- (XmlParser *) initXmlParser;
- (id)getXmlFile:(NSString*)sYear language:(NSString*) sLanguage;
- (void) getNode:(xmlNodePtr *)doc node:(xmlNodePtr *)node depth:(int *)iDepth;
- (void) doParse:(NSData *)dataXml;

@end
