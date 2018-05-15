#import "KeychainHelper.h"

@implementation KeychainHelper

- (void) setupKeychainWithServiceName:(CDVInvokedUrlCommand *) command{

    NSString *serviceName = [command.arguments objectAtIndex:0];
    keychain = [UICKeyChainStore keyChainStoreWithService:serviceName];
    NSLog(@"[SampleIOSPlugin]: Keychain setup with service name %@",serviceName);

}

- (void) saveValueInKeychain: (CDVInvokedUrlCommand *) command {

    [self.commandDelegate runInBackground:^{

        NSString *key = [command.arguments objectAtIndex:0];
        NSString *value = [command.arguments objectAtIndex:1];
        CDVPluginResult* pluginResult = nil;

        if([command.arguments count] >= 2){
            NSError *error;
            [keychain setString:value forKey:key error:&error];
            if (error) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
            }else{
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            }
        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:@"incorrect number of arguments for saveValueInKeychain"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getValueFromKeychain: (CDVInvokedUrlCommand *) command{

    [self.commandDelegate runInBackground:^{

        NSString *key = [command.arguments objectAtIndex:0];
        CDVPluginResult* pluginResult = nil;

        if([command.arguments count] >= 1){
            NSError *error;
            NSString *result = [keychain stringForKey:key error:&error];
            if (error) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
            }else{
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString :result];
            }
        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:@"incorrect number of arguments for getValueFromKeychain"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getAllKeysFromKeychain: (CDVInvokedUrlCommand *) command{

    [self.commandDelegate runInBackground:^{

        NSArray *items = keychain.allKeys;

        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:items];

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    }];
}

- (void) removeValueFromKeychain: (CDVInvokedUrlCommand *) command{
    [self.commandDelegate runInBackground:^{
        
        NSString *key = [command.arguments objectAtIndex:0];
        CDVPluginResult* pluginResult = nil;
        
        if([command.arguments count] >= 1){
            NSError *error;
            [keychain removeItemForKey:key error:&error];
            if (error) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[error localizedDescription]];
            }else{
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            }
        }
        else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:@"incorrect number of arguments for getValueFromKeychain"];
        }
        
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) getAllItemsFromKeychain: (CDVInvokedUrlCommand *) command{

    [self.commandDelegate runInBackground:^{

      NSArray *items = keychain.allItems;

      CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:items];

      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

    }];
}

@end
