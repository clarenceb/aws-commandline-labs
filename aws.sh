#!/bin/bash

function setup_bundler() {
  gem list | grep bundler || {
    echo "Installing bundler..."
    gem install bundler --no-rdoc --no-ri
  }
}

function setup_dependencies() {
  bundle check || bundle install
}

function export_aws_credentials() {
  if [ ! -f "aws-credentials.txt" ]; then
    echo "Missing 'aws-credentials' file; please create it form the template with your credentials."
    exit 1
  fi
  AWS_CREDENTIALS=`cat aws-credentials.txt`
  for CREDENTAL in $AWS_CREDENTIALS
  do
    export $CREDENTAL
  done
}

function run() {
  if [ "$#" == "0" ]; then
    echo "Missing Ruby file to execute"
    exit 1
  fi
  setup_bundler
  setup_dependencies
  export_aws_credentials
  bundle exec ruby "$@"
}

run "$@"
