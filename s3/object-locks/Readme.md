## Create a new folder
```sh
aws s3 mb s3://object-lock-fun-ab-0610
```

## Turn on Versioning
aws s3api put-bucket-versioning --bucket object-lock-fun-ab-0610 --versioning-configuration Status=Enabled

## Turn on Object Locking
# 文字與' 要空一格，'與{}相連。{}外用單影號，{內用雙引號}
aws s3api put-object-lock-configuration \
--bucket object-lock-fun-ab-0610 \
--object-lock-configuration '{
  "ObjectLockEnabled": "Enabled",
    "Rule": {
      "DefaultRetention": {
        "Mode": "GOVERNANCE",
        "Days": 1
   }
  }
}'

## Turn on Object Locking by running .json
# json file內{}前後不可有單引號
aws s3api put-object-lock-configuration \
--bucket object-lock-fun-ab-0612 \
--object-lock-configuration file://default.json

# Check the bucket object-lock is enabled
aws s3api get-object-lock-configuration --bucket object-lock-fun-ab-0610

# New file and upload
echo "This is the gov" > gov.txt

# Delete the file
aws s3 rm s3://object-lock-fun-ab-0610/gov.txt

# List object versions
aws s3api list-object-versions --bucket object-lock-fun-ab-0610 --key gov.txt

# Delete versioned file
aws s3api get-object-versions --bucket object-lock-fun-ab-0610 --key gov.txt
