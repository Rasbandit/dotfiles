#!/bin/bash

# echo wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-$(curl -s "https://slack.com/intl/es/release-notes/linux" | xmllint --html --xpath '//h2' - 2>/dev/null | head -n1 | sed 's/<h2>//;s#</h2>##;s/Slack //')-amd64.deb"

curl -s https://slack.com/release-notes/linux | sed -n "/^.*<h2>Slack /{;s///;s/[^0-9.].*//p;q;}"