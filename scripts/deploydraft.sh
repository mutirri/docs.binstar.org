COMMIT_HASH=`git show --quiet | head -n1`
VERSION=`python -c "print '$COMMIT_HASH'.split()[-1][:8]"`
BUCKET="docs.binstar.org"

# git tag "$VERSION"
hyde gen

s3cmd -c .s3cfg sync --recursive deploy/ s3://"$BUCKET"/draft/

# echo "Don't Forget to update the binstar_app Config file! VERSION=$VERSION"
echo 
echo "CDN URL is: http://docs.binstar.org.s3-website-us-east-1.amazonaws.com/draft" 
echo "Website is: docs.binstar.org/draft"
