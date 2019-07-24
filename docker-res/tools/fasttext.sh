#!/bin/sh
if ! hash fasttext 2>/dev/null; then
    echo "Installing Fasttext"
    mkdir $RESOURCES_PATH"/fasttext"
    cd $RESOURCES_PATH"/fasttext"
    wget --quiet https://github.com/facebookresearch/fastText/archive/v0.9.1.zip
    unzip -q v0.9.1.zip
    rm v0.9.1.zip
    cd fastText-0.9.1
    # Surpress output - if there is a problem remove to see logs > /dev/null
    make > /dev/null
    chmod -R a+rwx $RESOURCES_PATH"/fasttext"
    cp "fasttext" /usr/local/bin
    # cd back otherwise clean layer will fail since it is deleted
    cd $RESOURCES_PATH
    rm -r $RESOURCES_PATH"/fasttext"
    # pip install moved to requirements file
fi

# Run
echo "Use fasttext via command line:"
fasttext --help
sleep 10