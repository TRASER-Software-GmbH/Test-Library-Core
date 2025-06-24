codeunit 5445557 "TRASER Hello World"
{
    procedure SayHello(): Text
    begin
        exit('Hello from TRASER Core Library!');
    end;

    procedure GetVersion(): Text
    begin
        exit('1.0.0.0');
    end;

    procedure TestBuildOrderJsonFix(): Text
    begin
        exit('Testing secret detection fix');
    end;
}