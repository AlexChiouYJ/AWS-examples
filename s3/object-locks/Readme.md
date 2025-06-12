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

# Check the bucket object-lock is enabled
aws s3api get-object-lock-configuration --bucket object-lock-fun-ab-0610

