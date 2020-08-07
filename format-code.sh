#!/usr/bin/env sh

pwd
ls -a
mkdir -p .cache

pwd
ls -a
cd .cache

pwd
ls -a

if [ ! -f google-java-format-1.8-all-deps.jar ]
then
    echo "curl"
    curl -LJO "https://github.com/google/google-java-format/releases/download/google-java-format-1.8/google-java-format-1.8-all-deps.jar"
    pwd
    ls
    echo "chmod"
    chmod 755 google-java-format-1.8-all-deps.jar
    pwd
    ls
fi
cd ..

pwd
ls

changed_java_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" )
echo $changed_java_files
java -jar google-java-format-1.8-all-deps.jar --replace $changed_java_files
mv google-java-format-1.8-all-deps.jar .cache/
