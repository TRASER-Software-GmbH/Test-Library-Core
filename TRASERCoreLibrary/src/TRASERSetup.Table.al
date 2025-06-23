/// <summary>
/// Setup table for TRASER Core Library configuration
/// </summary>
table 70001 "TRASER Setup"
{
    Caption = 'TRASER Setup';
    DataClassification = SystemMetadata;
    DrillDownPageId = "TRASER Setup";
    LookupPageId = "TRASER Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(10; "Debug Mode Enabled"; Boolean)
        {
            Caption = 'Debug Mode Enabled';
            DataClassification = SystemMetadata;
        }
        field(11; "Default Customer Prefix"; Code[10])
        {
            Caption = 'Default Customer Prefix';
            DataClassification = SystemMetadata;
            InitValue = 'TR-';
        }
        field(12; "Core Library Version"; Text[50])
        {
            Caption = 'Core Library Version';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(20; "Enable Integration Logs"; Boolean)
        {
            Caption = 'Enable Integration Logs';
            DataClassification = SystemMetadata;
        }
        field(21; "Log Retention Days"; Integer)
        {
            Caption = 'Log Retention Days';
            DataClassification = SystemMetadata;
            InitValue = 30;
            MinValue = 1;
            MaxValue = 365;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Core Library Version" := '1.0.0';
    end;

    trigger OnModify()
    begin
        "Core Library Version" := '1.0.0';
    end;

    /// <summary>
    /// Gets the singleton setup record, creating it if it doesn't exist
    /// </summary>
    /// <returns>TRASER Setup record</returns>
    procedure GetSetup(): Record "TRASER Setup"
    var
        TRASERSetup: Record "TRASER Setup";
    begin
        if not TRASERSetup.Get() then begin
            TRASERSetup.Init();
            TRASERSetup."Primary Key" := '';
            TRASERSetup.Insert(true);
        end;
        exit(TRASERSetup);
    end;
}