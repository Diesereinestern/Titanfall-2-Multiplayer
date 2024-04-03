Add-Type -AssemblyName PresentationFramework

# Define the environment variable name
[string] $titanfall = 'OPENSSL_ia32cap'
[string] $titanfallVal = '~0x200000200000000'
# Get the environment variables
$envvars = [System.Environment]::GetEnvironmentVariables()

# Check if the environment variable exists
if ($envvars.ContainsKey($titanfall)) {
    # Get the value of the environment variable
    $currentValue = [System.Environment]::GetEnvironmentVariable($titanfall)
    
    # Check if the value matches the expected value
    if ($currentValue -eq $titanfallVal) {
        [System.Windows.MessageBox]::Show("Everything is set up.", "Information", "OK")

    } else {
        # Display the current value and prompt the user to replace it
        $result = [System.Windows.MessageBox]::Show("Current value of the Titanfall Environment variable [$titanfall] is: $currentValue.`n- Press OK to correct it to the proper value [$titanfallVal]`n- Cancel to keep the value as it is.", "Warning", "OKCancel", "Warning")
        if ($result -eq "OK") {
            # Set the value to the proper value if the user hits OK
            [System.Environment]::SetEnvironmentVariable($titanfall, $titanfallVal)
            [System.Windows.MessageBox]::Show("Environment variable for Titanfall [$titanfall] has been updated to: ~0x200000200000000`nHave fun playing Titanfall 2!", "Information", "OK")
        } else {
            # Inform the user that the variable is kept as it is
            [System.Windows.MessageBox]::Show("Environment variable $titanfall is kept as it is.`nHave fun playing Titanfall 2!", "Information", "OK")
        }
    }
} else {
    # If the environment variable doesn't exist, create it with the proper value
    [System.Environment]::SetEnvironmentVariable($titanfall, $titanfallVal)
    [System.Windows.MessageBox]::Show("Environment variable for Titanfall [$titanfall] has been created with value: $titanfallVal`nHave fun playing Titanfall 2!", "Information", "OK")
}
