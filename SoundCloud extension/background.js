//Метод, отвечающий за изменения на странице.
chrome.webNavigation.onHistoryStateUpdated.addListener(function(details){
    chrome.tabs.executeScript(null,{file:"contentScript.js"});
});

//Метод, позволяющий открывать popup только на странице soundcloud.
chrome.runtime.onInstalled.addListener(function() {
    chrome.declarativeContent.onPageChanged.removeRules(undefined, function() {
    chrome.declarativeContent.onPageChanged.addRules([{
        conditions: [new chrome.declarativeContent.PageStateMatcher({
            pageUrl: {hostEquals: 'soundcloud.com'},
        })
        ],
        actions: [new chrome.declarativeContent.ShowPageAction()]
    }]);
});
});