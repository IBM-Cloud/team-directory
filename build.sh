#first copy the terraform output to a creds file
cd terraform
terraform output -json > ../creds.json
cd ..

#create the cloudant URL from the creds file
export CLOUDANT_URL=`cat creds.json | jq '.cloudant_credentials.value.url' | sed 's/"//g'`

#create the cloudant API Key from the creds file
export CLOUDANT_APIKEY=`cat creds.json | jq '.cloudant_credentials.value.apikey' | sed 's/"//g'`

export DBNAME='directory'

#create the redis URL from the creds file
export REDIS_URL=`cat creds.json | jq '.redis_credentials.value["connection.cli.arguments.0.1"]' | sed 's/"//g'`

#create the certificate in the current dir
export REDIS_CERT=`cat creds.json | jq '.redis_credentials.value["connection.cli.certificate.certificate_base64"]' | sed 's/"//g'`

#now run the service
npm run start