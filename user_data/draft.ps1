# Define the username and password for the new local administrator account
$username = "localadmin"
$password = "P@ssw0rd!"

# Convert the password to a secure string
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

# Create the new local user
New-LocalUser -Name $username -Password $securePassword -FullName "New Local Admin User" -Description "Local Administrator Account" -PasswordNeverExpires -AccountNeverExpires

# Add the new user to the Administrators group
Add-LocalGroupMember -Group "Administrators" -Member $username

# Output the result
Write-Host "Local admin user '$username' created and added to Administrators group."


# Variables
$domainName = "halon.local"  # Specify your domain name
$netbiosName = "HALON"       # Specify your NetBIOS name
$safeModeAdminPassword = "P@ssw0rd!"  # Specify the Directory Services Restore Mode (DSRM) password
$adminPassword = ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force  # Specify the local admin password


# Install the AD-Domain-Services feature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Install the DNS feature
Install-WindowsFeature -Name DNS -IncludeManagementTools

# Install the AD DS Deployment module
Import-Module ADDSDeployment

# Promote the server to a domain controller
Install-ADDSForest `
    -DomainName $domainName `
    -DomainNetbiosName $netbiosName `
    -SafeModeAdministratorPassword (ConvertTo-SecureString $safeModeAdminPassword -AsPlainText -Force) `
    -InstallDNS `
    -Force:$true `
    -NoRebootOnCompletion:$true

# Restart the instance to complete the installation
Restart-Computer -Force