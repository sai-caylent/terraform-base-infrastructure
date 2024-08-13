<powershell>

Set-ExecutionPolicy Unrestricted -Force

# Define the URL for the latest SSM Agent
$ssmAgentUrl = "https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe"
$ssmAgentLocalPath = "C:\Temp\AmazonSSMAgentSetup.exe"

# Define the URL for the latest CloudWatch Agent
$cloudWatchAgentUrl = "https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi"
$cloudWatchAgentLocalPath = "C:\Temp\amazon-cloudwatch-agent.msi"

# Create the directory C:\Temp if it does not exist
New-Item -Path 'C:\Temp' -ItemType Directory -Force

# Download the Amazon SSM Agent installer to the specified local path
Invoke-WebRequest -Uri $ssmAgentUrl -OutFile $ssmAgentLocalPath

# Start the SSM Agent installer and wait for it to complete
Start-Process -FilePath $ssmAgentLocalPath -ArgumentList "/S" -Wait

# Download the CloudWatch Agent installer to the specified local path
Invoke-WebRequest -Uri $cloudWatchAgentUrl -OutFile $cloudWatchAgentLocalPath

# Start the CloudWatch Agent installer and wait for it to complete
Start-Process -FilePath $cloudWatchAgentLocalPath -ArgumentList "/quiet" -Wait

# Create CloudWatch Agent configuration file
$cloudWatchConfigPath = "C:\Temp\cloudwatch-config.json"
$cloudWatchConfigContent = @"
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "C:\\ProgramData\\Amazon\\EC2-Windows\\Launch\\Log\\UserdataExecution.log",
            "log_group_name": "ec2/windows/userdata",
            "log_stream_name": "{instance_id}"
          }
        ]
      }
    }
  }
}
"@
Set-Content -Path $cloudWatchConfigPath -Value $cloudWatchConfigContent

# Start the CloudWatch Agent with the configuration file
& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m ec2 -c file:$cloudWatchConfigPath -s

</powershell>