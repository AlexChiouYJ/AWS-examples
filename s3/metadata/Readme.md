## Create a bucket

aws s3 mb s3://metadata-fun-ab-0610

### Create a new file

echo "Hello Mars" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-ab-0610 --key hello.txt --metadata Plant=Mars

## Get Metadata through head object

aws s3api head-object --bucket metadata-fun-ab-0610 --key hello.txt

