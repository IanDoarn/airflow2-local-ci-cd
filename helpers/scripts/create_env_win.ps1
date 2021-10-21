# Make sure powershell is allowed to execute scripts
$scope = Get-ExecutionPolicy
if ([string]$scope = "RemoteSigned") {
    "All is good."
} else {
    try {
        Set-ExecutionPolicy RemoteSigned
        Get-ExecutionPolicy
    } catch {
        Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
        Get-ExecutionPolicy
    }
}

# Create the virtual env
cd ../..
python -m venv winenv

# activate it
.\winenv\Scripts\activate