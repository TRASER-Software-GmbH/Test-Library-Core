codeunit 50100 "TRASER Hello World"
{
    procedure SayHello(): Text
    begin
        exit('Hello from TRASER Core Library!');
    end;

    procedure GetVersion(): Text
    begin
        exit('1.0.0.0');
    end;
}