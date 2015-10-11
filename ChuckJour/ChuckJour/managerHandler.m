//
//  managerHandler.m
//  ChuckJour
//
//  Created by Timothy J on 21/07/14.
//  Copyright (c) 2014 timothy j. All rights reserved.
//

#import "managerHandler.h"
//#import <iostream>

@implementation managerHandler

-(id)init{

    manager = [[OSCManager alloc]initWithServiceType:@"_osc._udp."];
        [manager setDelegate:self];

    
        [[NSDistributedNotificationCenter defaultCenter] addObserver: self
                                                selector :@selector(oscOutPortsChangedNotification:)
                                                    name :OSCOutPortsChangedNotification
                                                   object:nil];
    
        [[NSDistributedNotificationCenter defaultCenter] addObserver: self
                                                selector :@selector(oscOutPortsChangedNotification:)
                                                    name :OSCInPortsChangedNotification
                                                   object:nil];

    if (manager)NSLog(@"Manager Set Up");
    
    
    
    return self;
}

- (void)inPort:(NSString *) withName : (int) withPort{
    
    //[manager deleteAllInputs];
    [manager createNewInputForPort:withPort withLabel:withName];
   // if([manager.inPortArray objectAtIndex:[manager.inPortArray count]])NSLog(@"Setup in port %d",withPort);
    NSLog(@"number of inports == %lu",(unsigned long)[[manager inPortArray] count]);

    
}
- (void)setupManualOutPort{
    manualoutPort = [manager createNewOutputToAddress:@"127.0.0.1" atPort:[inPort port] withLabel:@"Manual Output"];
}

- (void)oscOutPortsChangedNotification:(NSNotification *)note{
    NSLog(@"Notification!!!");
}

- (void) receivedOSCMessage:(OSCMessage *)m	{
    NSLog(@"message!!!");
}

- (NSArray *) returnListOfOutputs{
    
    
    for (int i = 0; i < [manager.outPortArray count]; i++){
        OSCInPort *op = [manager.outPortArray objectAtIndex:i];
        NSLog(@"Outport Number %d is named %@ and attached to port %d", i, op.portLabel, op.port );
    }
    return [manager outPortArray];
}

- (NSArray *) returnListOfInputs{
    for (int i = 0; i < [manager.inPortArray count]; i++){
        OSCInPort *ip = [manager.inPortArray objectAtIndex:i];
        NSLog(@"Inport Number %d is named %@ and attached to port %d", i, ip.portLabel, ip.port );
    }
   // NSLog(@"number of inports == %lu",(unsigned long)[[manager inPortArray] count]);
    return [manager inPortArray];
    
}

- (int) returnOutport:(int) thePort{
    OSCOutPort *p = [[manager outPortArray] objectAtIndex:thePort];
    return p.port;
}

- (int) returnInport:(int) thePort{
    NSLog(@"number of inports == %lu",(unsigned long)[[manager inPortArray] count]);

    OSCInPort *p = [[manager inPortArray] objectAtIndex:thePort];
    return p.port;
}

- (NSString *) returnAddressString:(int)thePort{
    OSCOutPort *p = [[manager outPortArray] objectAtIndex:thePort];
    return p.addressString;
}

@end
