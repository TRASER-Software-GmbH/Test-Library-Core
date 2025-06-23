/// <summary>
/// Test codeunit for TRASER Core Utilities functionality
/// </summary>
codeunit 71001 "TRASER Core Utilities Test"
{
    Subtype = Test;

    [Test]
    procedure TestFormatTRASERText()
    var
        TRASERUtilities: Codeunit "TRASER Core Utilities";
        Result: Text;
    begin
        // [GIVEN] Input text
        // [WHEN] Formatting with TRASER prefix
        Result := TRASERUtilities.FormatTRASERText('Test Message');
        
        // [THEN] Text should be prefixed with TRASER
        Assert.AreEqual('TRASER: Test Message', Result, 'Text should be formatted with TRASER prefix');
    end;

    [Test]
    procedure TestValidateTRASERCustomerNo_ValidFormat()
    var
        TRASERUtilities: Codeunit "TRASER Core Utilities";
        IsValid: Boolean;
    begin
        // [GIVEN] Valid TRASER customer number format
        // [WHEN] Validating customer number
        IsValid := TRASERUtilities.ValidateTRASERCustomerNo('TR-123456');
        
        // [THEN] Validation should pass
        Assert.IsTrue(IsValid, 'Valid TRASER customer number should pass validation');
    end;

    [Test]
    procedure TestValidateTRASERCustomerNo_InvalidFormat()
    var
        TRASERUtilities: Codeunit "TRASER Core Utilities";
        IsValid: Boolean;
    begin
        // [GIVEN] Invalid TRASER customer number format
        // [WHEN] Validating customer number
        IsValid := TRASERUtilities.ValidateTRASERCustomerNo('INVALID123');
        
        // [THEN] Validation should fail
        Assert.IsFalse(IsValid, 'Invalid TRASER customer number should fail validation');
    end;

    [Test]
    procedure TestGetTRASERVersion()
    var
        TRASERUtilities: Codeunit "TRASER Core Utilities";
        Version: Text;
    begin
        // [GIVEN] TRASER Core Library
        // [WHEN] Getting version
        Version := TRASERUtilities.GetTRASERVersion();
        
        // [THEN] Version should be returned
        Assert.AreEqual('1.0.0', Version, 'Version should match expected format');
    end;
}