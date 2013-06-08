//
//  XmlParser.m
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

#import "XmlParser.h"

@implementation XmlParser
@synthesize conference;
@synthesize schedule;

- (XmlParser *) initXmlParser {
    //[super init];
    conference = [[Conference alloc] init];
    return self;
}

- (id)getXmlFile:(NSString*)sYear language:(NSString*) sLanguage
{
    
    NSMutableString *msUrl = [[NSMutableString alloc] init];
    [msUrl appendFormat: @"http://events.ccc.de/congress/"];
    [msUrl appendFormat: sYear];
    [msUrl appendFormat: @"/Fahrplan/schedule.en.xml"];
    
    // url for the request
    NSURL* url = [NSURL URLWithString: msUrl];
    
    // the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 60];
    
    NSString *agentString = @"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1";
    
    [request setValue:agentString forHTTPHeaderField:@"User-Agent"];
    
    // send sync request
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    NSData* result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    if(error == nil)
    {
        return result;
    }
    else
    {
        return nil;
    }
    
    return nil;
}


- (void) getNode:(xmlNodePtr *)doc node:(xmlNodePtr *)node depth:(int *)iDepth
{
    xmlNodePtr cur_node = nil;
    NSString *sCurrentNodeName = [[NSString alloc] init]; // TODO: Klassenvariable?
    NSString *sParentNodeName = [[NSString alloc] init]; // TODO: Klassenvariable?
    NSString *sCurrentValue = [[NSString alloc] init]; // TODO: Klassenvariable?
    
    for (cur_node = node; cur_node; cur_node = cur_node->next)
    {
        sCurrentNodeName = [NSString stringWithUTF8String:(char *)cur_node->name];
        sParentNodeName = [NSString stringWithUTF8String:(char *)cur_node->parent->name];

        sCurrentValue = (char *)xmlNodeListGetString(doc, cur_node->children, 1) ? [NSString stringWithUTF8String:(char *)xmlNodeListGetString(doc, cur_node->children, 1)] : nil;
        
        if(![sCurrentNodeName isEqualToString:@"text"])
        {
            if([sParentNodeName isEqualToString:@"conference"])
            {
                [conference setValue:sCurrentValue forKey:sCurrentNodeName];
                //NSLog(@"%@", sCurrentValue);
                //NSLog(@"%@", [conference city]);
            }
            //NSLog(@"%@", sCurrentNodeName);
            //NSLog(@"%@", sParentNodeName);
            //NSLog(@"%i", iDepth);
        }
        
        [self getNode:doc node:cur_node->children depth: iDepth + 1];
    }
    
    iDepth--;
}

- (void) doParse:(NSData *)xml
{
    NSString *sXml = [[NSString alloc] initWithData:xml encoding:NSUTF8StringEncoding];
    
    xmlDocPtr doc = xmlParseMemory([sXml UTF8String], [sXml lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    
    if (doc == NULL)
	{
		NSLog(@"Unable to parse.");
		return;
    }
    
    xmlNodePtr root = xmlDocGetRootElement(doc);
    xmlNodePtr node = root->children;
    
    [self getNode:doc node:node depth:0];

}

@end
