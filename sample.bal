import ballerina/http;

configurable string db_host = ?;

configurable string name = ?;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!", "configurable-name": name, "db_host": db_host };
        return greetingMessage;
    }
}
