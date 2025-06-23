/// <summary>
/// Core utilities codeunit providing common functionality for TRASER applications
/// </summary>
codeunit 70001 "TRASER Core Utilities"
{
    Access = Public;

    /// <summary>
    /// Formats a text string with the TRASER standard format
    /// </summary>
    /// <param name="InputText">The text to format</param>
    /// <returns>Formatted text with TRASER prefix</returns>
    procedure FormatTRASERText(InputText: Text): Text
    begin
        exit('TRASER: ' + InputText);
    end;

    /// <summary>
    /// Validates a TRASER customer number format
    /// </summary>
    /// <param name="CustomerNo">Customer number to validate</param>
    /// <returns>True if valid TRASER customer number format</returns>
    procedure ValidateTRASERCustomerNo(CustomerNo: Code[20]): Boolean
    begin
        // TRASER customer number format: TR-NNNNNN
        exit(CustomerNo.StartsWith('TR-') and (StrLen(CustomerNo) = 9));
    end;

    /// <summary>
    /// Gets the current TRASER version information
    /// </summary>
    /// <returns>Version string in format Major.Minor.Build</returns>
    procedure GetTRASERVersion(): Text
    begin
        exit('1.0.0');
    end;

    /// <summary>
    /// Checks if TRASER debug mode is enabled
    /// </summary>
    /// <returns>True if debug mode is enabled</returns>
    procedure IsDebugModeEnabled(): Boolean
    var
        TRASERSetup: Record "TRASER Setup";
    begin
        if TRASERSetup.Get() then
            exit(TRASERSetup."Debug Mode Enabled");
        exit(false);
    end;
}