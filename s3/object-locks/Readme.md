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

# Delete the versioned file
# 遇到current versioned cant be deleted, needs bypass governance retention
aws s3api delete-object --bucket="object-lock-fun-ab-0610" --key "gov1.txt" --version-id="NWuIEynF2E27.kE9ht_BYbbErmBkAYze" --bypass-governance-retention

## Use compliance mode for s3 object

aws s3api put-object --bucket="object-lock-fun-ab-0610" --key "gov.txt" --body="compliance.txt" --object-lock-mode COMPLIANCE --object-lock-retain-until-date="2025-06-19T18:00:00Z"

# try and delete specific version
aws s3api delete-object --bucket="object-lock-fun-ab-0610" --key "gov.txt" --version-id="FRHNbK1TLGTcF_bVwU7a7rDpzaJZw1J5" --bypass-governance-retention

# Legal hold
## 用touch直接新增txt在目錄內
touch legal.txt
# copy到bucket
aws s3 cp legal.txt s3://object-lock-fun-ab-0610/legal.txt

aws s3api put-object-legal-hold --bucket "object-lock-fun-ab-0610" --key "legal.txt" --legal-hold Status=ON

aws s3api list-object-versions --bucket object-lock-fun-ab-0610
PYZTTyknxn6GPm8.Ygpcp8dKRzbnyXtp
# 先關掉legal hold再delete version(需bypass governance)

aws s3api put-object-legal-hold --bucket "object-lock-fun-ab-0610" --key "legal.txt" --version-id="PYZTTyknxn6GPm8.Ygpcp8dKRzbnyXtp" --legal-hold Status=OFF

aws s3api delete-object --bucket="object-lock-fun-ab-0610" --key "legal.txt" --version-id="PYZTTyknxn6GPm8.Ygpcp8dKRzbnyXtp" --bypass-governance-retention