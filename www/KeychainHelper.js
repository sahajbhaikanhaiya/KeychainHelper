var exec = require('cordova/exec');

var PLUGIN_NAME = "KeychainHelper";

var KeychainHelper = {

    setupKeychainWithServiceName: function(serviceName){
        exec(null, null, PLUGIN_NAME, 'setupKeychainWithServiceName', [serviceName]);
    },

    saveValueInKeychain: function(success,failure,key,value){
        exec(success, failure, PLUGIN_NAME, 'saveValueInKeychain', [key,value]);
    },

    getValueFromKeychain: function(success,failure,key){
        exec(success, failure, PLUGIN_NAME, 'getValueFromKeychain', [key]);
    },

    getAllKeysFromKeychain: function(success){
        exec(success,null,PLUGIN_NAME,'getAllKeysFromKeychain',[]);
    },

    removeValueFromKeychain: function(success,failure,key){
        exec(success, failure, PLUGIN_NAME, 'removeValueFromKeychain', [key]);
    },

    getAllItemsFromKeychain: function(success){
        exec(success,null,PLUGIN_NAME,'getAllItemsFromKeychain',[]);
    }

};

module.exports = KeychainHelper;