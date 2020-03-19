#!/usr/bin/env bash

mkdir -p work
fastutilmin="work/fastutil-min.jar"
if [ ! -f $fastutilmin ]; then
  fastutil="work/fastutil.jar"
  if [ ! -f $fastutil ]; then
    echo "Downloading fastutil 8.3.1..."
    fastutilsource="https://repo1.maven.org/maven2/it/unimi/dsi/fastutil/8.3.1/fastutil-8.3.1.jar"

    if hash "wget" 2>/dev/null; then
      wget --quiet -O $fastutil $fastutilsource
    elif hash "curl" 2>/dev/null; then
      curl -s -o $fastutil $fastutilsource
    elif hash "fetch" 2>/dev/null; then
      # Handle the weirdness that is the Canyon build server, since it runs FreeBSD
      fetch -q -o $fastutil $fastutilsource
    else
      echo "I don't know how to download fastutil on your system!"
      echo "Download $fastutilsource to $fastutil and retry building Canyon."
      exit 1
    fi

    # Silencing shellcheck - this is intentional, there are multiple possibilities for the command we need to run
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
      echo "Unable to download fastutil"
      exit 1
    fi
  fi

  echo "Creating minimized fastutil jar..."
  ./scripts/util/fastutil-find-deps.sh minimize $fastutil scripts/fastutil-deps.txt
  if [ ! -f $fastutilmin ]; then
    echo "Unable to minimize fastutil"
    exit 1
  fi

  # Maven is pedantic and needs a clean working directory
  tmpdir=$(mktemp -d -t "canyon-maven-init.XXXX")
  canyondir=$(pwd)
  pushd "$canyondir" 1>/dev/null || (echo "Can't push directory on stack" && exit 1)
  cd "$tmpdir" || (echo "Can't move to work directory" && exit 1)

  echo "Installing minimized fastutil jar into local repository..."
  if ! mvn -q org.apache.maven.plugins:maven-install-plugin:2.3.1:install-file \
                         -Dfile="$canyondir/$fastutilmin" -DgroupId=com.canyonmodded \
                         -DartifactId=fastutil-min -Dversion=8.3.1 \
                         -Dpackaging=jar -DlocalRepositoryPath="$canyondir/work/local-repo"
  then
    echo "Unable to install minimized fastutil into local work repository"
    exit 1
  fi
  popd 1>/dev/null || exit 1
fi