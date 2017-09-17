#!/bin/bash
# Lists the most recent news from the First Hand Foundation
# cerner_2^5_2017

# Once we have the raw website data, we want to locate only the article sections
# After we find the raw titles, strip out everything except the headline URL and title
articles=$(curl -sk https://www.firsthandfoundation.org/news/ | sed -n "/<article .*>/,/<\/article>/p" | sed -n "/<h2>/,/<\/h2>/p" | grep "<a href=\".*\" title="| grep -v "rel=\"author\""| sed 's/\<\/a\>/\'$'\n/g')

echo 'Most Recent First Hand Foundation News'

# Allows us to split the string on new line characters rather than spaces
export IFS='\'$'\n'
# Our regex to identify the news URL and title
regex_txt='^.*\href=\"(.*)\" title=\"(.*)\".*$'

for news_item in $articles
do
    if [[ $news_item =~ $regex_txt ]] ; then
        url=${BASH_REMATCH[1]}
        title=${BASH_REMATCH[2]}
        echo "$title -- Learn more at: $url"
    fi
done

