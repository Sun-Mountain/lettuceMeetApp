# release-tasks.sh

## Step to execute
bundle exec rails db:migrate

# check for a good exit
if [ $? -ne 0 ]
then
  # something went wrong; convey that and exit
  exit 1
fi