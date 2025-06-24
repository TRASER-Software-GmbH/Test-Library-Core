/// <summary>
/// TRASER Setup table for storing configuration settings
/// </summary>
table 5445557 "TRASER Setup"
{
    Caption = 'TRASER Setup';
    DataClassification = SystemMetadata;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        
        field(2; "Debug Mode Enabled"; Boolean)
        {
            Caption = 'Debug Mode Enabled';
            DataClassification = SystemMetadata;
        }
        
        field(3; "Company Prefix"; Code[10])
        {
            Caption = 'Company Prefix';
            DataClassification = SystemMetadata;
            InitValue = 'TR';
        }
        
        field(4; "Version"; Text[50])
        {
            Caption = 'Version';
            DataClassification = SystemMetadata;
            InitValue = '1.0.0';
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}