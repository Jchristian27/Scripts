#!/bin/zsh

#create ~/Desktop/Onlypost if it doesn't exist
mkdir -p ~/Desktop/Onlypost

#remove existing creds.py so this can be run again
rm -f ~/Desktop/Onlypost/creds.py

#prompt user for input
vared -p "Enter your Reddit username: " -c username_var
vared -p "Enter your Reddit password: " -c password_var
vared -p "Enter your Reddit client_id: " -c clientID_var
vared -p "Enter your Reddit client_secret: " -c clientSecret_var
vared -p "Enter your Reddit refresh token: " -c refreshToken_var

# trim whitespace and create creds.py file with all of the necessary variables
username_var=`echo $username_var | tr -d '[:space:]'`
password_var=`echo $password_var | tr -d '[:space:]'`
clientID_var=`echo $clientID_var | tr -d '[:space:]'`
clientSecret_var=`echo $clientSecret_var | tr -d '[:space:]'`
refreshToken_var=`echo $refreshToken_var | tr -d '[:space:]'`

echo "your_username = \"$username_var\"" > ~/Desktop/Onlypost/creds.py
echo "your_password = \"$password_var\"" >> ~/Desktop/Onlypost/creds.py
echo "your_client_id = \"$clientID_var\"" >> ~/Desktop/Onlypost/creds.py
echo "your_user_agent = \"onlypost by u/$username_var\"" >> ~/Desktop/Onlypost/creds.py
echo "your_redirect_uri = \"http://localhost:8080\"" >> ~/Desktop/Onlypost/creds.py
echo "your_client_secret = \"$clientSecret_var\"" >> ~/Desktop/Onlypost/creds.py
echo "your_refresh_token = \"$refreshToken_var\"" >> ~/Desktop/Onlypost/creds.py
echo "  "
echo "[Process Complete!]"
echo "  "
echo "  "
echo "Your Reddit Username on file is: $username_var"
echo "Your Reddit Password on file is: $password_var"
echo "If your login credentials above are accurate then close this window."
echo "If your login credentials above are not accurate then please close this window and repeat steps one and two from the Creds section."
