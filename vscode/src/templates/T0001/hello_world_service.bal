import ballerina/http;
import ballerina/log;

// By default, Ballerina exposes an HTTP service via HTTP/1.1.
service hello on new http:Listener(${listenerPort}) {

    // Resource functions are invoked with the HTTP caller and the
    // incoming request as arguments.
    resource function sayHello(http:Caller caller, http:Request req) {
        // Sends a response back to the caller.
        var result = caller->respond("${message}");
        // Logs the `error` in case of a failure.
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }
}
