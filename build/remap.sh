#!/bin/bash

MINECRAFT_SERVER_JAR="../../server/1.7.3.jar"
SPECIALSOURCE_JAR="./tools/SpecialSource-1.8.6-SNAPSHOT-shaded.jar"
MAPPINGS_DIR="../../BetaMappings"

WORKDIR=`mktemp -d`

# First, remap the server-specific mappings to move them out of the way.
java -jar ${SPECIALSOURCE_JAR} -m ${MAPPINGS_DIR}/server.tsrg -i ${MINECRAFT_SERVER_JAR} --only . --only net/minecraft -o ${WORKDIR}/remapped-server-only.jar
# Now move server-specific classes out of the day
java -jar ${SPECIALSOURCE_JAR} -m ${MAPPINGS_DIR}/serverToClientObf.tsrg -i ${WORKDIR}/remapped-server-only.jar --only . --only net/minecraft -o ${WORKDIR}/remapped-server-moved.jar
# Finally, apply client remappings.
java -jar ${SPECIALSOURCE_JAR} -m ${MAPPINGS_DIR}/client.tsrg -i ${WORKDIR}/remapped-server-moved.jar --only . --only net/minecraft -o ./remapped-1.7.3.jar

echo $WORKDIR
