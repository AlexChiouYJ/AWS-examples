## Create a new s3 bucket
```md
aws s3 mb s3://checksum-examples-ab-0607
```

## Create a new file that we will do checksum on 
```
echo "Hello Mars"> my file.txt
```

## Get a checksum of a file for md5
```md
md5sum myfile.txt
# 8ed2d86f12620cdba4c976ff6651637f  myfile.txt
```

## Upload our file and look at its etag
```
aws s3 cp myfile.txt s3://checksum-examples-ab-0607
aws s3api head-object --bucket checksum-examples-ab-0607 --key myfile.txt
```
## Lets upload a file with a different kind of checksum

```
bundle exc ruby crc.rb
```

```sh
sudo apt-get install rhash -y
rhash --crc32 --simple myfile.txt
```

```sh
aws s3api put-object \
  --bucket "checksum-examples-ab-0607" \
  --key "myfile.txt" \
  --body "myfile.txt" \
  --checksum-algorithm "CRC32" \
  --checksum-crc32 "58ALhw=="

#以下可替換檢查checksum
#--checksum-algorithm "SHA1" \

# --checksum-crc32 "e7c80b87" \this is hexadecimal and needs to be encoded to base64 
  # https://emn178.github.io/online-tools/base64_encode.html

# use the python below to find out base64 format
  # python3 -c "import base64; print(base64.b64encode(bytes.fromhex('e7c80b87')).decode())"

# "ETag": "\"8ed2d86f12620cdba4c976ff6651637f\"",
# "ChecksumCRC32": "58gLhw=="
# "ETag": "\"8ed2d86f12620cdba4c976ff6651637f\"",
# "ChecksumSHA1": "wozMLF4hQDaAYBTfn7Q2NPPncLI=",
```