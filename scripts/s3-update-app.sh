dir="public/app"
for f in "$dir"/*; do
  IFS='/' read -r -a names <<< "$f"
  echo "${names[2]}"
  aws s3api put-object \
    --acl "public-read" \
    --bucket "gql-v1" \
    --key "app/${names[2]}" \
    --body "$f" \
    --content-type "text/html"
done