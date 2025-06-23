/// <summary>
/// Setup page for TRASER Core Library configuration
/// </summary>
page 70001 "TRASER Setup"
{
    Caption = 'TRASER Setup';
    PageType = Card;
    SourceTable = "TRASER Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Debug Mode Enabled"; Rec."Debug Mode Enabled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enable debug mode for additional logging and diagnostics';
                }
                field("Default Customer Prefix"; Rec."Default Customer Prefix")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default prefix for TRASER customer numbers';
                }
                field("Core Library Version"; Rec."Core Library Version")
                {
                    ApplicationArea = All;
                    ToolTip = 'Version of the TRASER Core Library';
                }
            }
            group(Integration)
            {
                Caption = 'Integration';
                
                field("Enable Integration Logs"; Rec."Enable Integration Logs")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enable logging for integration activities';
                }
                field("Log Retention Days"; Rec."Log Retention Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of days to retain integration logs';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Test Utilities")
            {
                Caption = 'Test Utilities';
                Image = TestFile;
                ApplicationArea = All;
                ToolTip = 'Test the TRASER core utility functions';
                
                trigger OnAction()
                var
                    TRASERUtilities: Codeunit "TRASER Core Utilities";
                    TestMessage: Text;
                begin
                    TestMessage := TRASERUtilities.FormatTRASERText('Core Library Test');
                    Message('Test result: %1\Version: %2', TestMessage, TRASERUtilities.GetTRASERVersion());
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec."Primary Key" := '';
            Rec.Insert(true);
        end;
    end;
}